describe "SerpApi Desktop JSON" do

  describe "Organic Results for Book Hilton Hotel Austin" do

    before :all do
      @response = HTTP.get 'https://serpapi.com/search.json?q=Book+Hilton+Hotel+Austin&location=Dallas&hl=en&gl=us&source=test'
      @json = @response.parse
    end

    it "returns http success" do
      expect(@response.code).to be(200)
    end

    it "contains organic results array" do
      expect(@json["organic_results"]).to be_an(Array)
    end

    describe "have fourth booking.com result" do

      before :all do
        @result = @json["organic_results"][3]
      end

      it "is fourth" do
        expect(@result["position"]).to be(4)
      end

      it "titles Booking.com" do
        expect(@result["title"]).to eql("Hotel Hilton Austin Airport, TX - Booking.com")
      end

      it "links Booking.com" do
        expect(@result["link"]).to eql("https://www.booking.com/hotel/us/hilton-austin-airport.html")
        expect(@result["displayed_link"]).to eql("https://www.booking.com › USA › Texas › Greater Austin › Austin Hotels")
        expect(@result["cached_page_link"]).to be(nil)
        expect(@result["related_pages_link"]).to be(nil)
      end

      it "has a snippet" do 
        expect(@result["snippet"]).to_not be(nil)
      end

      it "has rich top snippet" do 
        expect(@result["rich_snippet"]["top"]["extensions"]).to be_an(Array)
        expect(@result["rich_snippet"]["top"]["extensions"][0]).to_not be_empty
        expect(@result["rich_snippet"]["top"]["extensions"][1]).to_not be_empty
        expect(@result["rich_snippet"]["top"]["extensions"][2]).to_not be_empty
      end

      it "has rich detected extensions" do 
        expect(@result["rich_snippet"]["top"]["detected_extensions"]["rating"]).to be_a(Float)
      end

      it "hasn't a result search box" do 
        expect(@result["sitelinks_search_box"]).to be(nil)
      end

      it "has not a thumbnail" do 
        expect(@result["thumbnail"]).to be(nil)
      end

    end

    describe "have fifth Hotels.com result" do

      before :all do
        @result = @json["organic_results"][4]
      end

      it "is first" do
        expect(@result["position"]).to be(5)
      end

      it "titles Hotels.com" do
        expect(@result["title"]).to eql("Book Hilton Austin in Austin | Hotels.com")
      end

      it "links Hotels.com" do
        expect(@result["link"]).to eql("https://www.hotels.com/ho216352/hilton-austin-austin-united-states-of-america/")
        expect(@result["displayed_link"]).to eql("https://www.hotels.com › ... › Texas Hotels › Austin Hotels")
        expect(@result["cached_page_link"]).to start_with("https://webcache.googleusercontent.com/")
        expect(@result["related_pages_link"]).to start_with("https://www")
      end

      it "has a snippet" do 
        expect(@result["snippet"]).to_not be(nil)
      end

      it "has rich top snippet" do 
        expect(@result["rich_snippet"]["top"]["extensions"]).to be_an(Array)
        expect(@result["rich_snippet"]["top"]["extensions"][0]).to_not be_empty
        expect(@result["rich_snippet"]["top"]["extensions"][1]).to_not be_empty
        expect(@result["rich_snippet"]["top"]["extensions"][2]).to_not be_empty
      end

      it "has rich detected extensions" do 
        expect(@result["rich_snippet"]["top"]["detected_extensions"]["rating"]).to be_a(Float)
        expect(@result["rich_snippet"]["top"]["detected_extensions"]["price_range_from"]).to be_a(Integer)
      end

      it "hasn't a result search box" do 
        expect(@result["sitelinks_search_box"]).to be(nil)
      end

      it "has not a thumbnail" do 
        expect(@result["thumbnail"]).to be(nil)
      end

    end

  end

end