ActiveAdmin.register Project do
  permit_params :title, :description, :goals

  index do
    selectable_column
    id_column
    column :title
    column :description
    column :goals
    actions
  end

  filter :title

  form do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :goals
    end
    f.actions
  end
end
