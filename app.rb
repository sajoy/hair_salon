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
  if name.!=("")
    new_stylist = Stylist.new({:name => name, :id => nil})
    new_stylist.save()
  end
  redirect('/')
end

# stylist routes

get('/stylist/:id') do
  @id = params["id"].to_i()
  @stylist = Stylist.find(@id)
  @clients = @stylist.clients()
  erb(:stylist)
end

post('/add_client') do
  name = params["name"]
  @id = params["stylist_id"].to_i()
  @stylist = Stylist.find(@id)
  if name.!=("")
    new_client = Client.new({:name => name, :id => nil})
    new_client.save()
    @stylist.add_client(new_client)
  end
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

# client routes

get('/client/:id') do
  @id = params["id"].to_i()
  @client = Client.find(@id)
  erb(:client)
end

patch('/client/:id/edit') do
  name = params.fetch("name")
  @client = Client.find(params["id"].to_i())
  @client.update({:name => name})
  @id = @client.id()
  erb(:client)
end

delete("/client/:id/delete") do
  @client = Client.find(params["id"].to_i())
  @client.delete()
  redirect('/')
end
