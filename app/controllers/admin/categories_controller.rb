class Admin::CategoriesController < ApplicationController

  before_action :logged_in_user
  before_action :load_category, only: [:edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t "flash.create_success"
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def destroy
    @category.destroy
    flash[:success] = t "flash.delete"
    redirect_to admin_categories_path
  end

  def edit
  end

  def update
    if @category.update_attributes category_params
      flash[:success] = t "flash.update"
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  private

  def category_params
    params.require(:category).permit :name, :description
  end

  def load_category
    @category = Category.find params[:id]
  end
end
