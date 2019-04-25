require 'rails_helper'

RSpec.describe FavoritesController, type: :controller do
  let(:my_user) { User.create!(email: "example@example.com", password: "helloworld" )}
  let(:my_category) { Category.create!(title: "new", user: my_user)}


    context 'signed in user' do
      before do
        create_sesion(my_user)
      end
    end


    describe 'POST create' do

      it 'redirects to the category show view' do
        post :create, params: { category_id: my_category.id }
        expect(response).to redirect_to([my_category])
      end

      it 'creates a favorite for the current user and specified post' do
        expect(my_user.favorites.find_by_category_id(my_category.id)).to be_nil
        post :create, params: {category_id: my_category.id}
        expect(my_user.favorites.find_by_category_id(my_category.id)).not_to be_nil
      end
    end
  end
