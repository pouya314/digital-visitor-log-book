class RemoveEmailFromVisitors < ActiveRecord::Migration
  def change
    remove_column :visitors, :email, :string
  end
end
