require_relative 'word_list'

class WordSearch

  def initialize(word_list_name, word_search_name)
    @wl = WordList.new(word_list_name)
    @words = @wl.get_word_list
    @letters = @words.join
    @grid = Array.new
    @word_search_name = word_search_name
  end

  def string_shuffle(s)
      s.split("").shuffle.join
  end

  def create_wordsearch
    puts " all letters: #{@letters}"

    words_by_uniq_letters = @wl.get_words_by_uniq_letters
    words_by_uniq_letters.each do |w|
      puts "uniq letters in word - #{w.to_s}"
    end

    longest_len = @wl.get_longest_length
    height = @words.size
    ratio = height/longest_len

    0.upto(height/ratio - 1) do |i|
      @grid[i] = ''
      0.upto(ratio - 1) do |j|
        if @words[i + j * height / ratio] != nil
          @grid[i] << @words[i + j * height / ratio] 
        end
      end
      rand_letts = string_shuffle @letters
      @grid[i] << rand_letts[0..(ratio*longest_len - @grid[i].size - 1)]
    end
  end


  def print_wordsearch
    puts @grid
  end
end
