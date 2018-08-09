describe "SerpApi Desktop JSON" do

  describe "Organic Results for Coffee in Arabic" do

    before :all do
      @response = HTTP.get 'https://serpapi.com/search.json?q=%D9%82%D9%87%D9%88%D8%A9&location=Saudi+Arabia&hl=ar&gl=sa&google_domain=google.com.sa&source=test'
      @json = @response.parse
    end

    it "returns http success" do
      expect(@response.code).to be(200)
    end

    it "contains organic results array" do
      expect(@json["organic_results"]).to be_an(Array)
    end

    describe "have fourth Wikipedia result" do

      before :all do
        @result = @json["organic_results"][3]
      end

      it "is fourth" do
        expect(@result["position"]).to be(4)
      end

      it "titles wikipedia" do
        expect(@result["title"]).to eql("قهوة - ويكيبيديا، الموسوعة الحرة")
      end

      it "links wikipedia" do
        expect(@result["link"]).to eql("https://ar.wikipedia.org/wiki/%D9%82%D9%87%D9%88%D8%A9")
        expect(@result["displayed_link"]).to eql("https://ar.wikipedia.org/wiki/قهوة")
        expect(@result["cached_page_link"]).to start_with("https://webcache.googleusercontent.com/")
        expect(@result["related_pages_link"]).to start_with("https://www")
      end

      it "has a snipprt" do 
        expect(@result["snippet"]).to_not be_empty
      end

      it "has inline sitelinks" do
        expect(@result["sitelinks"]).to be_a(Hash)
        expect(@result["sitelinks"]["inline"]).to be_a(Array)
        expect(@result["sitelinks"]["inline"][0]["title"]).to_not be_empty
        expect(@result["sitelinks"]["inline"][0]["link"]).to_not be_empty
      end

    end

  end

end