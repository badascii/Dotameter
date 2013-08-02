class HeroController < ApplicationController
  before_action :set_hero, only: [:show]

  def index
    @heroes = Hero.all
  end

  def show
  end

  private

  def set_hero
    @hero = Hero.find(params[:id])
  end

  def hero_params
    params.require(:hero).permit(:name, :valve_id)
  end
end
