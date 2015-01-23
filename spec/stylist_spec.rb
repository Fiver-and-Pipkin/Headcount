require('spec_helper')

describe(Stylist) do
  describe(".all") do
    it("starts off with no stylists") do
      expect(Stylist.all()).to eq([])
    end
  end

  describe(".find") do
    it("returns a stylist by ID number") do
      test_stylist = Stylist.new({:name => "Monsieur Champagne", :id => nil})
      test_stylist.save()
      test_stylist2 = Stylist.new({:name => "Legros de Rumigny", :id => nil})
      test_stylist2.save()
      expect(Stylist.find(test_stylist2.id())).to eq(test_stylist2)
    end
  end

  describe("#name") do
    it("tells you stylist name") do
      stylist = Stylist.new({:name => "Monsieur Champagne", :id => nil})
      expect(stylist.name()).to eq("Monsieur Champagne")
    end
  end

  describe("#id") do
    it("sets its ID when you save it") do
      stylist = Stylist.new({:name => "Legros de Rumigny", :id => nil})
      stylist.save()
      expect(stylist.id()).to be_an_instance_of(Fixnum)
    end
  end

  describe('#save') do
    it("lets you save stylists to the salon database") do
      stylist = Stylist.new({:name => "Monsieur Champagne", :id => nil})
      stylist2 = Stylist.new({:name => "Legros de Rumigny", :id => nil})
      stylist.save()
      stylist2.save()
      expect(Stylist.all()).to eq([stylist, stylist2])
    end
  end

  describe("#clients") do
    it("returns list of clients for that stylist") do
      test_stylist = Stylist.new({:name => "Sydney Guilaroff", :id => nil})
      test_stylist.save()
      test_client = Client.new({:client_name => "Joan Crawford", :list_id => test_stylist.id()})
      test_client.save()
      test_client2 = Client.new({:client_name => "Greta Garbo", :list_id => test_stylist.id()})
      test_client2.save()
      expect(test_stylist.clients()).to(eq([test_client, test_client2]))
    end
  end

  describe("#==") do
    it("is the same stylist if it has the same name and id") do
      stylist1 = Stylist.new({:name => "Sydney Guilaroff", :id => nil})
      stylist2 = Stylist.new({:name => "Sydney Guilaroff", :id => nil})
      expect(stylist1).to eq(stylist2)
    end
  end

  describe("#update") do
    it("lets you update stylists in the database") do
      stylist = Stylist.new({:name => "Sydney Guilaroff", :id => nil})
      stylist.save()
      stylist.update({:name => "Legros de Rumigny"})
      expect(stylist.name()).to eq("Legros de Rumigny")
    end
  end

  describe("#delete") do
    it("lets you delete a stylist from the database") do
      stylist = Stylist.new({:name => "Sydney Guilaroff", :id => nil})
      stylist.save()
      stylist2 = Stylist.new({:name => "Legros de Rumigny", :id => nil})
      stylist2.save()
      stylist.delete()
      expect(Stylist.all()).to eq([stylist2])
    end

    it("deletes a stylist's clients from the database") do
      stylist = Stylist.new({:name => "Sydney Guilaroff", :id => nil})
      stylist.save()
      client = Client.new({:client_name => "Greta Garbo", :list_id => stylist.id()})
      client.save()
      client2 = Client.new({:client_name => "Joan Crawford", :list_id => stylist.id()})
      client2.save()
      stylist.delete()
      expect(Client.all()).to(eq([]))
    end
  end
end
