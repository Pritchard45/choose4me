class FavoritesController < ApplicationController

  def index
    @favorite = current_user.favorites.all
  end

  def create
    category = Category.find(params[:category_id])
    favorite = current_user.favorites.build(category: category)

    if favorite.save
      flash[:notice] = "Category favorited."
    else
      flash[:alert] = "Favoriting failed."
    end
      redirect_to category
  end

  def destroy
    category = Category.find(params[:category_id])
    favorite = current_user.favorites.find(params[:id])

    if favorite.destroy
      flash[:notice] = "Category unfavorited."
    else
      flash[:alert] = "Failed"
    end

    redirect_to category
  end
end
