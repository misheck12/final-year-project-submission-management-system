ActiveAdmin.register Task do
  permit_params :title, :description, :deadline, :project_id, :team_id

  index do
    selectable_column
    id_column
    column :title
    column :description
    column :deadline
    column :project
    column :team
    actions
  end

  filter :title

  form do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :deadline, as: :datepicker
      f.input :project, as: :select, collection: Project.all
      f.input :team, as: :select, collection: Team.all
    end
    f.actions
  end
end