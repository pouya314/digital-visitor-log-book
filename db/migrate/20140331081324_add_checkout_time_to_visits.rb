class AddCheckoutTimeToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :checkout_time, :datetime
  end
end
