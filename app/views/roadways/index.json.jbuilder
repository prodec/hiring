json.array!(@roadways) do |roadway|
  json.extract! roadway, :id, :tipo, :rodovia, :sentido, :conservacao
  json.url roadway_url(roadway, format: :json)
end
