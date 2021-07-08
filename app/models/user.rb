class User < ApplicationRecord
  has_secure_password
  has_many :records

  validates :name, presence: true, uniqueness: true, length: {maximum: 10}
  validates :sex, presence: true
  validates :job, presence: true, length: {maximum: 30}
  validates :age, presence: true, numericality: {in: 0..100}
  validates :password, presence: true, length: {minimum: 6}
end
