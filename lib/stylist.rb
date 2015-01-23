class Stylist

  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes[:name]
    @id = attributes[:id]
  end




end
