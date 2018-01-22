class CreateFantasticBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :fantastic_books do |t|
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
