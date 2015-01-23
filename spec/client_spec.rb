require('spec_helper')

describe(Client) do

  describe('#id') do
    it("will return a client's unique id as a fixnum") do
      client1 = Client.new({:name => "Kris K.", :id => nil})
      client1.save()
      expect(client1.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('#name') do
    it("will return a client's name") do
      client1 = Client.new({:name => "David B.", :id => nil})
      expect(client1.name()).to(eq("David B."))
    end
  end

  describe(".find") do
    it("will return a Client by its given id") do
      client1 = Client.new({:name => "George W.", :id => nil})
      client1.save()
      expect(Client.find(client1.id())).to(eq(client1))
    end
  end

  describe("#save") do
    it("will save a new Client to the hair_salon database") do
      client1 = Client.new({:name => "Lily A.", :id => nil})
      client1.save()
      expect(Client.all()).to(eq([client1]))
    end
  end

  describe("#update") do
    it("will allow a user to update a Client's name") do
      client1 = Client.new({:name => "Georgia A.", :id => nil})
      client1.save()
      client1.update({:name => "Georgio A."})
      expect(client1.name()).to(eq("Georgio A."))
    end
  end

  describe("#delete") do
    it("will delete a Client from the database") do
      client1 = Client.new({:name => "Georgia A.", :id => nil})
      client1.save()
      client1.delete()
      expect(Client.all()).to(eq([]))
    end
  end

  describe(".all") do
    it("will start empty") do
      expect(Client.all()).to(eq([]))
    end
  end

  describe("#==") do
    it("will say two Clients are equal if their names are the same") do
      client1 = Client.new({:name => "Lily A.", :id => nil})
      client1.save()
      client2 = Client.new({:name => "Lily A.", :id => nil})
      client2.save()
      expect(client1).to(eq(client2))
    end
  end


end
