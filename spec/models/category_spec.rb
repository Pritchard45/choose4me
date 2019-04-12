require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { Category.create!(title: "New Category")}

  describe "attributes" do
    it "has the title attributes" do
      expect(category).to have_attributes(title: "New Category")
    end
  end
end
