# Data Cleaning Project  

This is a project about data cleaning, and the data is from [kaggle](https://www.kaggle.com/lava18/google-play-store-apps). 
This dataset include missing value, complex formats need Fixing up, and standardizing categories...etc.  

## Finding 

Total 13 variables:
1. App = application name, class:character.  
2. Category = category, class:character.  
3. Rating = app rating from 1 to 5, class:number.  
4. Reviews = number of reviews, class:number. 
5. Size = app size, class:character.  
6. Installs = number of installations, class:character.  
7. Type = free app or cost app, class:character.   
8. Price = app price, class:character.  
9. Content Rating = content classification by age, class:character.   
10. Genres =  genres, class:character.   
11. Last Updated = app last updated date, class:character.   
12. Current Ver = current version, class:character.    
13. Android Ver = android version, class:character.   

## Data summary

This dataset includes a lot of unique value character.

<img width="1044" alt="summary" src="https://user-images.githubusercontent.com/67095395/91931804-4c270b00-ec99-11ea-87f8-9f018ce1e7ad.png">
<img width="1044" alt="head" src="https://user-images.githubusercontent.com/67095395/91931865-7e386d00-ec99-11ea-82c4-6aa039d6c4e2.png">

## Problem

1. Most character data need to convert to number.

2. Some variables may include too many unique values which are not easy to analyze.

3. Missing value only occurs in rating, my opinion is to simply just drop it or subsets it as a test dataset for test the prediction model.

## Result  

<img width="1044" alt="result1" src="">
<img width="1044" alt="result2" src="">

## Output  


## Next step   


## Code
Please see [code.r]() for completely code details.  


