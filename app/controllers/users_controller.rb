class UsersController < ApplicationController
  before_action :set_user , only: [:edit, :update, :show]
  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end
  def show
    @articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end
  def new
    @user = User.new
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Your account information was successfully updated."
      redirect_to @user
    else
      render 'edit', status: 422
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to the Alpha Blog #{@user.username}, you have successfully signed up!"
      redirect_to login_path
    else
      render 'new', status: 422
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
  def set_user
    @user = User.find(params[:id])
  end
end
