class CreateMoods < ActiveRecord::Migration[8.1]
  def change
    create_table :moods do |t|
      t.string :emoji, null: false
      t.string :name, null: false
      t.string :reason, null: false

      t.timestamps
    end
  end
end
