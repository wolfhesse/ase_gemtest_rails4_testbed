class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.boolean :rogera

      t.timestamps
    end
  end
end
