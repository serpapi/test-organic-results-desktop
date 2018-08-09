describe "SerpApi Desktop JSON" do

  describe "Organic Results for Pewdiepie Montage" do

    before :all do
      @response = HTTP.get 'https://serpapi.com/search.json?q=Pewdiepie+Montage&location=Dallas&hl=en&gl=us&source=test'
      @json = @response.parse
    end

    it "returns http success" do
      expect(@response.code).to be(200)
    end

    it "contains organic results array" do
      expect(@json["organic_results"]).to be_an(Array)
    end

    describe "have first Pewdiepie YouTube result" do

      before :all do
        @result = @json["organic_results"][0]
      end

      it "is first" do
        expect(@result["position"]).to be(1)
      end

      it "titles Pewdiepie" do
        expect(@result["title"]).to eql("FUNNY MONTAGE.. #2 - YouTube")
      end

      it "links Pewdiepie video" do
        expect(@result["link"]).to eql("https://www.youtube.com/watch?v=MkXVM6ad9nI")
        expect(@result["displayed_link"]).to eql("https://www.youtube.com/watch?v=MkXVM6ad9nI")
        expect(@result["cached_page_link"]).to be(nil)
      end

      it "has a snippet" do 
        expect(@result["snippet"]).to_not be_empty
      end

      it "has rich top snippet" do 
        expect(@result["rich_snippet"]["top"]["extensions"]).to be_an(Array)
        expect(@result["rich_snippet"]["top"]["extensions"][0]).to_not be_empty
        expect(@result["rich_snippet"]["top"]["extensions"][1]).to_not be_empty
      end

      it "hasn't a result search box" do 
        expect(@result["sitelinks_search_box"]).to be(nil)
      end

      it "has a thumbnail" do 
        expect(@result["thumbnail"]).not_to be_empty
      end

    end

  end

end