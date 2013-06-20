class Status < ActiveRecord::Base
  attr_accessible :content, :user_id
  belongs_to :user

  validates :content, presence: true,
  					  length: { minimum: 1, maximum: 200 }

  validates :user_id, presence: true

  has_many :slides, :dependent => :destroy

end
