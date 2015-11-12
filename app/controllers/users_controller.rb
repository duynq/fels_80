class UsersController < ApplicationController
  before_action :load_user, only: [:show, :edit, :update]
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
    @feed_activities = @user.activities.recent.paginate page: params[:page],
      per_page: Settings.paginate_per_page
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

  def edit
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "users.update.update_success"
      redirect_to @user
    else
      flash[:error] = t "users.update.update_fails"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation
  end

  def load_user
    @user = User.find params[:id]
  end
end
