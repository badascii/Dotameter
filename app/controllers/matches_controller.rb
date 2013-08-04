class MatchesController < ApplicationController

  def index
    @matches = Match.all
  end

  def show
    set_match
  end

  private

  def set_match
    @match = Match.find(params[:id])
  end

  def match_params
    params.require(:match).permit(:radiant_win, :valve_match_id, :valve_seq_id)
  end

end
