class TableQuotes < ActiveRecord::Migration[5.1]
  def change
  	create_table :quotes 
  	add_column :quotes, :content, :text
  	add_column :quotes, :author_id, :integer
  	add_index :quotes, :author_id
  end
end
