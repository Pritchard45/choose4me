require 'rails_helper'

RSpec.describe Option, type: :model do
  let(:category) { Category.create!(title: "New Category")}
  let(:option) { Option.create!(title: "New Option", body: 'Website Phone', category: category )}

  describe "attributes" do
    it "has title and body attributes" do
      expect(option).to have_attributes(title: "New Option", body: "Website Phone")
    end
  end
end
