# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""


import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import accuracy_score
from collections import Counter


# Read the CSV file
df = pd.read_csv("/Users/michellekoh/Documents/github_projects/connections_predictions/dataset/Connections_Data.csv" )

df_clean = df.dropna(subset=['Word', 'Group Name'])


# Convert words and group names to lowercase
df_clean['Word'] = df_clean['Word'].str.lower()
df_clean['Group Name'] = df_clean['Group Name'].str.lower()



# Extract features (words) and labels (group names)
X = df_clean['Word']
y = df_clean['Group Name']


# Convert words to numerical features using TF-IDF
vectorizer = TfidfVectorizer()
X_tfidf = vectorizer.fit_transform(X)

# Split data into training and test sets (80% train, 20% test)
X_train, X_test, y_train, y_test = train_test_split(X_tfidf, y, test_size=0.2, random_state=42)

# Train a Random Forest classifier
clf = RandomForestClassifier(n_estimators=100, random_state=42)
clf.fit(X_train, y_train)

# Make predictions on test set
y_pred = clf.predict(X_test)

# Evaluate model accuracy
accuracy = accuracy_score(y_test, y_pred)
print(f"Model Accuracy: {accuracy:.2f}")

# Function to predict group name for 4 words
def predict_group_name(words):
    words_tfidf = vectorizer.transform([word.lower() for word in words])  # Convert words to TF-IDF
    predicted_groups = clf.predict(words_tfidf)  # Predict each word's group
    most_common_group = Counter(predicted_groups).most_common(1)[0][0]  # Find the most common group
    return most_common_group

# Test with a random set of 4 words from the dataset
random_words = np.random.choice(df_clean['Word'], 4, replace=False)
predicted_group = predict_group_name(random_words)

print(f"Words: {random_words.tolist()} → Predicted Group: {predicted_group}")

predict_group_name(['ALIEN', 'AVATAR', 'DUNE', 'TRON'])


