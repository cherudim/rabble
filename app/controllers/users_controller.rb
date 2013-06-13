class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:update, :destroy]

  def show
  	@user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  		sign_in @user
  		flash[:success] = 'Registration successful, welcome!'
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  private
    def signed_in_user
      redirect_to login_url, notice: 'Please sign in' unless signed_in?
    end
end
