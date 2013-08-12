class MatchesController < ApplicationController
  require 'will_paginate/array'

  def index
    # @matches = Match.paginate(page: params[:page], per_page: 50)
    @matches = Match.all.paginate(page: 1, per_page: 50)
    # @matches = Match.all
  end

  def show
<<<<<<< HEAD
    @matches = Match.all.paginate(page: 1, per_page: 2)
  end

  def index
    @matches = Match.all.paginate(page: 1, per_page: 2)
=======
    set_match
  end

  # def show
  #   @matches = Match.all.paginate(page: 1, per_page: 1)
  # end

  # def recent_matches
  # end

  def to_param
    match_id
>>>>>>> ec12dd6d9f4dd2833eb39004874b337528d4482d
  end

  private

  def set_match
    @match = Match.find_by(match_id: params[:match_id])
  end

end
