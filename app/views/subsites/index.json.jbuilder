json.array!(@subsites) do |subsite|
  json.extract! subsite, :id, :name, :description, :slug
  json.url subsite_url(subsite, format: :json)
end
