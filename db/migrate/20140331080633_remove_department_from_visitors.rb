class RemoveDepartmentFromVisitors < ActiveRecord::Migration
  def change
    remove_column :visitors, :department, :string
  end
end
