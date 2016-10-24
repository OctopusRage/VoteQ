class AddUserDetailsToUser < ActiveRecord::Migration
  def change
  	add_column :users, :fullname, :string
  	add_column :users, :latitude, :float
  	add_column :users, :longitude, :float
  	add_column :users, :dateofbirth, :string
  	add_column :users, :bio, :text
  	add_column :users, :job, :string
  end
end
