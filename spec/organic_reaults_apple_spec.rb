describe "SerpApi Desktop JSON" do

  describe "Organic Results for Apple" do

    before :all do
      @response = HTTP.get 'https://serpapi.com/search.json?q=Apple&location=Dallas&hl=en&gl=us&source=test'
      @json = JSON.parse @response
    end

    it "returns http success" do
      expect(@response.code).to be(200)
    end

    it "contains organic results array" do
      expect(@json["organic_results"]).to be_an(Array)
    end

    describe "have first Apple website result" do

      before :all do
        @result = @json["organic_results"][0]
      end

      it "is first" do
        expect(@result["position"]).to be(1)
      end

      it "titles Apple" do
        expect(@result["title"]).to eql("Apple")
      end

      it "links apple website" do
        expect(@result["link"]).to eql("https://www.apple.com/")
        expect(@result["displayed_link"]).to eql("https://www.apple.com/")
        expect(@result["cached_page_link"]).to start_with("https://webcache.googleusercontent.com/")
        expect(@result["related_pages_link"]).to be_nil
      end

      it "has a snippet" do 
        expect(@result["snippet"]).to_not be_empty
      end

      it "has a result search box" do 
        expect(@result["sitelinks_search_box"]).to be(true)
      end

      it "has not a thumbnail" do 
        expect(@result["thumbnail"]).to be_nil
      end

      it "has expanded sitelinks" do
        expect(@result["sitelinks"]).to be_a(Hash)
        expect(@result["sitelinks"]["expanded"]).to be_a(Array)
        expect(@result["sitelinks"]["expanded"][0]["title"]).to_not be_empty
        expect(@result["sitelinks"]["expanded"][0]["link"]).to_not be_empty
        expect(@result["sitelinks"]["expanded"][0]["snippet"]).to_not be_empty
      end

    end

  end

end