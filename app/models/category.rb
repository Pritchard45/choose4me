class Category < ApplicationRecord
  belongs_to :user
  has_many :options, dependent: :destroy

  default_scope { order('created_at DESC') }
end
