##
# This file is part of IMS Caliper Analytics™ and is licensed to
# IMS Global Learning Consortium, Inc. (http://www.imsglobal.org)
# under one or more contributor license agreements.  See the NOTICE
# file distributed with this work for additional information.
#
# IMS Caliper is free software: you can redistribute it and/or modify it under
# the terms of the GNU Lesser General Public License as published by the Free
# Software Foundation, version 3 of the License.
#
# IMS Caliper is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE.  See the GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License along
# with this program. If not, see http://www.gnu.org/licenses/.

#
# LTI LIS roles.
#
module Caliper
  module Entities
    module LIS
      module Role
        LEARNER = 'Learner'
        EXTERNAL_LEARNER = 'ExternalLearner'
        GUEST_LEARNER = 'GuestLearner'
        LEARNER_INSTRUCTOR = 'Instructor'
        LEARNER_LEARNER = 'Learner'
        NONCREDIT_LEARNER = 'NonCreditLearner'

        INSTRUCTOR = 'Instructor'
        EXTERNAL_INSTRUCTOR = 'ExternalInstructor'
        GUEST_INSTRUCTOR = 'GuestInstructor'
        LECTURER = 'Lecturer'
        PRIMARY_INSTRUCTOR = 'PrimaryInstructor'

        ADMINISTRATOR = 'Administrator'
        ADMINISTRATOR_ADMINISTRATOR = 'Administrator'
        ADMINISTRATOR_DEVELOPER = 'Developer'
        ADMINISTRATOR_SUPPORT = 'Support'
        ADMINISTRATOR_SYSTEM_ADMINISTRATOR = 'SystemAdministrator'

        ADMINISTRATOR_EXTERNAL_DEVELOPER = 'ExternalSupport'
        ADMINISTRATOR_EXTERNAL_SUPPORT = 'ExternalDeveloper'
        ADMINISTRATOR_EXTERNAL_SYSTEM_ADMINISTRATOR = 'ExternalSystemAdministrator'

        CONTENT_DEVELOPER = 'ContentDeveloper'
        CONTENT_DEVELOPER_CONTENT_DEVELOPER = 'ContentDeveloper'
        CONTENT_DEVELOPER_LIBRARIAN = 'Librarian'
        CONTENT_DEVELOPER_CONTENT_EXPERT = 'ContentExpert'
        CONTENT_DEVELOPER_EXTERNAL_CONTENT_EXPERT = 'ExternalContentExpert'

        MANAGER = 'Manager'
        MANAGER_AREA_MANAGER = 'AreaManager'
        MANAGER_COURSE_COORDINATOR = 'CourseCoordinator'
        MANAGER_OBSERVER = 'Observer'
        MANAGER_EXTERNAL_OBSERVER = 'ExternalObserver'

        MEMBER = 'Member'
        MEMBER_MEMBER = 'Member'

        MENTOR = 'Mentor'
        MENTOR_MENTOR = 'Mentor'
        MENTOR_ADVISOR = 'Advisor'
        MENTOR_AUDITOR = 'Auditor'
        MENTOR_REVIEWER = 'Reviewer'
        MENTOR_TUTOR = 'Tutor'
        MENTOR_LEARNING_FACILITATOR = 'LearningFacilitator'

        MENTOR_EXTERNAL_MENTOR = 'ExternalMentor'
        MENTOR_EXTERNAL_ADVISOR = 'ExternalAdvisor'
        MENTOR_EXTERNAL_AUDITOR = 'ExternalAuditor'
        MENTOR_EXTERNAL_REVIEWER = 'ExternalReviewer'
        MENTOR_EXTERNAL_TUTOR = 'ExternalTutor'
        MENTOR_EXTERNAL_LEARNING_FACILITATOR = 'ExternalLearningFacilitator'

        TEACHING_ASSISTANT = 'TeachingAssistant'
        TEACHING_ASSISTANT_TEACHING_ASSISTANT = 'TeachingAssistant'
        TEACHING_ASSISTANT_GRADER = 'Grader'
        TEACHING_ASSISTANT_TEACHING_ASSISTANT_SECTION = 'TeachingAssistantSection'
        TEACHING_ASSISTANT_TEACHING_ASSISTANT_SECTION_ASSOCIATION = 'TeachingAssistantSectionAssociation'
        TEACHING_ASSISTANT_TEACHING_ASSISTANT_OFFERING = 'TeachingAssistantOffering'
        TEACHING_ASSISTANT_TEACHING_ASSISTANT_TEMPLATE = 'TeachingAssistantTemplate'
        TEACHING_ASSISTANT_TEACHING_ASSISTANT_GROUP = 'TeachingAssistantGroup'
      end
    end
  end
end
