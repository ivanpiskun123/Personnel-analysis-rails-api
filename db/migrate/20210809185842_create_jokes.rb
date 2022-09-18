class CreateJokes < ActiveRecord::Migration[6.1]
  def change
    create_table :jokes do |t|
      t.text :body, null: false, default: ""

      t.timestamps
    end
  end
end
