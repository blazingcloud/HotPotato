class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.references :task
      t.string :type
      t.integer :initiator_person_id
      t.references :to_person

      t.timestamps
    end
    add_index :activities, :task_id
    add_index :activities, :to_person_id
    add_index :activities, :initiator_person_id
  end
end
