class AddNameToQuestion < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :name, :string
  end
end
