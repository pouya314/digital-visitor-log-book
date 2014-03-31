class RemoveReasonFromVisitors < ActiveRecord::Migration
  def change
    remove_column :visitors, :reason, :text
  end
end
