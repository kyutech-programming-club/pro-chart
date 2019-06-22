class CreateRecordElems < ActiveRecord::Migration[5.2]
  def change
    create_table :record_elems do |t|
      t.references :record, foreign_key: true
      t.references :elem, foreign_key: true

      t.timestamps
    end
  end
end
