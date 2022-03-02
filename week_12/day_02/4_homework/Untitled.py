#!/usr/bin/env python
# coding: utf-8

# In[2]:


import pandas as pd


# In[4]:


drinks_content = pd.read_csv("data/starbucks_drinkMenu_expanded.csv")


# In[8]:


drinks_content.head(5)


# In[9]:


drinks_content.tail(5)


# In[11]:


drinks_content


# In[12]:


drinks_content.shape


# In[13]:


drinks_content.columns


# In[14]:


#the mean
drinks_content.Calories.mean()


# In[15]:


#min
drinks_content.Calories.min()


# In[17]:


drinks_content.Calories.max()


# In[ ]:


#Select the variables Beverage_category, Beverage, Beverage prep and Calories 


# In[18]:


drinks = drinks_content.loc[:, ["Beverage", "Beverage_category", "Beverage_prep", "Calories"]]


# In[20]:


#Check if there are NA values
drinks.isna().sum()


# In[21]:


#Q4
drinks.loc[:, "calorie_diff"] = drinks["Calories"]-135 
drinks


# In[24]:


#Summarise the mean number of calories in each beverage category.

drinks.groupby("Beverage_category")["Calories"].mean()


# In[ ]:





# In[ ]:





# In[30]:


#Filter the dataset drinks so we only take "Classic Espresso Drinks", and save this in a new data frame called espresso_drinks.
drinks.loc[drinks["Beverage_category"] == "Classic Espresso Drinks"]


# In[39]:


#Group your espresso_drinks data frame by the type of Beverage prep, and then find out the mean calories for each drink group
espresso_drinks.groupby("Beverage_prep").mean()


# In[32]:





# In[ ]:


#Get the same grouped mean Calories values as above, but this time sorted in descending order. (Hint: so you're able to sort the resulting groupby by the 'Calories' column you will want to ensure you get back a dataframe and not a series)


# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:




