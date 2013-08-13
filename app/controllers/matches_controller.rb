class MatchesController < ApplicationController
  gem 'kaminari'

  def index
    @matches = Match.all.desc(:match_id).page(params[:page])
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
