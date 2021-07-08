class Record < ApplicationRecord
  belongs_to :user

  validates :time, numericality: {
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 1440,
    message: "は1~1440の間の数値で入力してください"
  }
  validates :task_kind, presence: true, length: {
    maximum: 30
  }
end