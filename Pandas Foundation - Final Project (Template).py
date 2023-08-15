# -*- coding: utf-8 -*-

# -- Project --

# # Final Project - Analyzing Sales Data
# 
# **Date**: 15 August 2023
# 
# **Author**: Kittikom Chaichum
# 
# **Course**: `Pandas Foundation`


# import data
import pandas as pd
df = pd.read_csv("sample-store.csv")

# preview top 5 rows
df.head()

# shape of dataframe
df.shape

# see data frame information using .info()
df.info()

# We can use `pd.to_datetime()` function to convert columns 'Order Date' and 'Ship Date' to datetime.


# example of pd.to_datetime() function
pd.to_datetime(df['Order Date'].head(), format='%m/%d/%Y')

# TODO - convert order date and ship date to datetime in the original dataframe

df['Order Date'] = pd.to_datetime(df['Order Date'], format='%m/%d/%Y')
df['Ship Date'] = pd.to_datetime(df['Ship Date'], format='%m/%d/%Y')

df

# TODO - count nan in postal code column

nan_count = df['Postal Code'].isna().sum()
nan_count

# TODO - filter rows with missing values
df.dropna()

# TODO - Explore this dataset on your owns, ask your own questions
df_insight_prep = df.drop(['Order Date', 'Ship Date','Postal Code'], axis=1)
df_insight = df_insight_prep.describe(include='all').fillna('-')
df_insight

# ## Data Analysis Part
# 
# Answer 10 below questions to get credit from this course. Write `pandas` code to find answers.


# TODO 01 - how many columns, rows in this dataset
df_size = df.shape
df_size

# TODO 02 - is there any missing values?, if there is, which colunm? how many nan values?
nan_count = df.isna().sum()
nan_count

# TODO 03 - your friend ask for `California` data, filter it and export csv for him
california = df[df['State'] == 'California']
california

california.to_csv('california_data')

# TODO 04 - your friend ask for all order data in `California` and `Texas` in 2017 (look at Order Date), send him csv file

california_texas = df[(df['State'] == 'California') | (df['State'] == 'Texs')]

sorted_california_texas = california_texas.sort_values('Order Date', ascending=True)

sorted_california_texas.to_csv('sorted_california_texas')

# TODO 05 - how much total sales, average sales, and standard deviation of sales your company make in 2017
data2017 = df[df['Order Date'].dt.year == 2017]
data2017_prep = df.drop(['Order Date', 'Ship Date','Postal Code'], axis=1)
insight_2017 = data2017_prep.describe()
insight_2017

# TODO 06 - which Segment has the highest profit in 2018

max_profit = df['Profit'].max()
segment_with_max_profit = df[df['Profit'] == max_profit]['Segment'].iloc[0]
segment_with_max_profit

# TODO 07 - which top 5 States have the least total sales between 15 April 2019 - 31 December 2019

df['Order Date'] = pd.to_datetime(df['Order Date'])
start_date = '2019-04-15'
end_date = '2019-12-31'

date_range = df[(df['Order Date'] >= start_date) & (df['Order Date'] <= end_date)]
date_range.groupby('State')['Profit'].min().head(5)

# TODO 08 - what is the proportion of total sales (%) in West + Central in 2019 e.g. 25% 

total_sales = df['Sales'].sum()
year2019 = df[df['Order Date'].dt.year == 2019]
west_central2019 = df[(df['Order Date'].dt.year == 2019) & ((df['Region'] == 'West') | (df['Region'] == 'Central'))]
west_central2019_sales = west_central2019['Sales'].sum()

proportion_sales = (west_central2019_sales / total_sales) * 100
proportion_sales

# TODO 09 - find top 10 popular products in terms of number of orders vs. total sales during 2019-2020
top_quantity = df.groupby('Product Name')['Quantity'].sum().sort_values(ascending=False).head(10)
top_sales = df.groupby('Product Name')['Sales'].sum().sort_values(ascending = False).head(10)

print('------------------Top 10 Product based on Quantity of sales------------------')
print(top_quantity)
print('------------------Top 10 Product based on total sales------------------')
print(top_sales)

# TODO 10 - plot at least 2 plots, any plot you think interesting :)

category_chart = df['Category'].value_counts().plot(kind= 'bar', color = ['red', 'green', 'blue'])
segment_chart = df['Segment'].value_counts().plot(kind = 'bar',color = ['red', 'green', 'blue'])

# TODO Bonus - use np.where() to create new column in dataframe to help you answer your own questions
import numpy as np


mean_sale = df.dropna()['Sales'].mean()
good = np.where(df['Sales'] > mean_sale, True, False)

df['Good_Sales'] = np.where(df['Sales'] > mean_sale, True, False)

df

