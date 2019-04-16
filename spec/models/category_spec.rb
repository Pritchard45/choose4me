require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:title) { "New Category"}
  let(:public) { true }
  let(:category) { Category.create!(title: "New Category")}

  

  describe "attributes" do
    it "has the title and public attributes" do
      expect(category).to have_attributes(title: title)
    end

    it "is public by default" do
      expect(category.public).to be(true)
    end
  end
end
