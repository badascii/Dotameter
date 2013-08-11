class MatchesController < ApplicationController

  def index
    # @matches = Match.paginate(page: params[:page], per_page: 50)
    @matches = Match.all
  end

  def show
    set_match
  end

  # def recent_matches
  # end

  def to_param
    match_id
  end

  private

  def set_match
    @match = Match.find_by(match_id: params[:match_id])
  end

end
