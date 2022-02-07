class Api::V1::RoundsController < ApplicationController

  def index
    rounds = Round.all.recent
    render json: RoundSerializer.new(rounds)
  end

  def show
    round = Round.find(params[:id])
    render json: round
  end

  def new
    user = User.find(params[:user_id])
    round = current_user.rounds.new
  end

  def create
    user = User.find(params[:user_id])
    round = current_user.rounds.build(round_params)

    if round.save
      render json: RoundSerializer.new(round), status: :accepted
    else
      # round.save
      render json: {
        status: 422,
        errors: round.errors.full_messages
      }
    end
  end

  def destroy
    round = Round.find(params[:id])
    round.destroy

    render json: {
      status: 200
    }
  end

  private

  def round_params
    params.require(:round).permit(:title, :pick_one, :pick_two, :pick_three, :pick_four, :pick_five, :pick_six)
  end

end