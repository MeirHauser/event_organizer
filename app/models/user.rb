class User < ActiveRecord::Base
  has_secure_password

  has_many :events, dependent: :destroy
  has_many :attendings, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :first_name, :last_name, presence: true
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :password, presence: true, confirmation: true
  validates :location, presence: true
  validates :state, presence: true, length: { is: 2 }

  before_save do 
  	self.state.upcase!
  end
end
