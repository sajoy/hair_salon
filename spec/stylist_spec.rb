require('spec_helper')

describe(Stylist) do

  describe('#id') do
    it("will return a stylist's unique id as a fixnum") do
      stylist1 = Stylist.new({:name => "Holly W.", :id => nil})
      stylist1.save()
      expect(stylist1.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('#name') do
    it("will return a stylist's name") do
      stylist1 = Stylist.new({:name => "Jackson H.", :id => nil})
      expect(stylist1.name()).to(eq("Jackson H."))
    end
  end

  describe("#save") do
    it("will save a new Stylist to the hair_salon database") do
      stylist1 = Stylist.new({:name => "Avril L.", :id => nil})
      stylist1.save()
      expect(Stylist.all()).to(eq([stylist1]))
    end
  end

  describe(".all") do
    it("will start empty") do
      expect(Stylist.all()).to(eq([]))
    end

    it("will return an array of all saved Stylists") do
      stylist1 = Stylist.new({:name => "Holly W.", :id => nil})
      stylist1.save()
      stylist2 = Stylist.new({:name => "Jackson H", :id => nil})
      stylist2.save()
      stylist3 = Stylist.new({:name => "Avril L.", :id => nil})
      stylist3.save()
      expect(Stylist.all()).to(eq([stylist1, stylist2, stylist3]))
    end
  end

  describe("#==") do
    it("will say two Stylists are equal if their names are the same") do
      stylist1 = Stylist.new({:name => "Avril L.", :id => nil})
      stylist2 = Stylist.new({:name => "Avril L.", :id => nil})
      expect(stylist1).to(eq(stylist2))
    end
  end

  describe("#add_client") do
    it("will add assign a client to a Stylist") do
      stylist1 = Stylist.new({:name => "Pepper P.", :id => nil})
      stylist1.save()
      client1 = Client.new({:name => "Yoshi", :id => nil})
      client1.save()
      stylist1.add_client(client1)
      expect(stylist1.clients()).to(eq([client1]))
    end

    it("will not allow a client to be assigned to a second stylist") do
      stylist1 = Stylist.new({:name => "Pepper P.", :id => nil})
      stylist1.save()
      stylist2 = Stylist.new({:name => "Jackson H.", :id => nil})
      stylist2.save()
      client1 = Client.new({:name => "Yoshi", :id => nil})
      client1.save()
      stylist1.add_client(client1)
      stylist2.add_client(client1)
      expect(stylist2.clients()).to(eq([]))
    end
  end

  describe("#delete_client") do
    it("will delete a client from a Stylist's list") do
      stylist1 = Stylist.new({:name => "Pepper P.", :id => nil})
      stylist1.save()
      client1 = Client.new({:name => "Yoshi", :id => nil})
      client1.save()
      stylist1.add_client(client1)
      stylist1.delete_client(client1)
      expect(stylist1.clients()).to(eq([]))
    end
  end

  describe("#clients") do
    it("will return a Stylists client list") do
      stylist1 = Stylist.new({:name => "Pepper P.", :id => nil})
      stylist1.save()
      client1 = Client.new({:name => "Yoshi", :id => nil})
      client1.save()
      stylist1.add_client(client1)
      client2 = Client.new({:name => "Princess Peach", :id => nil})
      client2.save()
      stylist1.add_client(client2)
      expect(stylist1.clients()).to(eq([client1, client2]))
    end
  end

end
