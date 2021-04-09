class CategoriesController < ApplicationController

  def show  # get category instance and show view
    @category = Category.find(params[:id])
  end
end
