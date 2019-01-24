require 'pry'

def get_first_name_of_season_winner(data, season)
  data[season].find { |person| person["status"] == "Winner" }["name"].split.first
end

def get_contestant_name(data, occupation)
  data.values.flatten.find { |person| person["occupation"] == occupation }["name"]
end

def count_contestants_by_hometown(data, hometown)
  data.values.flatten.map { |person| person["hometown"] == hometown ? 1 : 0 }
                      .reduce(:+)
end

def get_occupation(data, hometown)
  data.values.flatten.find { |person| person["hometown"] == hometown }["occupation"]
end

def get_average_age_for_season(data, season)
  ages = data[season].map { |person| person["age"].to_f }
  (ages.reduce(:+) / ages.size).round
end
