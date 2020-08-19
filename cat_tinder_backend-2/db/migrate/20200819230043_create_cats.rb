class CreateCats < ActiveRecord::Migration[6.0]
  def change
    create_table :cats do |t|
      t.string :firstName
      t.string :lastName
      t.integer :age
      t.text :enjoys

      t.timestamps
    end
  end
end
