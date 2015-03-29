class Assessment < ActiveRecord::Base
  attr_accessor :max_points, :subassessment_counter, :author_name
  attr_accessible :max_points, :subassessment_counter, :author_name

  belongs_to :user

  has_many :subassessments, dependent: :destroy
  has_many :performances, dependent: :destroy
  has_many :assessment_contents, dependent: :destroy
  has_many :knowledge_elements, through: :assessment_contents

  has_attached_file :image
  do_not_validate_attachment_file_type :image

  before_create :defaultvalue

  def defaultvalue
    self.min_points_1 ||= 0
  end

  def tags
    tags = ""
    self.knowledge_elements.each do |c|
      tags = tags + c.tag + ", "
    end
    # here we have @existing_tags = "tag1, tag2, ... , tag23, " , so we need to take away the last two chars
    tags = tags.chop.chop
    return tags
  end

  def subassessment_counter
    return Subassessment.where(assessment_id: self.id).length
  end

  def max_points
    return Subassessment.where(assessment_id: self.id).map{ |s| s.points}.sum
  end

  def author_name
    return self.user.username
  end
end
