class AddNameToStatuses < ActiveRecord::Migration[5.0]
  def change
    add_column :statuses, :name, :string
  end
end
