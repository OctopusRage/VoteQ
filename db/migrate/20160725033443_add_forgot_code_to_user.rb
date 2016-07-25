class AddForgotCodeToUser < ActiveRecord::Migration
  def change
    add_column :users, :forgot_code, :string, default: nil
  end
end
