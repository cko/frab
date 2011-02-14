class Event < ActiveRecord::Base

  has_many :event_attachments
  has_many :event_people
  has_many :people, :through => :event_people

  has_attached_file :logo, :styles => {:tiny => "16x16>", :small => "32x32>", :large => "128x128>"}

  validates_attachment_content_type :logo, :content_type => [/jpg/, /jpeg/, /png/, /gif/]
end
