class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.text :goals
      t.date :deadline

      t.timestamps
    end
  end
end
