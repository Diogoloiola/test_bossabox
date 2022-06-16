json.extract! location, :id, :title, :description, :link

json.tags location.tags.pluck(:description)
