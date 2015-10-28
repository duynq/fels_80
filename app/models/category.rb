class Category < ActiveRecord::Base
  has_many :lessons, dependent: :destroy
  has_many :words, dependent: :destroy
  accepts_nested_attributes_for :words, :lessons

  validates :name, presence: true, length: {maximum: 50},
    uniqueness: {case_sensitive: false}
  validates :description, presence:true, length: {maximum: 100},
    uniqueness: {case_sensitive: false}

end
