require_relative '../word_list'

describe WordList do

  describe "#new" do

   it "creates a new Wordlist object" do
      word_list = WordList.new('a_list')
      expect(word_list).to be_an_instance_of WordList
    end

  end

end
