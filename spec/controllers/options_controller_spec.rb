require 'rails_helper'

RSpec.describe OptionsController, type: :controller do
  let(:my_category) { Category.create!(title: "new")}
  let(:my_option) {my_category.options.create!(title: "Choose", body: "Info", website: "example.com") }


   describe "GET #show" do
     it "returns http success" do
       get :show, params: { category_id: my_category.id, id: my_option.id }
       expect(response).to have_http_status(:success)
     end
     it "renders the #show view" do
       get :show, params: {  category_id: my_category.id, id: my_option.id }
       expect(response).to render_template :show
     end

     it "assigns my_option to @option" do
       get :show, params: {  category_id: my_category.id, id: my_option.id }
       expect(assigns(:option)).to eq(my_option)
     end
   end

   describe "GET #new" do
     it "returns http success" do
       get :new, params: { category_id: my_category.id }
       expect(response).to have_http_status(:success)
     end

     it "renders the #new view" do
       get :new, params: { category_id: my_category.id }
       expect(response).to render_template :new
     end

     it "initializes @option" do
       get :new, params: { category_id: my_category.id }
       expect(assigns(:option)).not_to be_nil
     end
   end

   describe "POST create" do
    it "increases the number of options by 1" do
      expect{ post :create, params: { category_id: my_category.id, option: { title: "Choose", body: "Info", website: "example.com"} } }.to change(Option,:count).by(1)
    end

    it "assigns Topic.last to @option" do
      post :create, params: { category_id: my_category.id, option: { title: "Choose", body: "Info", website: "example.com" } }
      expect(assigns(:option)).to eq Option.last
    end

    it "redirects to the new option" do
      post :create, params: { category_id: my_category.id, option: { title: "Choose", body: "Info", website: "example.com" } }
      expect(response).to redirect_to [my_category, Option.last]
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, params: {category_id: my_category.id, id: my_option.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
      get :edit, params: {category_id: my_category.id, id: my_option.id}
      expect(response).to render_template :edit
    end

    it "assigns option to be updated to @option" do
      get :edit, params: {category_id: my_category.id, id: my_option.id}
      option_instance = assigns(:option)

      expect(option_instance.id).to eq my_option.id
      expect(option_instance.title).to eq my_option.title
      expect(option_instance.body).to eq my_option.body
      expect(option_instance.website).to eq my_option.website
    end
  end

  describe "PUT update" do
    it "updates option with expected attributes" do
      new_title = "New title"
      new_body = "New body"
      new_website = "New website"

      put :update, params: {category_id: my_category.id, id: my_option.id, option: {title: new_title, body: new_body, website: new_website}}
      updated_option = assigns(:option)
      expect(updated_option.id).to eq my_option.id
      expect(updated_option.title).to eq new_title
      expect(updated_option.body).to eq new_body
      expect(updated_option.website).to eq new_website
    end

    it "redirects to the updated option" do
      new_title = "New title"
      new_body = "New body"
      new_website = "New website"

      put :update, params: {category_id: my_category.id, id: my_option.id, option: {title: new_title, body: new_body, website: new_website}}
      expect(response).to redirect_to [my_category, my_option]
    end
  end

  describe "DELETE destroy" do
    it "deletes the option" do
      delete :destroy, params: {category_id: my_category.id, id: my_option.id}
      count = Option.where({id: my_option.id}).size
      expect(count).to eq 0
    end

    it "redirects to category show" do
      delete :destroy, params: {category_id: my_category.id, id: my_option.id}
      expect(response).to redirect_to my_category
    end
  end

end
