
library(dplyr)
library(ggplot2)
library(tidyr)
library(stringr)

# Circular one
CircleGraph <- function(dataset, variable) {
  my.data <- group_by(dataset, SEX, ID) %>%
    summarize(count = n())
  
  my.data <- my.data[!(is.na(my.data$SEX) | my.data$SEX == "" | my.data$ID ==""), ]
  
  total <- group_by(my.data, SEX) %>%
    summarize(sum = sum(count)) 
  colnames(total) <- c("Sex","total")
  
  
  secret.data <- filter(my.data, ID == "Secret Identity") %>%
    select(SEX,count) 
  colnames(b.data) <- c("Sex","secret")
  
  public.data <- filter(my.data, ID == "Public Identity") %>%
    select(SEX,count)
  colnames(g.data) <- c("Sex","public")
  
  none.data <- filter(my.data, ID == "No Dual Identity") %>%
    select(SEX,count)
  colnames(n.data) <- c("Sex","none")
  
  known.data <- filter(my.data, ID == "Known to Authorities Identity") %>%
    select(SEX,count)
  colnames(n.data) <- c("Sex","known")
  
  circular <- ggplot(pcnt, aes(x = Gender, y = eval(parse(text = variable)) ,fill = Gender)) + 
    geom_bar(width = 0.85, stat ="identity") +    
    
    # To use a polar plot and not a basic b arplot
    coord_polar(theta = "y") +    
    
    #Remove useless labels of axis
    xlab("") + ylab("") +
    
    #Increase ylim to avoid having a complete circle
    ylim(c(0,75)) + 
    
    #Add group labels close to the bars :
    geom_text(data = pcnt, hjust = 1, size = 3, aes(x = Gender, y = 0, label = Gender)) +
    
    #Remove useless legend, y axis ticks and y axis text
    theme(legend.position = "none" , axis.text.y = element_blank() , axis.ticks = element_blank()) +
    
    ggtitle(paste("Proportion of each gender for ", as.character(char), "Characteristic")) +
    
    scale_fill_manual("legend", values = c("Male" = "#56B4E9", "Female" = "pink")) +
    
    theme(plot.title = element_text(size = 22)) +
    theme(plot.title = element_text(hjust = 0.5))
  
  return(circular)
}