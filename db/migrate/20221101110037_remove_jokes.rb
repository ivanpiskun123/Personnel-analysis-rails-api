class RemoveJokes < ActiveRecord::Migration[6.1]
  def change
    drop_table :jokes do |t|
      t.text "body"
      t.timestamps null: false
    end
  end
end
