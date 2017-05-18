load('/home/cis1024/socialNetworkData/cnbc2017-05-10.RData')

library('dplyr')

#if you do not have the above package then install it

#create a dataframe

text_df<-data_frame(line=1:100, text=fb_page$message)

# divide the text into single words in a data frame
library('tidytext')

text_df2 <- text_df %>% unnest_tokens(word,text)

# remove any NA
text_df3<- na.omit(text_df2)

#remove stop words
data(stop_words)
text_df4 <- text_df3 %>% anti_join(stop_words)

# add the count 
ap_td <- text_df4 %>% group_by(line,word) %>% tally()

library('tm')

# Create document term matrix
m <- ap_td %>% cast_dtm(line, word, n)

# Check document term matrix
inspect(m)

dim(m)
 inspect(m[1:93,1:577])

#added by vivek
#to create a document term matrix for prediction
m_data1 <- ap_td %>% cast_sparse(line, word, n)