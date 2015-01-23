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


end
