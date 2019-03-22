describe "SerpApi Desktop JSON" do

  describe "Organic Results for Coffee" do

    before :all do
      @response = HTTP.get 'https://serpapi.com/search.json?q=Coffee&location=Dallas&hl=en&gl=us&num=10&start=10&source=test'
      @json = @response.parse
    end

    it "returns http success" do
      expect(@response.code).to be(200)
    end

    it "contains organic results array" do
      expect(@json["organic_results"]).to be_an(Array)
    end

    it "total_results" do
      expect(@json["search_information"]["total_results"]).to be_an(Integer)
      expect(@json["search_information"]["total_results"]).to be > 1000000
    end

    it "time_taken_displayed" do
      expect(@json["search_information"]["time_taken_displayed"]).to be_an(Float)
    end

  end

end