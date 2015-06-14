class RemoveFactualIdCheckIns < ActiveRecord::Migration
  def change
    remove_column :check_ins, :factual_id, :string
  end
end
