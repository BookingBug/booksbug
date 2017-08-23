class AddAuthorAndIsbnToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :author, :string
    add_column :books, :isbn, :string
  end
end
