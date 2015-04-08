class Answer < ActiveRecord::Base
  belongs_to :question
  has_many :ansvotes
  validates_presence_of :question

  validates :title, :content, :presence => true
end
