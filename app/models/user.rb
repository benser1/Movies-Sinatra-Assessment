class User < ActiveRecord::Base

  has_secure_password
  has_many :movies
  validates_uniqueness_of :name
  validates_uniqueness_of :email

end