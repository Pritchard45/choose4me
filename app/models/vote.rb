class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :option

  validates :value, inclusion: { in: [-1, 1], message: "%{value} is not a valid vote." }, presence: true
end
