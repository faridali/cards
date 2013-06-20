class Publish < ActiveRecord::Base
attr_accessible :status_id
  belongs_to :status
end
