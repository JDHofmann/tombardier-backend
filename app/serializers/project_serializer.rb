class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :subtitle, :description, :project_links
end
