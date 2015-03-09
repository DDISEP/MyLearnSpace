class AssessmentContent < ActiveRecord::Base
  belongs_to :assessment
  belongs_to :knowledge_element
end
