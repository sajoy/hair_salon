require('spec_helper')

describe(Client) do

  describe('#id') do
    it("will return a client's unique id as a fixnum") do
      client1 = Client.new({:name => "Kris K.", :id => nil, :stylist_id => nil})
      client1.save()
      expect(client1.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('#name') do
    it("will return a client's name") do
      client1 = Client.new({:name => "David B.", :id => nil, :stylist_id => nil})
      expect(client1.name()).to(eq("David B."))
    end
  end

  describe("#save") do
    it("will save a new Client to the hair_salon database") do
      client1 = Client.new({:name => "Lily A.", :id => nil, :stylist_id => nil})
      client1.save()
      expect(Client.all()).to(eq([client1]))
    end
  end

  describe(".all") do
    it("will start empty") do
      expect(Client.all()).to(eq([]))
    end
  end

  describe("#==") do
    it("will say two Clients are equal if their names are the same") do
      client1 = Client.new({:name => "Lily A.", :id => nil, :stylist_id => nil})
      client1.save()
      client2 = Client.new({:name => "Lily A.", :id => nil, :stylist_id => nil})
      client2.save()
      expect(client1).to(eq(client2))
    end
  end


end
