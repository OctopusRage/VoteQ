class AddUserDegreeToUser < ActiveRecord::Migration
  def change
    add_reference :users, :user_degree, index: true, foreign_key: true
  end
end
