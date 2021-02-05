require 'pry'
require 'json'
file = File.read('spec/fixtures/contestants.json')
data = JSON.parse(file)



def get_first_name_of_season_winner(data, season)
  data[season].find do |element|
    element["status"] == "Winner"
  end["name"].split.first
end


def all_contestants data
  data.values.flatten #.flatten removes a layer of the data structure
end 


def get_contestant_name(data, occupation)
  data.values.flatten.find do |contestant|
    contestant["occupation"] == occupation
  end["name"]
end



def count_contestants_by_hometown(data, hometown)
  data.values.flatten.reduce(0) do |sum, contestant|
    if contestant["hometown"] == hometown
      sum + 1
    else
      sum
    end
  end 
end

def get_occupation(data, hometown)
  data.values.flatten.find do |contestant|
    contestant["hometown"] == hometown
  end["occupation"]
end 

# def get_average_age_for_season(data, season)
#   age_total = data[season].sum do |contestant|
#     contestant["age"].to_f
#   end
#   (age_total / data[season].length).round
# end

#OR...

def get_average_age_for_season(data, season)
  age_total = data[season].reduce(0) do |sum, contestant|
    sum + contestant["age"].to_f
  end
  (age_total / data[season].length).round
end 