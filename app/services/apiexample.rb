require 'rubygems'
require 'httparty'
require 'json'


class EducationalResty
  include HTTParty
  base_uri "data.cityofnewyork.us/resource"


  def posts
    self.class.get("/3ktt-gd74.json")
  end 



educational_resty = EducationalResty.new
response = educational_resty.posts
puts response.headers.inspect




if response.success?
  puts "Data fetched succesfully"


  data = JSON.parse(response.body)

  top_5_data = data.take(5)


  local_file_path = 'top_5_data.json'


  File.open(local_file_path, 'w') do |file|
    file.write(JSON.pretty_generate(top_5_data))
  end

  puts "data saved to #{local_file_path}"
  else
  puts "failed to fetch data. HTTP Status: #{response.code}"
  end
end

