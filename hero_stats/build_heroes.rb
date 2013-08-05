#pulls data from hero_search.txt and populates base stats db
Module BuildHeroes
File.open('hero_stats/hero_search.txt').each_line.with_index do |line, index|

  if index % 55 == 0
    (0..55).each_slice(56)
    #grab preceding 55 lines then apply case statement (needs iterator?)
    Hero.create
#--------------------------------------------------------------------------
  stats.each do |line|
    until line.eof?
      line_number += 1
        if line_number = 56
          line_number = 0 && hero.create()

  end

#collection runs on txt file, splits into array every 56 lines,
# then key values set by index in array

#--------------------------------------------------------------------------

file = File.open('hero_stats/hero_search.txt')

  file.each_line.each_slice(56) do |slice|
    name = slice[0]





  if index % 55 == 0
    (0..55).each_slice(56)
    #grab preceding 55 lines then apply case statement (needs iterator?)
    Hero.create


#case statement assigns values from array

#if we can index txt file then case stmt will be when index == 1, etc.
  case hero
  when line_number == 1
    name =
  when line_number == 4
  when line_number == 6
  when line_number == 8
  when line_number == 10
  when line_number == 20
  when line_number == 24
  when line_number == 28
  when line_number == 32

# creates hero object
  Hero.create!({name: name,
                radiant: boolean,
                str: str,
                agi: agi,
                int: int,
                str_per_lvl: str_per_lvl,
                agi_per_lvl: agi_per_lvl,
                int_per_lvl: int_per_lvl,
                hp: hp,
                mp: mp,
                min_dmg: min_dmg,
                max_dmg: max_dmg,
                armor: armor })

end

# line reference in txt file

# * more than one item of data
# 1
# 4
# 6*
# 8*
# 10*
# 20
# 24
# 28*
# 32
