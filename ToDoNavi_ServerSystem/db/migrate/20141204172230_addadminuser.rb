class Addadminuser < ActiveRecord::Migration
  def change
    add_column :adminusers, :administrator, :boolean
  end
end
