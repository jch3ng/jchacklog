from googlesearch import search

query = "john cheng"
 
for j in search(query, tld="", num=10, stop=1, pause=2):
    print(j)
