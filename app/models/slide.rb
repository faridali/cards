class Slide < ActiveRecord::Base
  attr_accessible :content
  belongs_to :status

  validates :content, presence: true,
  					  length: { minimum: 1, maximum: 200 }
end
