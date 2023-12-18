require 'json'

pairs = {11 => 13, 17 => 19}
json_res = pairs.to_json
pp json_res

data = JSON.parse(json_res)
pp data
