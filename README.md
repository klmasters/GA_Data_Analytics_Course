# SQL_GA_Class

SQL code I wrote from the General Assembly course on Data Analytics Sept - Nov 2018

# Data Dictionary

had access to 4 different tables for the project. Table for column names and data types

Sales table

| Column  | Data Type |
| ------------- | ------------- |
| date | has date and time stamp |
| description  | product name  |

# Project Perameters

Use the Postgres Iowa Liquor Sales database to assess next steps in a marketing campaign 

# Conclusions

I want to look at the best areas to put the marketing budget towards to increase sales in the region. I decided to look at sales by quarter for all of Iowa and saw that they have fallen steadily throughout 2014. Because there are only a few months of data in 2015 I filter it out of my analysis. 
Next, I counted the stores with sales by quarter and found that the number of sales in each quarter decreases throughout the year. I assuming that is because those stores closed though when I joined the stores table and the sales table to find inactive stores with sales I got no data. Possibly the stores table has not been updated? Possibly there is another explanation.
I made price buckets to see what price points have the most sales. By far those are the products priced >$50. Next, I looked at the most profitable categories. I think with this marketing budget that it is important to focus on the products that are the most popular. Those categories are: Canadian Whisky, 80 Proof Vodka, and Spiced Rum. Though all of these categories lost money throughout the year they are still the most popular across the state quarter over quarter.
Within these categories the marketing effort can be focused on a few key counties. I found that Clarke, Page, and Crawford county were the only ones to have an increase in sales between Q3 and Q4. I think the money would be best spent there to begin the increase sales. 

