require 'socket'
require 'openssl'
require "active_support"

module Caliper
  module Consumer
    class Socket < Queue
      attr_reader :socket

      def initialize(key, opts = {})
        super
      end

      def validate_options(opts)
        hsh = super(opts)
        hsh[:timeout] = opts[:timeout] || 0.5
        hsh[:host] = opts[:host] || "localhost"
        hsh[:port] = opts[:port] || ( hsh[:ssl] ? 443 : 80 )
        hsh[:max_response_size] = opts[:max_response_size] || 2048
        hsh
      end

      private

      def flush_describe(item)
        socket = init_socket
        return unless socket

        send_request( socket, describe_body( @options[:host], ActiveSupport::JSON.encode(item)) )
      end

      def flush_measure(item)
        socket = init_socket
        return unless socket

        send_request( socket, measure_body( @options[:host], ActiveSupport::JSON.encode(item)) )
      end

      # both describe_body and measure_body hardcode a URL as is the case with caliper-php
      # todo: make this configurable
      def describe_body(host, content)
        <<-STR.gsub(/^ {10}/,'')
          PUT /v1/describe HTTP/1.1/
          Host: #{host}
          Content-Type: application/json
          Accept: application\json
          Content-length: #{content.length}
          
          #{content}
        STR
      end

      def measure_body(host, content)
        <<-STR.gsub(/^ {10}/,'')
          PUT /v1/learningevent HTTP/1.1/
          Host: #{host}
          Content-Type: application/json
          Accept: application\json
          Content-length: #{content.length}
          
          #{content}
        STR
      end

      def init_socket
        # if socket has failed, don't keep trying to connect on future events
        return if @socket_failed
        begin
          s = TCPSocket.new(@options[:host], @options[:port])
          if with_ssl?
            s = OpenSSL::SSL::SSLSocket.new(s)
            s.sync_close
            s.connect
          end
        rescue SocketError => e
          on_error(e)
          @socket_failed = true
          return
        end
        s
      end

      def send_request(socket, body, with_retries = 1)
        written = 0
        closed = false
        while !closed && bytes_written < body.bytesize
          begin
             bytes_written = socket.write(body[bytes_written..-1])
            if bytes_written.zero?
              closed = true
            else
              written += bytes_written
            end
          rescue SocketError => e
            on_error(e)
            closed = true
          end
        end

        if closed
          socket.close
          # attempt to retry connection up to with_retries times
          unless with_retries.zero?
            socket = init_socket
            return send_request(socket, body, with_retries - 1) if socket
          end
          return false
        end

        success = true

        # if debug is enabled, wait for response
        if with_debug?
          r = parse_response(socket.read(@options[:max_response_size]))
          unless r.status == 200
            #todo build exception and send it to on_error
            success = false
          end
        end

        return success
      end

      def parse_response(resp)
        contents = resp.split("\n")
        status = contents.first.split(" ")
        OpenStruct.new(:status => (status.length > 1 ? status[1] : nil), :message => contents.last) 
      end

    end
  end
end
