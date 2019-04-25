require 'rails_helper'

RSpec.describe Favorite, type: :model do
  let(:category) { Category.create!(title: "Random")}
  let(:user) { User.create(email: "user@example.com", password: "helloworld")}
  let(:favorite) { Favorite.create!(category: category, user: user)}

end
