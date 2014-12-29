class ModifyAdmins1 < ActiveRecord::Migration
  def change
    add_column :admins, :hashed_password, :string
  end
end
