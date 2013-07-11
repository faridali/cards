class Slide < ActiveRecord::Base
  attr_accessible :content, :status_id, :id
  belongs_to :status

  validates :content, presence: true,
  					  length: { minimum: 1, maximum: 200 }

  acts_as_list

end
