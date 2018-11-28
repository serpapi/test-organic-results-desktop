describe "SerpApi Desktop" do

  describe "Organic Wikipedia.org Rank for Coffee" do

    before :all do
      @response = HTTP.get 'https://serpapi.com/search?q=Coffee&output=rank:wikipedia.org&location=Dallas&hl=en&gl=us&source=test'
    end

    it "returns http success" do
      expect(@response.code).to be(200)
    end

    it "returns correct wikipedia.org rank" do
      expect(@response.to_s).to eql("1")
    end

  end

  describe "Organic unknown.org Rank for Coffee" do

    before :all do
      @response = HTTP.get 'https://serpapi.com/search?q=Coffee&output=rank:unknown.org&location=Dallas&hl=en&gl=us&source=test'
    end

    it "returns http success" do
      expect(@response.code).to be(200)
    end

    it "returns correct unknown.org rank" do
      expect(@response.to_s).to eql("-")
    end

  end

end