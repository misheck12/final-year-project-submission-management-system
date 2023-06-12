class AddProjectToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :project, null: true, foreign_key: true
  end
end
