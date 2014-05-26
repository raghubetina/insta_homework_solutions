class Photo < ActiveRecord::Base
  belongs_to :user

  has_many :comments

  has_many :favorites

  has_many :fans, :through => :favorites, :source => :user
end
