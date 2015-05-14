class Reward < ActiveRecord::Base
  belongs_to :project
  has_many :pledges

  def sold_out?
    backer_limit <= pledges.count
  end
end
