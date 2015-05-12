class Project < ActiveRecord::Base
  has_many :rewards
  belongs_to :user
  has_many :pledges

  accepts_nested_attributes_for :rewards, :reject_if => :all_blank, :allow_destroy => true
end
