json.array!(@pages) do |page|
  json.extract! page, :id
  json.value page.content[0][3..-1]
end
