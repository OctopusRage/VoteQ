class AddVoteCategoriesToVote < ActiveRecord::Migration
  def change
    add_column :votes, :vote_category_id, :reference
  end
end
