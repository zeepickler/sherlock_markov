require 'csv'

# To use this tool:
# First run scrape.rb with your text file.
# Now using the 'pairs.csv' output file, for example:
# 
# ruby generate.rb pairs.csv 20 
# ie. use pairs.csv input file and create a sentence 20 words long

csv_file = ARGV[0]
sentence_length = ARGV[1].to_i

array = []

CSV.open(csv_file,'rb') do |file|
  file.each{|line| array << line }
end

def get_next_word(first_word, array)
  word_array = []
  array.each do |line|
    word_array << line if line[0] == first_word
  end

  total_count = 0
  
  word_array.each do |line|
    total_count += line[2].to_i
  end

  # build probability model
  prob = {}
  word_array.each do |line|
    prob[line[1]] = line[2].to_i / total_count
  end

  # prob = {"foo" => 0.25, "bar" => 0.75}

  # get random number
  choice = rand

  delta = 1
  chosen_word = ""

  prob.each do |word, freq|
    diff = (freq - choice).abs
    if diff < delta
      delta = diff
      chosen_word = word
    end
  end

  return chosen_word
end


# select a starting word
word = array[ rand( array.size ) ][0] 

sentence = word

sentence_length.times do 

  word = get_next_word(word, array)
  sentence = sentence + ' ' + word

end

puts sentence


