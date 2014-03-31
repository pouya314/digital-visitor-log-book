class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.belongs_to :visitor, index: true
      t.string :from_company
      t.string :person_to_meet
      t.string :company_to_visit

      t.timestamps
    end
  end
end
