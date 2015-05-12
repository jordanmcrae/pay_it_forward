class Project < ActiveRecord::Base
  has_many :rewards
  belongs_to :user
  has_many :pledges
end
