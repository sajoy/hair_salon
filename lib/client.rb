class Client

  attr_reader(:name, :id, :stylist_id)

  define_method(:initialize) do |attributes|
    @name = attributes[:name]
    @id = attributes[:id]
    if attributes[:stylist_id] != nil
      @stylist_id = attributes[:stylist_id]
    else
      @stylist_id = 0
    end
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO clients (name, stylist_id) VALUES ('#{@name}', #{@stylist_id}) RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_singleton_method(:all) do
    all_clients = []
    data = DB.exec("SELECT * FROM clients;")
    data.each() do |client|
      name = client["name"]
      id = client["id"]
      all_clients.push(Client.new({:name => name, :id => id}))
    end
    all_clients
  end

  define_method(:==) do |other_client|
    name().==(other_client.name()).&(stylist_id().==(other_client.stylist_id()))
  end


end
