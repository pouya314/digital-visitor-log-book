class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      t.string :name
      t.text :photo
      t.time :visit_time
      t.string :department
      t.string :email
      t.string :phone
      t.text :reason

      t.timestamps
    end
  end
end
