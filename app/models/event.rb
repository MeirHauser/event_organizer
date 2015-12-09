class Event < ActiveRecord::Base
  belongs_to :user
  has_many :attendings, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :date, presence: true
end
