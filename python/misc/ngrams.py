#!/usr/bin/env python
# Break a string into its constitutent n-grams, for some arbitrary value of n

def ngrams(line, n):
    '''Returns a list of ngrams from some string.
        @line -> string to split
        @n -> ngram size
    '''
    return zip(*[line[i:] for i in range(n)])
