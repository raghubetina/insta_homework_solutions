class Following < ActiveRecord::Base
  belongs_to :leader, :class_name => "User", :foreign_key => "leader_id"
  belongs_to :follower, :class_name => "User", :foreign_key => "follower_id"

  validates :follower_id, :uniqueness => { :scope => :leader_id }
end
