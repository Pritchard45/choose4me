class Category < ApplicationRecord
  has_many :options, dependent: :destroy
end
