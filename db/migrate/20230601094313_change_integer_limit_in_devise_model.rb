class ChangeIntegerLimitInDeviseModel < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :phone_number, :integer, limit: 8
  end
end
