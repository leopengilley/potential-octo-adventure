class AddBackToPokemons < ActiveRecord::Migration[5.2]
  def change
      add_column :pokemons, :back, :text
  end
end
######################Ignore this migration#########################
