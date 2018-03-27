class CorrectTableQuote < ActiveRecord::Migration[5.1]
  def change
  	remove_column :quotes, :author_id
  	add_column :quotes, :user_id, :integer
  	add_index :quotes, :user_id
  end
end
