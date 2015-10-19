class Answer < ActiveRecord::Base
  belongs_to :word
  has_many :results
  
  validates :word_id, presence: true
end
