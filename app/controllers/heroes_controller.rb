class HeroesController < ApplicationController

  def index
    @heroes = Hero.all
  end

  def show
    hero = set_hero
    case hero.primary_stat
      when 'str'
        hero.primary_stat = 'Strength'
      when 'int'
        hero.primary_stat = 'Intelligence'
      when 'agi'
        hero.primary_stat = 'Agility'
    end
    cookies[:hero_id] = hero.valve_id
  end

  def win_graph
    render json: Match.hero_win_graph(params[:hero_id], params[:batch])
  end

  private

  def set_hero
    # FIXME: over_specified, written to mirror match_show for now
    @hero = Hero.find_by(name: params[:name])
  end

  def hero_params
    params.require(:hero).permit(:name, :valve_id)
  end

end