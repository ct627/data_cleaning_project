# Loading data and import libraries
pacman::p_load(dplyr,tidyr,tidyverse,tictoc,ggmap,skimr,lubridate,forcats,readr,h2o,lubridate,stringr,xts,highcharter,Amelia,tibble)
googleplaystore <- read_csv("google-play-store-apps/googleplaystore.csv")
summary(googleplaystore)
head(googleplaystore)
data <- googleplaystore %>% filter(Type == "Free") %>% select(-Price,-Type)
data_na <- data %>% filter(is.na(Rating))
data <- data %>% na.omit(Rating)
str(data)

# change size to numeric.

data <- data %>%
  filter(Size != "Varies with device")
B <- data %>%
  mutate(M = gsub("^.*(M)","1000000",Size)) %>%
  mutate(K = gsub("^.*(k)","1000",Size)) %>%
  mutate(m = ifelse(M =="1000000", 1000000, 1)) %>%
  mutate(k = ifelse(K =="1000", 1000, 1)) %>%
  mutate(size = strsplit(Size, "M|k")) %>%
  mutate(realsize = as.numeric(size)*k*m)

# Set up data for use

newdata <- B %>% select(App,Rating,Genres,Reviews,realsize,Installs,`Content Rating`,`Last Updated`,`Current Ver`,`Android Ver`)
newdata_na <- newdata %>% filter(is.na(Rating)) # NA on Rating
newdata <- newdata %>% na.omit(Rating)

# Check unique levels of variables

newdata %>%
  select(Genres) %>%
  group_by(Genres) %>%
  summarise()
# 109 levels on Genres.


newdata %>%
  select(Installs) %>%
  group_by(Installs) %>%
  summarise()
# 19 levels Installs.


newdata %>%
  select(`Content Rating`) %>%
  group_by(`Content Rating`) %>%
  summarise()
# 6 levels on Content Rating.


newdata$`Last Updated` <- as.Date(newdata$`Last Updated`, '%B %e,%Y')
newdata %>%
  select(`Last Updated`) %>%
  group_by(`Last Updated`) %>%
  summarise()
# 1189 different dates on Last Updated.


newdata %>%
  select(`Current Ver`) %>%
  group_by(`Current Ver`) %>%
  summarise()
# 2422 different current ver. 


newdata %>%
  select(`Android Ver`) %>%
  group_by(`Android Ver`) %>%
  summarise()
# 32 different Android Ver.

# visualization


#Rating and Last Updated
newdata %>% select(Rating,`Last Updated`) %>%
  ggplot(aes(x=`Last Updated`,y=Rating)) + geom_point()


#Rating and Content Rating
x <- newdata %>% select(`Content Rating`)
newdata$`Content Rating` <- with(x, ifelse(x == "Adults only 18+",5,
                                           ifelse(x == "Mature 17+",4,
                                                  ifelse(x == "Teen", 3,
                                                         ifelse(x == "Everyone 10+", 2,1)))))
summary(newdata$`Content Rating`)
str(newdata$`Content Rating`)
boxplot(Rating~`Content Rating`,data=newdata,
        main="Rating and Content Rating",xlab="Content Rating Age",
        ylab="Rating",col="orange",border="brown",names = c("0+","10+","13+","17+","18+"))


#Rating and Installs
t <- newdata
t$Installs <- with(x, ifelse(t$Installs == "1+",1,
                             ifelse(t$Installs == "5+",2,
                                    ifelse(t$Installs == "10+", 3,
                                           ifelse(t$Installs == "50+",4,
                                                  ifelse(t$Installs == "100+",5,
                                                         ifelse(t$Installs == "500+",6,
                                                                ifelse(t$Installs == "1,000+",7,
                                                                       ifelse(t$Installs == "5,000+",8,
                                                                              ifelse(t$Installs == "10,000+",9,
                                                                                     ifelse(t$Installs == "50,000++",10,
                                                                                            ifelse(t$Installs == "100,000+",11,
                                                                                                   ifelse(t$Installs == "500,000+",12,
                                                                                                          ifelse(t$Installs == "1,000,000+",13,
                                                                                                                 ifelse(t$Installs == "5,000,000+",14,
                                                                                                                        ifelse(t$Installs == "10,000,000+",15,
                                                                                                                               ifelse(t$Installs == "50,000,000+",16,
                                                                                                                                      ifelse(t$Installs == "100,000,000+",17,
                                                                                                                                             ifelse(t$Installs == "500,000,000+",18,19
                                                                                                                                             )))))))))))))))))))
table(t$Installs)
summary(t$Installs)
tt <- newdata
tt$Installs <- with(x, ifelse(tt$Installs %in% c("1+","5+","10+","50+","100+","500+","1,000+","5,000+"),"A",
                              ifelse(tt$Installs %in% c("10,000+","100,000+"),"B",
                                     ifelse(tt$Installs %in% c("500,000+","1,000,000+"),"C","D"
                                     ))))
table(tt$Installs)
boxplot(Rating~Installs,data=t,
        main="Rating and Installs",xlab="Installs",
        ylab="Rating",col="orange",border="brown")
boxplot(Rating~Installs,data=tt,
        main="Rating and Installs",xlab="Installs",
        ylab="Rating",col="orange",border="brown")


#Rating and Rivews
newdata %>% select(Rating,Reviews) %>%
  ggplot(aes(x=Rating,y=Reviews)) + geom_point()


#Rating and realsize
newdata %>% select(Rating,realsize) %>%
  ggplot(aes(x=Rating,y=realsize)) + geom_point()



