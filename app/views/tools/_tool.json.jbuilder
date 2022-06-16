json.extract! tool, :id, :title, :description, :link

json.tags tool.tags.pluck(:description)
