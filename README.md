# Data Cleaning Project  

This is a project about data cleaning, and the data is from [kaggle](https://www.kaggle.com/lava18/google-play-store-apps).    
This dataset include missing value, complex formats need fixing up, and standardizing categories...etc.  
This repository using RStudio (Version 1.2.5019).

## Finding 

Total 13 variables:
1. App = application name, class:character.  
2. Category = category the app belongs to, class:character.  
3. Rating = app rating from 1 to 5, class:number.  
4. Reviews = number of reviews, class:number. 
5. Size = size of the app, class:character.  
6. Installs = number of installations, class:character.  
7. Type = free app or paid app, class:character.   
8. Price = price of the app, class:character.  
9. Content Rating = content classification by age, class:character.   
10. Genres =  genres, class:character.   
11. Last Updated = app last updated date, class:character.   
12. Current Ver = current version, class:character.    
13. Android Ver = android version, class:character.   

**The major problem is about data type that we need to deal with it.**

## Data summary

This dataset includes a lot of unique value character.

<img width="700" alt="summary" src="https://user-images.githubusercontent.com/67095395/91931804-4c270b00-ec99-11ea-87f8-9f018ce1e7ad.png">
<img width="1044" alt="head" src="https://user-images.githubusercontent.com/67095395/91934663-c60ec280-eca0-11ea-98da-b1391bf33353.png">

According to the chart above:  
**Size** : size is not just a simple number, it's number plus letter 'M' or 'K' like 19M, 8.7M, 79k,...,etc.
**Installs** : installs have a plus pattern ('+') behind numbers and comma between numbers like 10,000+, 5,000+,...,etc.
**Last Updated** : this is also a character class which should be a data type.

## Ideas

<img width="550" alt="unique" src="https://user-images.githubusercontent.com/67095395/91935894-8dbcb380-eca3-11ea-95be-dd4d008ca09e.jpeg">
1. Most character data need to convert to number.   
  Size : change size variable from 14M to 14000000 and 79K to 79000.     
  Installs : it has 19 levels from 1+ to 500,000,000+ installations without any sequence.   
  Last Updated : change to data type.  
  Content Rating : has 6 levels but without any order.
2. Some variables may include too many unique values which are not easy to analyze.  
3. Missing value only occurs in rating, my opinion is to simply just drop it or subsets it as a test dataset for test the prediction model.

## Result  

<img width="1044" alt="result1" src="https://user-images.githubusercontent.com/67095395/91941329-ea24d080-ecad-11ea-89d7-e19db37ed241.png">

## Next step   



## Code
Please see [code.r](https://github.com/ct627/data_cleaning_project/blob/master/code.R) for completely code details.  


