class AddFrontToPokemons < ActiveRecord::Migration[5.2]
  def change
    add_column :pokemons, :front, :text
  end
end
######################Ignore this migration#########################
