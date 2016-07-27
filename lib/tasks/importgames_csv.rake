require 'csv'

namespace :db do
  task :importgames_csv => :environment do
    CSV.foreach("gamesapi.csv", :headers => true) do |row|
      Gamesapi.create!(row.to_hash)
    end
  end
end
