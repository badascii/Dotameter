class MatchesController < ApplicationController
  require 'will_paginate/array'

  def index
    # @matches = Match.paginate(page: params[:page], per_page: 50)
    @matches = Match.all.paginate(page: 1, per_page: 50)
    # @matches = Match.all
  end

  def show
    set_match
  end

  # def show
  #   @matches = Match.all.paginate(page: 1, per_page: 1)
  # end

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
