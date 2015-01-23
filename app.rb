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

post('/add_client') do
  name = params["name"]
  @id = params["stylist_id"].to_i()
  new_client = Client.new({:name => name, :id => nil})
  new_client.save()
  @stylist = Stylist.find(@id)
  @stylist.add_client(new_client)
  @clients = @stylist.clients()
  erb(:stylist)
end

patch('/stylist/:id/edit') do
  name = params.fetch("name")
  @stylist = Stylist.find(params["id"].to_i())
  @stylist.update({:name => name})
  @clients = @stylist.clients()
  @id = @stylist.id()
  erb(:stylist)
end

delete("/stylist/:id/delete") do
  @stylist = Stylist.find(params["id"].to_i())
  @stylist.delete()
  @stylists = Stylist.all()
  erb(:index)
end
