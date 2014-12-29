class CreateAdminusers < ActiveRecord::Migration
  def change
    create_table :adminusers do |t|
      t.string :user
      t.string :hashed_password
      t.timestamps
    end
  end
end
