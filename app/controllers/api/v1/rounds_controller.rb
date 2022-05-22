class Api::V1::RoundsController < ApplicationController
  before_action :set_round, only: [:show, :destroy]

  # GET /rounds
  def index
    @rounds = Round.all.recent

    # render json: @rounds
    render json: RoundSerializer.new(@rounds)
  end

  # GET /rounds/1
  def show
    # render json: @round
    @user = User.find(params[:email])
    options = {include: [:user_rounds]}
   
    round_json = RoundSerializer.new(@round).serialized_json
    render json: round_json
  end

  # POST /rounds
  def create
    @round = User.round.build(round_params)

    if @round.save
      render json: RoundSerializer.new(@round), status: :created
    else
      # round.save
      resp = {
        error: @round.errors.full_messages.to_sentence
      }
      render json: resp, status: :unprocessable_entity
    end
  end

  # DELETE /rounds/1
  def destroy
    # @round.destroy 
    @user = User.find(params[:email])

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