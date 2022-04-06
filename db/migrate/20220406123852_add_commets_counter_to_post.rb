class AddCommetsCounterToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :commets_counter, :integer
    add_column :posts, :likes_counter, :integer
  end
end
