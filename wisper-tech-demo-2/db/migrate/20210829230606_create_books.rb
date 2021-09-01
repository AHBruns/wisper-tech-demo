class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.belongs_to :author, null: false, foreign_key: true
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
