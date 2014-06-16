class WordList

  attr_reader :words

  def initialize(word_list_name)
    @words = Array.new
    @words_by_uniq_letters = Array.new
    @words_list_file_name = word_list_name
  end

  def get_word_list
    puts "About to add to the WordList."
    File.readlines(@words_list_file_name).each do |line|
      if line != nil
        @words << line.upcase.strip
        puts "word added: #{line.upcase.strip}"
      end
    end
    puts "WordList complete."
    @words
  end

  def get_longest_length
    @longest = @words.max_by{|a| a.length}
    puts "Longest = #{@longest} with #{@longest.length} letters."
    @longest.length
  end

  def get_words_by_uniq_letters
    @words.each do |w|
      @words_by_uniq_letters << w.chars.to_a.uniq.sort.join
    end
    return @words_by_uniq_letters
  end
end
