## Fun with Sherlock Holmes and Markov Chain Frequency Counts

Markov Chains (in our case subsequent word pairs), create a list of all the pairs for a given text.
Now, if we count those frequencies of word pairs, we end up with a profile that uniquely identifies 
this piece of text. Now, say we are encountered by a completely new document that we know nothing about.
Using this same process we can compare the pair frequencies against our known document to see how they
compare.  High correlation suggests that this document is written by the same author (or a good imposter).
Near to moderately high correlation suggests that the author is writing about the same subject (in our case
Sherlock Holmes).

After some googling, it appears that this technique is effective and commonly used. As well, papers have been
written about the topic, such as:

[Counting Markov Types](https://www.cs.purdue.edu/homes/spa/papers/aofa10.pdf)


But now that is getting over my head! :)