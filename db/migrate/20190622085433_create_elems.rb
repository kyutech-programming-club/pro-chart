class CreateElems < ActiveRecord::Migration[5.2]
  def change
    create_table :elems do |t|
      t.references :lang, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
