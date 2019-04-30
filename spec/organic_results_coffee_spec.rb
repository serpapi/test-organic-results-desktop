describe "SerpApi Desktop JSON" do

  describe "Organic Results for Coffee" do

    before :all do
      @response = HTTP.get 'https://serpapi.com/search.json?q=Coffee&location=Dallas&hl=en&gl=us&source=test'
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

    describe "have first Wikipedia result" do

      before :all do
        @result = @json["organic_results"][0]
      end

      it "is first" do
        expect(@result["position"]).to be(1)
      end

      it "titles wikipedia" do
        expect(@result["title"]).to eql("Coffee - Wikipedia")
      end

      it "links wikipedia" do
        expect(@result["link"]).to eql("https://en.wikipedia.org/wiki/Coffee")
        expect(@result["displayed_link"]).to eql("https://en.wikipedia.org/wiki/Coffee")
        expect(@result["cached_page_link"]).to start_with("https://webcache.googleusercontent.com/")
        expect(@result["related_pages_link"]).to start_with("https://www")
      end

      it "has a snipprt" do 
        expect(@result["snippet"]).to_not be_empty
      end

      it "has expanded sitelinks" do
        expect(@result["sitelinks"]).to be_a(Hash)
        expect(@result["sitelinks"]["expanded"]).to be_a(Array)
        expect(@result["sitelinks"]["expanded"][0]["title"]).to_not be_empty
        expect(@result["sitelinks"]["expanded"][0]["link"]).to_not be_empty
      end

    end

  end

end