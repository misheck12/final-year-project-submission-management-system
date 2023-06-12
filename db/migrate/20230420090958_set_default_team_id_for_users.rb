class SetDefaultTeamIdForUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :team_id, :integer, default: 1, null: false
  end
end
