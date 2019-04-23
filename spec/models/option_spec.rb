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

  describe "voting" do

    before do
      3.times { option.votes.create!(value: 1, user: user) }
      2.times { option.votes.create!(value: -1, user: user) }
      @up_votes = option.votes.where(value: 1).count
      @down_votes = option.votes.where(value: -1).count
    end

    describe "#up_votes" do
      it "counts the number of votes with value = 1" do
        expect( option.up_votes ).to eq(@up_votes)
      end
    end

    describe "#down_votes" do
      it "counts the number of votes with value = -1" do
        expect( option.down_votes ).to eq(@down_votes)
      end
    end

    describe "#points" do
      it "returns the sum of all down and up votes" do
        expect( option.points ).to eq(@up_votes - @down_votes)
      end
    end
  end
end
