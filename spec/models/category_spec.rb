require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:title) { "New Category"}
  let(:public) { true }
  let(:user) { User.create!(email: "example@example.com", password: "helloworld" )}
  let(:category) { Category.create!(title: "New Category", user: user)}




  describe "attributes" do
    it "has the title and user attributes" do
      expect(category).to have_attributes(title: title, user: user)
    end

    it "is public by default" do
      expect(category.public).to be(true)
    end
  end
end
