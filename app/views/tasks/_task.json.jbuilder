json.extract! task, :id, :title, :description, :deadline, :project_id, :team_id, :created_at, :updated_at
json.url task_url(task, format: :json)
