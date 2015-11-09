class Admin::UsersController < ApplicationController

  before_action :load_user, only: [:destroy]

  def index
    @users = User.paginate(page: params[:page],per_page: Settings.pape_per).order :name
  end

  def destroy
    if @user.destroy
      flash[:success] = t "users.destroy.success"
      redirect_to users_url
    else
      flash[:error] = t "users.destroy.fails"
      redirect_to users_url
    end
  end

  private

  def load_user
    @user = User.find params[:id]
  end
end
