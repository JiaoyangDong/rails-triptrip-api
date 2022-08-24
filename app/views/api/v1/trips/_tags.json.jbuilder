json.tags do
  json.array! tags do |tag|
    json.extract! tag, :id, :name, :show, :active, :style, :icon, :indexactive
  end
end
