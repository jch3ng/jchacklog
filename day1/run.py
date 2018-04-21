
from googlesearch import search

# to search
query = "John Cheng"

for j in search(query, tld="net", num=10, stop=1, pause=0):
    print(j)