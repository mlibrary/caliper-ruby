# IMS Global Learning Consortium, Inc.

# caliper-ruby

The [Caliper Analytics&reg; Specification](https://www.imsglobal.org/caliper/v1p1/caliper-spec-v1p1) 
provides a structured approach to describing, collecting and exchanging learning activity data at 
scale. Caliper also defines an application programming interface (the Sensor API&trade;) for marshalling and 
transmitting event data from instrumented applications to target endpoints for storage, analysis and use.  

*caliper-ruby* is a reference implementation of the Sensor API&trade; written in Ruby.

## Branches
* __master__: stable, deployable branch that stores the official release history.  
* __develop__: unstable development branch.  Current work that targets a future release is merged to 
this branch.

## Tags
*caliper-ruby* releases are tagged and versioned MAJOR.MINOR.PATCH\[-label\] (e.g., 1.1.1). 
Pre-release tags are identified with an extensions label (e.g., "1.2.0-RC01").  The tags are stored in this repository.

## Contributing
We welcome the posting of issues by non IMS Global Learning Consortium members (e.g., feature 
requests, bug reports, questions, etc.) but we *do not* accept contributions in the form of pull 
requests from non-members. See [CONTRIBUTING.md](./CONTRIBUTING.md) for more 
information.

## Getting Started
1. *Read* the [Caliper Analytics&reg; Specification](https://www.imsglobal.org/caliper/v1p1/caliper-spec-v1p1).  
2. Fork the IMS Global *caliper-js* project to your Github account and clone your copy to a local 
development machine.
3. Ensure you have ruby, bundler, rspec installed 
4. Run the installer to set up the development environment:
    ```
    $ bundle install
    ```
5. Run the test specs:
    ```
    $ rspec spec` # runs all specs
    ```

#### Note
To run specs, you need to clone [caliper-common-fixtures](https://github.com/IMSGlobal/caliper-common-fixtures) 
at the same level as *caliper-ruby*. Then create a symlink similar to

```
➜ caliper-ruby git:(master) ln -s ../../caliper-common-fixtures/src/test/resources/fixtures ./spec/fixtures

```

## Generate the Ruby Gem
```
$ gem build caliper.gemspec
```

## License
This project is licensed under the terms of the GNU Lesser General Public License (LGPL), version 3. 
See the [LICENSE](./LICENSE) file for details. For additional information on licensing options for 
IMS members, please see the [NOTICE](./NOTICE.md) file.

©2018 IMS Global Learning Consortium, Inc. All Rights Reserved.
Trademark Information - http://www.imsglobal.org/copyright.html
