require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:my_user) { User.create!(email: "example@example.com", password: "helloworld" )}
  let(:my_category) { my_user.categories.create!(title: "Random", user: my_user)}

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_category] to @categories" do
      get :index

      expect(assigns(:categories)).to eq([my_category])
    end
  end

  describe "GET show" do
    it "returns http success" do

      get :show, params: { id: my_category.id }
      expect(response).to have_http_status(:success)
    end
    it "renders the #show view" do

      get :show, params: { id: my_category.id }
      expect(response).to render_template :show
    end

    it "assigns my_category to @category" do
      get :show, params: { id: my_category.id }

      expect(assigns(:category)).to eq(my_category)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @category" do
      get :new
      expect(assigns(:category)).not_to be_nil
    end
  end

  describe "POST create" do
    it "increases the number of Categories by 1" do
      expect{ post :create, params: { category_id: my_category.id, category: { title: "Rando", user: my_user} } }.to change(Category,:count).by(1)
    end

    it "assigns the new category to @category" do
      post :create, params: { category: { title: "Rando"} }
      expect(assigns(:my_category)).to eq Category.last
    end

    it "redirects to the new category" do
      post :create, params: { category_id: my_category.id, category: { title: "Rando", user: my_user } }
      expect(response).to redirect_to Category.last
    end
  end


   describe "GET #edit" do
     it "returns http success" do
       get :edit, params: { id: my_category.id }
       expect(response).to have_http_status(:success)
     end

     it "renders the #edit view" do
       get :edit, params: { id: my_category.id }
       expect(response).to render_template :edit
     end

     it "assigns category to be updated to @category" do
       get :edit, params: { id: my_category.id }

       category_instance = assigns(:category)

       expect(category_instance.id).to eq my_category.id
       expect(category_instance.title).to eq my_category.title
     end
   end

  describe "PUT update" do
    it "updates category with expected attributes" do
      new_title = "rando"


      put :update, params: { id: my_category.id, category: {title: new_title } }

      updated_category = assigns(:category)
      expect(updated_category.id).to eq my_category.id
      expect(updated_category.title).to eq new_title

    end

    it "redirects to the updated category" do
      new_title = "rando"

      put :update, params: { id: my_category.id, category: {title: new_title} }
      expect(response).to redirect_to my_category
    end
  end

  describe "DELETE destroy" do
    it "deletes the category" do
      delete :destroy, params: { id: my_category.id }

      count = Category.where({id: my_category.id}).size
      expect(count).to eq 0
    end

    it "redirects to categories index" do
      delete :destroy, params: { id: my_category.id }

      expect(response).to redirect_to categories_path
    end
  end

end
