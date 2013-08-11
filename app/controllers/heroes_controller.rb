class HeroesController < ApplicationController

  def index
    @heroes = Hero.all
  end

  def show
    set_hero
  end

  private

  def set_hero
    # FIXME: over_specified, written to mirror match_show for now
    @hero = Hero.find_by(id: params[:id])
  end

  def hero_params
    params.require(:hero).permit(:name, :valve_id)
  end

end
