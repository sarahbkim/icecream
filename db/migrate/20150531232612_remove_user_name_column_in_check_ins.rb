class RemoveUserNameColumnInCheckIns < ActiveRecord::Migration
  def change
    remove_column :check_ins, :user_name, :string
  end
end
