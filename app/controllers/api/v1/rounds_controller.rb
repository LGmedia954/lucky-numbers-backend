class Api::V1::RoundsController < ApplicationController

  def index
    rounds = Round.all
    render json: RoundSerializer.new(rounds)
  end

  def show
    round = Round.find(params[:id])
    render json: round
  end

  def create
    round = Round.new(round_params)

    if round.save
      render json: RoundSerializer.new(round), status: :accepted
    else
      render json: {
        status: 500,
        errors: round.errors.full_messages
      }
    end
  end

  private

  def round_params
    params.require(:round).permit(:title, :pick_one, :pick_two, :pick_three, :pick_four, :pick_five, :pick_six)
  end

end