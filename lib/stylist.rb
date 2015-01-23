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


end
