class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :person
      t.datetime :expected_start_at
      t.datetime :expected_end_at
      t.string :name
      t.text :description

      t.timestamps
    end
    add_index :tasks, :person_id
  end
end
