require 'rails_helper'


RSpec.describe Vote, type: :model do
  let(:user) { User.create!(email: "example@example.com", password: "helloworld" )}
  let(:category) { Category.create!(title: "New Category", user: user)}
  let(:option) { category.options.create!(title: "New Option", body: 'About', website: "example.com")}
  let(:vote) { Vote.create!(value: 1, option: option, user: user)}


end
