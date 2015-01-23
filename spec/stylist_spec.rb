require('spec_helper')

describe(Stylist) do

  describe('#id') do
    it("will return a stylist's unique id as a fixnum") do
      stylist1 = Stylist.new({:name => "Holly W.", :id => nil})
      expect(stylist1.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('#name') do
    it("will return a stylist's name") do
      stylist1 = Stylist.new({:name => "Jackson H.", :id => nil})
      expect(stylist1.name()).to(eq("Jackson H."))
    end
  end


end
