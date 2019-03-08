#!/usr/bin/env python
# Utils for manipulating texts.

def ngrams(line, n):
    '''
    Returns a list of ngrams from some string.
        @line -> string to split
        @n -> ngram size
    >>> unigrams = ngrams('one', 1)
    >>> [ u for u in unigrams ]
    [('o',), ('n',), ('e',)]
    >>> bigrams = ngrams('soul and body scars'.split(), 2)
    >>> [ b for b in bigrams ]
    [('soul', 'and'), ('and', 'body'), ('body', 'scars')]
    '''
    return zip(*[line[i:] for i in range(n)])

def chunk(text, n):
    '''
    Breaks text into roughly-equal n chunks.
        @text -> iterable to chunk
        @n -> number of chunks to break the text into
    >>> chunk('name', 2)
    ['na', 'me']
    >>> chunk(['a', 'list', 'of', 'words'], 3)
    [['a'], ['list', 'of'], ['words']]
    >>> chunk([], 4)
    [[], [], [], []]
    '''
    splitsize = 1.0 / chunknum * len(body)
    return [ body[int(round(i*splitsize)):int(round((i+1)*splitsize))] for i in range(chunknum)]

if __name__ == "__main__":
    import doctest
    doctest.testmod()
