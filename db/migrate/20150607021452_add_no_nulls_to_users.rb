class AddNoNullsToUsers < ActiveRecord::Migration
  def change
    ## Required
    change_column_null(:users, :provider, false, "")
    change_column_null(:users, :uid, false, "")

    ## Database authenticatable
    change_column_null(:users, :encrypted_password, false, "")

    ## Trackable
    change_column_null(:users, :sign_in_count, false, 0)
  end
end