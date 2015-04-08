class Question < ActiveRecord::Base
  has_many :answers
  has_many :votes
  validates :title, :content, :presence => true
end
