class Api::V1::RoundsController < ApplicationController
  before_action :set_round, only: [:show, :update, :destroy]

  # GET /rounds
  def index
    @rounds = Round.all.recent

    render json: @rounds
  end

  # GET /rounds/1
  def show
    render json: @round
  end

  # POST /rounds
  def create
    @round = Round.new(round_params)

    if @round.save
      render json: RoundSerializer.new(round), status: :accepted
    else
      # round.save
      render json: {
        status: 422,
        errors: round.errors.full_messages
      }
    end
  end

  # DELETE /rounds/1
  def destroy
    @round.destroy
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