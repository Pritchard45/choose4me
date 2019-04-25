require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create!(email: "example@example.com", password: "helloworld" )}

  describe "#favorite_for(category)" do
    before do
      @category = Category.create!(title: "Random", user: user)
    end

    it "returns 'nil' if the user has not favorited the post" do
      expect(user.favorite_for(@category)).to be_nil
    end

    it "returns the appropriate favorite if it exists" do
      favorite = user.favorites.where(category: @category).create
      expect(user.favorite_for(@category)).to eq (favorite)
    end
  end
end
