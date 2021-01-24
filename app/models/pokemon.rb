class Pokemon < ApplicationRecord
  has_and_belongs_to_many :bags
  has_and_belongs_to_many :attacks
end
