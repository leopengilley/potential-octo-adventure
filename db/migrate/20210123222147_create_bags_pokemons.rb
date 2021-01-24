class CreateBagsPokemons < ActiveRecord::Migration[5.2]
  def change
    create_table :bags_pokemons, :id => false do |t|
      t.integer :bag_id
      t.integer :pokemon_id
    end
  end
end
