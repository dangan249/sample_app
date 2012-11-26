class Micropost < ActiveRecord::Base
  attr_accessible :content
=begin
The use of "attr_accessible" together with this config line
   config.active_record.whitelist_attributes = true
--> prevent mass assignment security error
=end
  belongs_to :user

  validates :content, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
  
  default_scope order: 'microposts.created_at DESC'
end