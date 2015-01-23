require('rspec')
require('stylist')
require('client')
require('pg')


DB = PG.connect({:dbname => "hair_salon_test"})

RSpec.configure do |config|
  config.afteR(:each) do
    DB.exec("DELETE *FROM stylists;")
    DB.exec("DELETE *FROM clients;")

end
