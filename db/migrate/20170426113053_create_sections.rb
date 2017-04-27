class CreateSections < ActiveRecord::Migration[5.1]
  def change
    create_table :sections do |t|
      t.string :name
      t.string :deleted_at
      t.timestamps
    end
  end
end
