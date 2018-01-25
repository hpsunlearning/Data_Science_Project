Data Science Capstone Project
========================================================
author: HPSUN 
date: 2018-01-23
autosize: true

Overview
========================================================

This is the Data Science Capstone Project. 
Our task is to build an app that can predict the next word you want to input, and this app need to deployed in a smartphone. So this app must have feature below:

- Small in size

- Limited memory usage

- Accuracy



Algorithm
========================================================
- Data  
Coursera provide us corpora. It contains text from news, blog, and twitters and each have 200M in size. After necessary cleaning and processing, I got about 487M data in total.
- Process  
Ngrams was build using "quanteda" package. from 2 up to 4-grams were build using all the clean data.
- Algorithm  
I chooses "Stupid Backoff" to build my word predict model.  
The reason is because it's very simple, doesn't require complicate discount methods; and easy for pruning, after pruning, you don't need to recalculate discounting weight. 
- Pruning  
ngrams was pruned to keep only appeared more than n times. This n is in range 2-5, I use test data to balance the accuracy and the size. finally choose n2=5,n3=3,n4=2.



APP 
========================================================
left:40%
![alt text](screen.png)
Before you start, it need about 10 sec to load the data.
Then, you need to type some word in the input area, it will start to return the predicted word after one word typed in. 
***
The app is simple and fast
- the accuracy tested by 0.1% dataset is 20% first hit, 36.7% top five hits
- average time usage per prediction is about 0.008 sec  
    it is really fast, while you typing, the result is changing
- total package is about 37.3 MB 
- memory usage of the ngrams data is about 242 MB






Additional information
========================================================
Reference Links:
corpora can be download from here:
https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip

"Stupid Backoff" was discussed here:
http://www.aclweb.org/anthology/D07-1090.pdf

The app in Shiny:
https://hpsun001.shinyapps.io/next_word_predict/

Detailed are recorded here:
https://github.com/hpsunlearning/Data_Science_Project
