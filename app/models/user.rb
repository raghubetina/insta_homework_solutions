class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :own_photos, :class_name => "Photo", :foreign_key => "user_id", :dependent => :destroy

  has_many :favorites, :dependent => :destroy

  has_many :favorite_photos, :through => :favorites, :source => :photo

  has_many :followings_where_follower, :class_name => "Following", :foreign_key => "follower_id"

  has_many :leaders, :through => :followings_where_follower, :source => :leader

  has_many :timeline, :through => :leaders, :source => :own_photos

  # def leaders
  #   users = []

  #   followings_where_follower.each do |following|
  #     users.push(following.leader)
  #   end

  #   return users
  # end

  # def timeline
  #   photos = []

  #   leaders.each do |user|
  #     photos.push(user.own_photos)
  #   end

  #   return photos.flatten
  # end
end
















