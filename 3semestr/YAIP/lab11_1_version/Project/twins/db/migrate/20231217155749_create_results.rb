class CreateResults < ActiveRecord::Migration[7.1]
  def change
    create_table :results do |t|
      t.string :input
      t.json :result

      t.timestamps
    end
    add_index :results, :input, unique: true
  end
end
