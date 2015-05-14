class Project < ActiveRecord::Base
  belongs_to :user
  has_many :rewards
  has_many :pledges

  accepts_nested_attributes_for :rewards, :reject_if => :all_blank, :allow_destroy => true
  mount_uploader :image, ImageUploader
end
