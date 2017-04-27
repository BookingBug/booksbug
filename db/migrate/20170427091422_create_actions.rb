class CreateActions < ActiveRecord::Migration[5.1]
  def change
    create_table :actions do |t|
      t.references :user
      t.references :book
      t.string :kind

      t.timestamps
    end
  end
end
