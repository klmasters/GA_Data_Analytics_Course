# Project Perameters

Use the Iowa Liquor Sales Database to assess next steps in a marketing campaign. 

# Conclusions

For this project I started by looking at sales by quarter for all of Iowa and saw that they have fallen steadily throughout 2014. Because there are only a few months of data from 2015 I filter that out of my analysis. 

Next, I counted the stores with sales by quarter and found that the number of sales in each quarter decreases throughout the year. I assumed that's because those stores closed but when I joined the stores table and the sales table to find inactive stores with sales I got no data. (Turned out that most weekend sales data was missing from the database which is probably the main explaination for falling sales)

I made price buckets to see what price points have the most sales. By far those are the products priced >$50. Next, I looked at the most profitable categories. I think with this marketing budget it is important to focus on the products that are the most popular. Those categories are: Canadian Whiskey, 80 Proof Vodka, and Spiced Rum. Though all of these categories lost money throughout the year they are still the most popular across the state quarter over quarter.

Within these categories the marketing effort can be focused on a few key counties. I found that Clarke, Page, and Crawford county were the only ones to have an increase in sales between Q3 and Q4. I think the money would be best spent there to begin the increase sales. 

All the code that I used to come to these conclusions is in the files. 
