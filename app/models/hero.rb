class Hero < ActiveRecord::Base

  validates :name, :uniqueness => true, :presence => true

  # def self.heroes
  #   DotaAPI.get_heroes
  # end

  # def self.build_hero_list
  #   ids = Hero.hero

  #   ids.each do |id|
  #     Hero.create(1)

  #   end
  # end
end
