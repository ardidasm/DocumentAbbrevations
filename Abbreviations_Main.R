#init
library(stringr)
library(tm)

#Import file

df <- file.choose() # Ensure you choose a text file.
df <- readLines(df)

# =====
# Extract uncomment the one you want use.

# -------------------
# This is anything that is in Caps and greater than 2 caps after each other
# -------------------
# df_output<-sapply(str_extract_all(df, '\\b[^()][A-Z]{2,}+\\b'), paste, collapse=' ') 

# -------------------
# This is for anything in brackets. 
# -------------------
# df_output<-sapply(str_extract_all(df, "\\([^()]+\\)"), paste, collapse=' ') 

# remove punctuation symbols
df_clean = gsub("[[:punct:]]", "", df_output)

# corpus
df_corpus = df_clean
df_corpus = Corpus(VectorSource(df_corpus))

# remove extra white-spaces
df_corpus = tm_map(df_corpus, content_transformer(stripWhitespace))

# term-document matrix
tdm = TermDocumentMatrix(df_corpus)

# Display the terms
tdm$dimnames$Terms
