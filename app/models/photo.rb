class Photo < ActiveRecord::Base
  belongs_to :user

  has_many :comments

  has_many :favorites

  has_many :fans, :through => :favorites, :source => :user

  validates :image_url, :presence => true, :uniqueness => { :scope => :caption }

  validates :user_id, :presence => true
end
