json.array!(@points) do |point|
  json.extract! point, :id, :tipo, :rodovia, :sentido, :conservacao
  json.url point_url(point, format: :json)
end
