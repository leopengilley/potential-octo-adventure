class AddDamageToAttacks < ActiveRecord::Migration[5.2]
  def change
    add_column :attacks, :damage, :integer
  end
end

######################Ignore this migration#########################
