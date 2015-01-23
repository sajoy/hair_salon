class Client

  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes[:name]
    @id = attributes[:id]
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO clients (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:update) do |attributes|
    @name = attributes[:name]
    DB.exec("UPDATE clients SET name = '#{@name}' WHERE id = #{self.id()};")
  end

  define_method(:delete) do
    DB.exec("DELETE FROM clients WHERE id = #{self.id()};")
    DB.exec("DELETE FROM appointments WHERE client_id = #{self.id()}")
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
    name().==(other_client.name())
  end


end
