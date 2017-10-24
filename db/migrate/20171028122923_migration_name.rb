class MigrationName < ActiveRecord::Migration[5.1]
  def change
     add_reference :answers, :user, index: true
     add_foreign_key :answers, :users
  end
end
