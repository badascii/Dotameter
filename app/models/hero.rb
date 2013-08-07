class Hero
  include Mongoid::Document

  field  :name,        type: String
  field  :str,         type: Integer
  field  :agi,         type: Integer
  field  :int,         type: Integer
  field  :str_per_lvl, type: Decimal
  field  :agi_per_lvl, type: Decimal
  field  :int_per_lvl, type: Decimal
  field  :hp,          type: Integer
  field  :mp,          type: Integer
  field  :min_dmg,     type: Integer
  field  :max_dmg,     type: Integer
  field  :armor,       type: Decimal

  validates :name, presence: true, uniqueness: true

end