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
    num = line[2].to_i
    prob[num] = [] if prob[num].nil?

    prob[num] << line[1]
  end

  # prob = {1 => ["foo"], 2 => ["bar", "baz"]}



  # get random number based on the total count
  choice = rand(total_count) + 1

  frequencies = prob.keys

  chosen_frequency = frequencies.min_by{|x| (x.to_f - choice).abs }

  chosen_word_array = prob[chosen_frequency]

  return chosen_word_array[rand(chosen_word_array.size)]
end


# select a starting word
word = array[ rand( array.size ) ][0] 

sentence = word

sentence_length.times do 

  word = get_next_word(word, array)
  sentence = sentence + ' ' + word

end

puts sentence


