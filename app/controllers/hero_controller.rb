class HeroController < ApplicationController

  def index
    @heroes = Hero.all
  end

  def show
    set_hero
  end

  private

  def set_hero
    @hero = Hero.find(params[:id])
  end

  def hero_params
    params.require(:hero).permit(:name, :valve_id)
  end
end
