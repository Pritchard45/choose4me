require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create!(email: "example@example.com", password: "helloworld" )}
end
