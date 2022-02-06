class Api::V1::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    options = {include: [:user_rounds]}
   
    if @user
      render json: {
        user: UserSerializer.new(@user, options)
      }
    else
      render json: {
        status: 500,
        errors: ['User not found']
      }
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!
      render json: {
        status: :created,
        user: @user
      }
    else 
      @user.save
      render json: {
        status: 500,
        error: @user.errors.full_messages
      }
    end
  end

  def edit
    @user = User.find(params[:id])

    if !current_user
      render json: {
        status: 500,
        errors: ['You may only edit your own details']
      }
    end
  end

  def update
      @user = User.find(params[:id])
      @user.update(user_params)
      if @user.save
        render json: {
          status: :updated,
          user: @user
        }
      else 
        @user.save
        render json: {
          status: 500,
          error: @user.errors.full_messages
        }
      end
    end

  private
      
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end

 end