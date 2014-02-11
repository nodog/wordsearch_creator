#!/usr/bin/ruby

# pooters
# nodog
# 2014-02-10
#
# wordsearch_creator.rb
# uses a text file (words_in.txt) to get a list of words (one per line) and then creates
# an output file (wordsearch.txt) which is a wordsearch of those words.

WORDLISTFILE = 'words_in.txt'
WORDSEARCHFILE = 'wordsearch.txt'

class WordList

  attr_reader :words

  def initialize
    @words = Array.new
  end

  def get_word_list
    puts "About to add to the WordList."
    File.readlines(WORDLISTFILE).each do |line|
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

end

class WordSearch

  def initialize
    @wl = WordList.new
    @words = @wl.get_word_list
    @letters = @words.join
    @grid = Array.new
  end

  def string_shuffle(s)
      s.split("").shuffle.join
  end

  def create_wordsearch
    puts " all letters: #{@letters}"

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


# --- main ---
ws = WordSearch.new
ws.create_wordsearch
ws.print_wordsearch
