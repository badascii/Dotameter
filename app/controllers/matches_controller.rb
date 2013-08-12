class MatchesController < ApplicationController
  require 'will_paginate/array'

  def show
    @matches = Match.all.paginate(page: 1, per_page: 2)
  end

  def index
    @matches = Match.all.paginate(page: 1, per_page: 2)
  end

  def recent_matches
  end
end
