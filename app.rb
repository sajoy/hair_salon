require('sinatra')
require('sinatra/reloader')
also_reload("lib/**/*.rb")
require('./lib/stylist')
require('./lib/client')
require('pg')

DB = PG.connect({:dbname => "hair_salon"})

get('/') do
  @stylists = Stylist.all()
  erb(:index)
end

post('/add_stylist') do
  name = params["name"]
  new_stylist = Stylist.new({:name => name, :id => nil})
  new_stylist.save()
  redirect('/')
end

get('/stylist/:id') do
  @id = params["id"].to_i()
  @stylist = Stylist.find(@id)
  @clients = @stylist.clients()
  erb(:stylist)
end

#
# post("/lists") do
#   name = params.fetch("name")
#   list = List.new({:name => name, :id => nil})
#   list.save()
#   @lists = List.all()
#   erb(:index)
# end
#
# get("/lists/:id") do
#   @id = params.fetch("id").to_i
#   @list = List.find(@id)
#   @tasks = @list.tasks()
#   erb(:list)
# end
