class AddFactualIdToCheckIns < ActiveRecord::Migration
  def change
    add_column :check_ins, :factual_id, :string
  end
end
