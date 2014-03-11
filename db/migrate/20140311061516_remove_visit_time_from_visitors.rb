class RemoveVisitTimeFromVisitors < ActiveRecord::Migration
  def change
    remove_column :visitors, :visit_time, :time
  end
end
