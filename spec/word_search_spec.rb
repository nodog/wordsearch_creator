require_relative '../word_search.rb'

describe WordSearch do

  describe "#new" do

   it "creates a new WordSearch object" do
      @word_search = WordSearch.new('a_list', 'a_search')
      @word_search.should be_an_instance_of WordSearch
    end

  end

end
