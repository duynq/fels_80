class Answer < ActiveRecord::Base
  has_many :results
  
  validates :word_id, presence: true
end
