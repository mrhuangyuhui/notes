# Learning Python 5E

## Chapter 8: Lists and Dictionaries

列表的长度、合并、重复
```
>>> len([1, 2, 3]) # Length
3
>>> [1, 2, 3] + [4, 5, 6] # Concatenation
[1, 2, 3, 4, 5, 6]
>>> ['Ni!'] * 4 # Repetition
['Ni!', 'Ni!', 'Ni!', 'Ni!']
```

列表和字符串的相互转化
```
>>> str([1, 2]) + "34" # Same as "[1, 2]" + "34"
'[1, 2]34'
>>> [1, 2] + list("34") # Same as [1, 2] + ["3", "4"]
[1, 2, '3', '4']
```

列表是否包含某元素、列表元素迭代
```
>>> 3 in [1, 2, 3] # Membership
True
>>> for x in [1, 2, 3]:
... print(x, end=' ') # Iteration (2.X uses: print x,)
...
1 2 3
```

列表推导表达式
```
>>> res = [c * 4 for c in 'SPAM'] # List comprehensions
>>> res
['SSSS', 'PPPP', 'AAAA', 'MMMM']
```

用map函数构造新列表
```
>>> list(map(abs, [−1, −2, 0, 1, 2])) # Map a function across a sequence
[1, 2, 0, 1, 2]
```

Indexing, Slicing, and Matrixes
```
>>> L = ['spam', 'Spam', 'SPAM!']
>>> L[2] # Offsets start at zero
'SPAM!'
>>> L[−2] # Negative: count from the right
'Spam'
>>> L[1:] # Slicing fetches sections
['Spam', 'SPAM!']
```

```
>>> matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
>>> matrix[1]
[4, 5, 6]
>>> matrix[1][1]
5
>>> matrix[2][0]
7
>>> matrix = [[1, 2, 3],
... [4, 5, 6],
... [7, 8, 9]]
>>> matrix[1][1]
5
```

Index and slice assignments
```
>>> L = ['spam', 'Spam', 'SPAM!']
>>> L[1] = 'eggs' # Index assignment
>>> L
['spam', 'eggs', 'SPAM!']
>>> L[0:2] = ['eat', 'more'] # Slice assignment: delete+insert
>>> L # Replaces items 0,1
['eat', 'more', 'SPAM!']
```

```
>>> L = [1, 2, 3]
>>> L[1:2] = [4, 5] # Replacement/insertion
>>> L
[1, 4, 5, 3]
>>> L[1:1] = [6, 7] # Insertion (replace nothing)
>>> L
[1, 6, 7, 4, 5, 3]
>>> L[1:2] = [] # Deletion (insert nothing)
>>> L
[1, 7, 4, 5, 3]
```

```
>>> L = [1]
>>> L[:0] = [2, 3, 4] # Insert all at :0, an empty slice at front
>>> L
[2, 3, 4, 1]
>>> L[len(L):] = [5, 6, 7] # Insert all at len(L):, an empty slice at end
>>> L
[2, 3, 4, 1, 5, 6, 7]
>>> L.extend([8, 9, 10]) # Insert all at end, named method
>>> L
[2, 3, 4, 1, 5, 6, 7, 8, 9, 10]
```

List method calls
```
>>> L = ['eat', 'more', 'SPAM!']
>>> L.append('please') # Append method call: add item at end
>>> L
['eat', 'more', 'SPAM!', 'please']
>>> L.sort() # Sort list items ('S' < 'e')
>>> L
['SPAM!', 'eat', 'more', 'please']
```

More on sorting lists
```
>>> L = ['abc', 'ABD', 'aBe']
>>> L.sort() # Sort with mixed case
>>> L
['ABD', 'aBe', 'abc']
>>> L = ['abc', 'ABD', 'aBe']
>>> L.sort(key=str.lower) # Normalize to lowercase
>>> L
['abc', 'ABD', 'aBe']
>>>
>>> L = ['abc', 'ABD', 'aBe']
>>> L.sort(key=str.lower, reverse=True) # Change sort order
>>> L
['aBe', 'ABD', 'abc']
```

```
>>> L = ['abc', 'ABD', 'aBe']
>>> sorted(L, key=str.lower, reverse=True) # Sorting built-in
['aBe', 'ABD', 'abc']
>>> L = ['abc', 'ABD', 'aBe']
>>> sorted([x.lower() for x in L], reverse=True) # Pretransform items: differs!
['abe', 'abd', 'abc']
```


