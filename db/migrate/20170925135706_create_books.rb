class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.text :description
      t.integer :price
      t.boolean :availability, default: true

      t.timestamps
    end
  end
end
