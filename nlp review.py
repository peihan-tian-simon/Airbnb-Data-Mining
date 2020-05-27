import nltk.data
import pandas as pd
from nltk.corpus import stopwords
from nltk.tokenize import word_tokenize
from wordcloud import WordCloud, STOPWORDS 
import matplotlib.pyplot as plt
stopwords.words('english')
from nltk.book import *


review=pd.read_csv('./reviews_details.csv',nrows=1000)

review.head()


tokens=[t for t in review['comments'].str.split()]

sr = set(stopwords.words('english'))

clean_tokens=[]
for x in tokens[:]:
    try:
        clean_tokens.extend(x)
    except:
        continue
clean_tokens=[word.lower() for word in clean_tokens ]

print(0)
filtered_sentence=[]
for word in clean_tokens:
    if word not in sr:
        filtered_sentence.append(word)


# all_word=[]
# for i in clean_tokens[1:100]:
#     try:
#         all_word+=i
#     except:
#         continue
print(1)
freq = nltk.FreqDist(filtered_sentence)


# all_word=[]
# for wordlist in clean_tokens:
#     all_word+=wordlist
# freq = nltk.FreqDist(clean_tokens)

# for key,val in freq.items(): 
#     print (str(key) + ':' + str(val))

freq.plot(20,cumulative=False)

text=''
for word in filtered_sentence:
    text=text+''+word

wordcloud = WordCloud(width = 800, height = 800, 
                background_color ='white', 
                stopwords = sr, 
                min_font_size = 10).generate(text) 
# plot the WordCloud image  
plt.figure() 
plt.imshow(wordcloud, interpolation="bilinear") 
plt.axis("off") 
plt.margins(x=0, y=0) 
plt.show() 