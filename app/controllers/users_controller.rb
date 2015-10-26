class UsersController < ApplicationController
  def index
    @users = User.paginate(page: params[:page],per_page: "20").order "name"
    respond_to do |format|
      format.html
      format.js
    end
  end
  def new
    @user = User.new
  end

  def show
    @user = User.find params[:id]
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash.now[:success] = t "flash.users.create.success"
      redirect_to @user
    else
      render :new
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = t "users.destroy.success"
    redirect_to users_url
  end
  private

  def user_params
    params.require(:user).permit :name, :email, :password
  end
end
