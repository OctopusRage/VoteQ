class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :title
      t.references :user, index: true, foreign_key: true
      t.boolean :status, default: true

      t.timestamps 
    end
  end
end
