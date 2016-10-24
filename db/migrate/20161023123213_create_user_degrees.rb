class CreateUserDegrees < ActiveRecord::Migration
  def change
    create_table :user_degrees do |t|
      t.string :degree
      t.text :description

      t.timestamps null: false
    end
  end
end
