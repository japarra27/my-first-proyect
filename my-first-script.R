# ipak function: install and load multiple R packages.
# check to see if packages are installed. Install them if they are not, then 
# load them into the R session.

ipak <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(new.pkg)) 
    install.packages(new.pkg, dependencies = TRUE)
  sapply(pkg, require, character.only = TRUE)
}

# usage
packages <- c("stringi", "tidyverse", "dslabs")
ipak(packages)

# Database heights

data(heights)

# Plot geom density between men and women 

heights %>%
  ggplot(aes(height, fill = sex)) +
  geom_density(alpha = 0.5)