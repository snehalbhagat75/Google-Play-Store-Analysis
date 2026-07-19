#!/usr/bin/env python
# coding: utf-8

# In[4]:


import seaborn as sns
import matplotlib.pyplot as plt
import pandas as pd 
import numpy as np


# In[34]:


df = pd.read_csv(r"C:\Users\sneha\OneDrive\Documents\New folder\Google PlayStore Data\google_playstore_cleaned.csv")


# In[35]:


df


# # Missing Values

# In[8]:


plt.figure(figsize=(10,5))

sns.heatmap(df.isnull(), cbar=False)

plt.title("Missing Values Heatmap")

plt.show()


# In[ ]:


# Insight

Most missing values exist in the Size column because many apps have "Varies with device."
Remaining features are nearly complete.


# # Top 15 App Categories

# In[11]:


plt.figure(figsize=(12,7))

df["Category"].value_counts().head(15).plot(
    kind="bar",
    color="steelblue"
)

plt.title("Top 15 App Categories")

plt.xlabel("Category")

plt.ylabel("Number of Apps")

plt.xticks(rotation=45)

plt.show()


# In[ ]:


# Business Insight

Categories with the largest number of apps indicate highly competitive markets.
New developers may find it harder to stand out in these categories.


# # Rating Distribution

# In[12]:


plt.figure(figsize=(8,5))

sns.histplot(
    df["Rating"],
    bins=20,
    kde=True
)

plt.title("Distribution of App Ratings")

plt.xlabel("Rating")

plt.show()


# In[ ]:


# Business Insight

Most applications receive ratings between 4.0 and 4.5, suggesting generally positive user satisfaction


# # Free vs Paid Apps

# In[13]:


type_counts = df["Type"].value_counts()

plt.figure(figsize=(6,6))

plt.pie(
    type_counts,
    labels=type_counts.index,
    autopct="%1.1f%%",
    startangle=90
)

plt.title("Free vs Paid Apps")

plt.show()


# In[ ]:


# Business Insight

Free applications dominate the Play Store.
Revenue often depends on ads or in-app purchases rather than upfront pricing.


# # Top Categories by Installs

# In[14]:


top_install = (
    df.groupby("Category")["Installs"]
      .sum()
      .sort_values(ascending=False)
      .head(10)
)

plt.figure(figsize=(12,6))

top_install.plot(
    kind="bar",
    color="green"
)

plt.title("Top Categories by Total Installs")

plt.xlabel("Category")

plt.ylabel("Total Installs")

plt.xticks(rotation=45)

plt.show()


# In[ ]:


# Business Insight

Categories with high install counts represent the largest customer base and highest market demand.


# # Top Rated Categories

# In[15]:


top_rating = (
    df.groupby("Category")["Rating"]
      .mean()
      .sort_values(ascending=False)
      .head(10)
)

plt.figure(figsize=(12,6))

top_rating.plot(
    kind="bar",
    color="orange"
)

plt.title("Top Rated Categories")

plt.ylabel("Average Rating")

plt.xticks(rotation=45)

plt.show()


# In[ ]:


# Business Insight

High average ratings indicate strong user satisfaction and product quality.


# # Reviews vs Rating

# In[16]:


plt.figure(figsize=(10,6))

sns.scatterplot(
    x="Reviews",
    y="Rating",
    data=df,
    alpha=0.5
)

plt.title("Reviews vs Rating")

plt.show()


# In[ ]:


# Business Insight

Determine whether highly reviewed applications also receive better ratings.


# # Size Distribution

# In[17]:


plt.figure(figsize=(10,5))

sns.histplot(
    df["Size"],
    bins=30
)

plt.title("App Size Distribution")

plt.xlabel("Size (MB)")

plt.show()


# # Price Distribution

# In[18]:


paid = df[df["Price"] > 0]

plt.figure(figsize=(8,5))

sns.histplot(
    paid["Price"],
    bins=30
)

plt.title("Price Distribution of Paid Apps")

plt.xlabel("Price ($)")

plt.show()


# In[ ]:


# Business Insight

Most paid applications are priced at lower price points to encourage purchases.


# # Rating by Category

# In[19]:


plt.figure(figsize=(16,8))

sns.boxplot(
    x="Category",
    y="Rating",
    data=df
)

plt.xticks(rotation=90)

plt.title("Category-wise Rating Distribution")

plt.show()


# # Correlation Heatmap

# In[20]:


numeric = df.select_dtypes(include=["int64","float64"])

plt.figure(figsize=(8,6))

sns.heatmap(
    numeric.corr(),
    annot=True,
    cmap="coolwarm",
    fmt=".2f"
)

plt.title("Correlation Heatmap")

plt.show()


# In[ ]:


# Business Insight

Examine relationships among installs, reviews, prices, ratings, and size.
Identify variables that tend to move together.


# # Top Genres

# In[21]:


plt.figure(figsize=(12,6))

df["Genres"].value_counts().head(10).plot(
    kind="bar",
    color="purple"
)

plt.title("Top Genres")

plt.xticks(rotation=45)

plt.show()


# # Apps Updated by Year

# In[41]:


plt.figure(figsize=(10,6))

df["Last Updated"].value_counts().sort_index().plot(
    kind="line",
    marker="o",
    linewidth=2
)

plt.title("Apps Updated Over Time")
plt.xlabel("Year")
plt.ylabel("Number of Apps")
plt.grid(True)

plt.show()


# # Top 10 Most Reviewed Apps

# In[42]:


top_reviews = (
    df.sort_values("Reviews", ascending=False)
      .head(10)
)

plt.figure(figsize=(12,6))

sns.barplot(
    x="Reviews",
    y="App",
    data=top_reviews
)

plt.title("Top 10 Most Reviewed Apps")

plt.show()


# In[ ]:




