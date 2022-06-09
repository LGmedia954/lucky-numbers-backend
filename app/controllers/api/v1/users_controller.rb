class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @users = User.all

    render json: @users
  end
  
  def show
    @user = User.find(params[:id])
   
    render json: @user
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: UserSerializer.new(@user), status: :created
    else
      resp = {
        error: @user.errors.full_messages.to_sentence
      }
      render json: resp, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])

    if @user.destroy
      render json: UserSerializer.new(@user)
    else
      render json: { errors: @users.errors.full_messages }
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end
      
    def user_params
      params.require(:user).permit(:id, :username, :email)
    end

 end



  # def emailcheck
  #   if @user = User.exists?(params[:email])
  #     render json: @user, status: :ok
  #   end
  # end