class User < ApplicationRecord
  has_secure_password
  has_many :records

  validates :name, presence: true, uniqueness: true, length: {maximum: 10}
  validates :sex, allow_blank: true, inclusion: {
    in: %w(男 女),
    message: "は「男」か「女」で入力してください"
  }
  validates :job, allow_blank: true, length: {maximum: 30}
  validates :age, allow_blank: true, numericality: {
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 100,
    message: "は1~100までの数値で入力してください"
  }
  validates :description, length: {maximum: 100}
  validates :password, presence: true, length: {minimum: 6, maximum: 20}, on: :create
end