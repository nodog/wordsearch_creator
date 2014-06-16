#!usr/bin/ruby

# pooters
# nodog
# 2014-02-10
#
# wordsearch_creator.rb
# uses a text file (words_in.txt) to get a list of words (one per line) and then creates
# an output file (wordsearch.txt) which is a wordsearch of those words.

require './word_list'
require './word_search'

WORDLISTFILE = 'words_in.txt'
WORDSEARCHFILE = 'wordsearch.txt'

# --- main ---
ws = WordSearch.new(WORDLISTFILE, WORDSEARCHFILE)
ws.create_wordsearch
ws.print_wordsearch
