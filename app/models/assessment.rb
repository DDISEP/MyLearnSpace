class Assessment < ActiveRecord::Base
  attr_accessor :like_counter, :max_points, :subassessment_counter, :author_name
  attr_accessible :like_counter, :max_points, :subassessment_counter, :author_name

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :subassessments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :performances, dependent: :destroy
  has_many :assessment_contents, dependent: :destroy
  has_many :knowledge_elements, through: :assessment_contents

  def tags
    tags = ""
    self.knowledge_elements.each do |c|
      tags = tags + c.tag + ", "
    end
    # here we have @existing_tags = "tag1, tag2, ... , tag23, " , so we need to take away the last to chars
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
