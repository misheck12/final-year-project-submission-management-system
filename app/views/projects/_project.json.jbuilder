json.extract! project, :id, :title, :description, :goals, :deadline, :created_at, :updated_at
json.url project_url(project, format: :json)
