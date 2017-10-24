class AnyMigration < ActiveRecord::Migration[5.1]
  def change
     add_reference :questions, :user, index: true
     add_foreign_key :questions, :users
  end
end
