class OptionsController < ApplicationController

  def show
    @option = Option.find(params[:id])
  end

  def new
    @category = Category.find(params[:category_id])
    @option = Option.new
  end




  def create
  #  @option = Option.new
  #  @option.title = params[:option][:title]
  #  @option.body = params[:option][:body]
  #  @option.website = params[:option][:website]
    @category = Category.find(params[:category_id])
    @option = @category.options.build(option_params)
    @option.user = current_user

    #@option.category = @category

    if @option.save
      flash[:notice] = "Option added."
      redirect_to [@category, @option]
    else
      flash.now[:alert] = "Error creating option"
      render :new
    end
  end

  def edit
    @option = Option.find(params[:id])
  end

  def update
    @option = Option.find(params[:id])
    # @option.title = params[:option][:title]
    # @option.body = params[:option][:body]
    # #@option.website = params[:option][:website]
    @option.assign_attributes(option_params)

    if @option.save
      flash[:notice] = "Option was updated."
      redirect_to [@option.category, @option]
    else
      flash.now[:alert] = "There was an error updating this otption"
      render :edit
    end
  end

  def destroy
    @option = Option.find(params[:id])

    if @option.destroy
      flash[:notice] = "\"#{@option.title}\" was deleted."
      redirect_to @option.category
    else
      flash.now[:alert] = "There was an error deleting option"
      render :show
    end
  end


  private
  def option_params
    params.require(:option).permit(:title, :body, :website)
  end
end
