class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      t.string :name
      t.text :photo

      t.timestamps
    end
  end
end
