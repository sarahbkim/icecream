class DeviseTokenAuthCreateUsers < ActiveRecord::Migration
  def change
    ## Required
    add_column :users, :provider, :string #, :null => false
    add_column :users, :uid, :string, :default => "" #:null => false, 

    ## Database authenticatable
    add_column :users, :encrypted_password, :string, :default => "" #,:null => false,

    ## Recoverable
    add_column :users, :reset_password_token, :string
    add_column :users, :reset_password_sent_at, :datetime

    ## Rememberable
    add_column :users, :remember_created_at, :datetime

    ## Trackable
    add_column :users, :sign_in_count, :integer, :default => 0 #, :null => false
    add_column :users, :current_sign_in_at, :datetime
    add_column :users, :last_sign_in_at, :datetime
    add_column :users, :current_sign_in_ip, :string
    add_column :users, :last_sign_in_ip, :string

    ## Confirmable
    add_column :users, :confirmation_token, :string
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmation_sent_at, :datetime
    add_column :users, :unconfirmed_email, :string # Only if using reconfirmable

    ## Lockable
    # :users,   :failed_attempts, :integer, :default => 0, :null => false # Only if lock strategy is :failed_attempts
    # :users,    :unlock_token, :string # Only if unlock strategy is :email or :both
    # :users,  :locked_at, :datetime

    ## User Info
    add_column :users,:nickname, :string
    add_column :users,:image, :string

    ## Tokens
    add_column :users, :tokens, :text

  add_index :users, [:uid, :provider], :unique => true
  add_index :users, :reset_password_token, :unique => true
  # add_index :users, :confirmation_token,   :unique => true
  # add_index :users, :unlock_token,         :unique => true
  end
end
