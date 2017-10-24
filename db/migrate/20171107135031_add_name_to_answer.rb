class AddNameToAnswer < ActiveRecord::Migration[5.1]
  def change
    add_column :answers, :name, :string
  end
end
