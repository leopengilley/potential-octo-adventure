class User < ApplicationRecord
  has_many :bags
  has_many :pokemons, :through => :bags
  has_secure_password
  validates :name, uniqueness: true, presence: true
end
