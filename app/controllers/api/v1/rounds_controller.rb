class Api::V1::RoundsController < ApplicationController
  before_action :set_round, only: [:show, :destroy]

  def index
    @rounds = Round.all.recent

    render json: @rounds
  end

  def show
    if @round = User.last.rounds.last
      render json: @user.round
    else
      resp = {
        error: @round.errors.full_messages.to_sentence
      }
      render json: resp, status: :not_found
    end
  end

  def create
    @user = User.last
    @round = @user.rounds.new(round_params)
   
    if @round.save
      render json: RoundSerializer.new(@round), status: :created
    else
      resp = {
        error: @round.errors.full_messages.to_sentence
      }
      render json: resp, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])

    if @round.destroy
      render json: RoundSerializer.new(@round)
    else
      render json: { errors: @rounds.errors.full_messages }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_round
    @round = Round.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def round_params
    params.require(:round).permit(:title, :pick_one, :pick_two, :pick_three, :pick_four, :pick_five, :pick_six)
  end

end



# options = {include: [:user_rounds]}