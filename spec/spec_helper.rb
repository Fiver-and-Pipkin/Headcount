require("rspec")
require("pg")
require("stylist")
require("pry")

DB = PG.connect({:dbname => "salon_test"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM stylists *;")
  end
end
