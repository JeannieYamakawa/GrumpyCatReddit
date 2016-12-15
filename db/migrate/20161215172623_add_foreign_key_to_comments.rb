class AddForeignKeyToComments < ActiveRecord::Migration[5.0]
  def change
      add_foreign_key :comments, :messages
  end
end
