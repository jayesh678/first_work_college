class AddApplicationNumberToExpenses < ActiveRecord::Migration[7.1]
  def change
    add_column :expenses, :application_number, :string
    add_index :expenses, :application_number, unique: true
  end
end
