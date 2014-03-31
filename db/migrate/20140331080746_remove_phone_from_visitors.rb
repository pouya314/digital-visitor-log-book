class RemovePhoneFromVisitors < ActiveRecord::Migration
  def change
    remove_column :visitors, :phone, :string
  end
end
