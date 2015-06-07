class FixNullsUsersTable < ActiveRecord::Migration
  def up
    User.all.each do |user|
      if user.provider == nil
        user.provider = ""
      elsif user.uid == nil
        user.uid = ""
      elsif user.encrypted_password == nil
        user.encrypted_password = ""
      elsif user.sign_in_count == nil
        user.sign_in_count = 0
      end
    end
  end

  def down
  end

end