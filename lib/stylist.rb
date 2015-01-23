class Stylist

  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes[:name]
    @id = attributes[:id]
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_singleton_method(:all) do
    all_stylists = []
    data = DB.exec("SELECT * FROM stylists;")
    data.each() do |stylist|
      name = stylist["name"]
      id = stylist["id"]
      all_stylists.push(Stylist.new({:name => name, :id => id}))
    end
    all_stylists
  end

  define_method(:==) do |other_stylist|
    name().==(other_stylist.name())
  end

  define_method(:add_client) do |client|
    #check if client belongs to another stylist
    data = DB.exec("SELECT * FROM appointments WHERE client_id = #{client.id()};")
    if data.first() == nil
    DB.exec("INSERT INTO appointments (stylist_id, client_id) VALUES (#{self.id()}, #{client.id()});")
    end
  end

  define_method(:delete_client) do |client|
    DB.exec("DELETE FROM appointments USING stylists WHERE stylists.id = #{self.id()} AND client_id = #{client.id()}")
  end

  define_method(:clients) do
    clients = []
    results = DB.exec("SELECT * FROM
    appointments JOIN clients ON (clients.id = appointments.client_id)
    WHERE appointments.stylist_id = #{self.id()};")
    results.each() do |client|
      name = client["name"]
      id = client["id"]
      clients.push(Client.new({:name => name, :id => id}))
    end
    clients
  end

end
