## Fun with Sherlock Holmes and N-Gram Frequency Counts

Given a body text, create a word pair N-Gram.

Now, if we count those frequencies of word pairs, we end up with a profile that uniquely identifies 
this piece of text. Now, say we are encountered by a completely new document that we know nothing about.
Using this same process we can compare the pair frequencies against our known document to see how they
compare.  High correlation suggests that this document is written by the same author (or a good imposter).
Near to moderately high correlation suggests that the author is writing about the same subject (in our case
Sherlock Holmes).

# To use:

1. Get a source text file, ie. the 'sherlock_holmes.txt' file provided
2. Run the scraper, ie. 'ruby scraper.rb sherlock_holmes.txt'. This builds a csv called 'pairs.csv', consisting
   of unique word pairs plus the number of times that pair occurs in the text ie. ["first word", "second word", 3]
3. To generate a sentence, use the 'pairs.csv' file to run the generator, ie. 'ruby generate.rb pairs.csv 20' creates a sentence 20 words long.

# Note: 

The sentence generator randomly selects the next word (given multiple pairs that match on the first word). 

# Errata: 

An alternate method called "get_next_word_weighted" will make the next word selection using the same frequencies as exist in the text. (The results were not as interesting.)

Consider:

['help','me',1]
['help','you',3]

In this instance, given the word 'help', 'you' will be chosen 75% of the time and 'me' will be chosen 25% of the time.