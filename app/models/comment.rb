class Comment < ActiveRecord::Base
  belongs_to :photo

  validates :content, :presence => true, :uniqueness => { :scope => :user_id }

  validates :user_id, :presence => true, :uniqueness => { :scope => :photo_id }

  validates :photo_id, :presence => true
end
