require 'rails_helper'

RSpec.describe Option, type: :model do
  let(:title) { "New Category"}
  let(:title) { "New Option"}
  let(:body) { "About" }
  let(:website) { "example.com" }

  let(:user) { User.create!(email: "example@example.com", password: "helloworld" )}
  let(:category) { Category.create!(title: "New Category", user: user)}
  let(:option) { category.options.create!(title: "New Option", body: 'About', website: "example.com")}





  describe "attributes" do
    it "has title, body and website attributes" do
      expect(option).to have_attributes(title: title, body: body, website: website)
    end
  end
end
