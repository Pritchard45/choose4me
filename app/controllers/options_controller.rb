class OptionsController < ApplicationController
  def index
    @options = Option.all
  end

  def show
  end

  def new
  end

  def edit
  end
end
