class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :content
      t.text :website
      t.references :user
      t.timestamps
    end
  end
end
