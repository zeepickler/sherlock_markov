require 'csv'

# ruby scrape.rb sherlock_holmes.txt

source_text_file = ARGV[0]

# open txt source
f = File.open(source_text_file,'rb')

# break text into words
text = f.read.split(" ")

# close txt source
f.close

# create an array of subsequent word pairs n-gram (array)
# ie. "Mary had a little lamb"
# [
#   ["mary","had"],
#   ["had", "a"],
#   ["a", "little"],
#   ["little", "lamb"]
# ]
pairs = text.collect.each_with_index{|a,i| [a.downcase,text[i+1].downcase] unless text[i+1].nil? }.compact 

# create a master list of unique pairs
unique_pairs = pairs.uniq

# output file
csv = CSV.open('pairs.csv','wb')

# count the frequency of of a word pair
# ie. ['mary','had'] is 1 
# output to csv as ['mary','had', 1]

# Note: This algorithm isn't fast by any means ( O(n^2) ), but it works! :)
unique_pairs.each do |array|
  count = pairs.count(array)
  csv << [array, count].flatten
end

# close output file
csv.close

