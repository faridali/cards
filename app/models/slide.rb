class Slide < ActiveRecord::Base
  attr_accessible :content, :status_id, :id, :image
  belongs_to :status

  validates :content, length: { minimum: 0, maximum: 200 }

  acts_as_list

  mount_uploader :image, ImageUploader

end
