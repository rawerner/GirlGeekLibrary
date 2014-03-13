require 'googlebooks'

class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @owned_books = Book.where(user_id: current_user.id)
    # @searched_books = GoogleBooks.search(results)

  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render "edit"
    end
    # @user = Users.find(params[:id])
    # @user.update_attributes!(user_params)

  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :location, :bio, :photo, :id)
  end


end
