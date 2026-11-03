library(ggplot2)
library(readr)
library(plyr)
library(stringr)

#copy the path to your .csv file, but USE FORWARD SLASHES
path_to_file <- "C:/Users/YOU/Downloads/Streamlined Spell Sigils - data_for_r.csv"

#select what colour you want your sigil (hex code or options here: https://r-charts.com/colors/)
sigil_colour <- "black"

#do you want the image to have a background? Same options as above
#or leave as NA for no background (transparent image)
background_colour <- NA

#tell it what you want the image file called
#IF YOU DO NOT CHANGE THE NAME, IT WILL SAVE OVER YOUR EXISTING IMAGES
image_name <- "sigil"

#tell it where you want the image file saved, but USE FORWARD SLASHES
save_image_here <- "C:/Users/YOU/Downloads"


#Then run all the code
#-------------------------------------------------------------------------------
data <- read_csv(path_to_file)
#View(data)

#I always forget to uppercase view
view <- function(x) {
  View(x)
}

#create base for sigil
sigil <- ggplot(data, aes(ex, why))
sigil <- sigil + theme(panel.background = element_rect(fill = sigil_colour)) +
  theme_void() #no labels
  
#change background colour, if applicable
if(!is.na(background_colour)) {
  sigil <- sigil + 
    theme(panel.background = element_rect(fill = background_colour))
}
  
#add 17 points
sigil <- sigil + geom_point(size = 3, colour = sigil_colour) #add the dots
#sigil

#create df of lines
line_df <- data[data$binary == 1,]
#view(line_df)

#make a function to draw all the lines
draw <- function(line){
  if (any(line_df$k_val == line)) {
    sigil <<- sigil + geom_smooth(aes(x = ex, y = why), data = line_df[line_df$k_val == line,], 
                                 method = "lm", se = FALSE, color = sigil_colour)
  }
}

#now use it
draw("k1a")
draw("k1b")
draw("k1c")
draw("k1d")
draw("k1e")
draw("k1f")
draw("k2a")
draw("k2b")
draw("k2c")
draw("k2d")
draw("k2e")
draw("k2f")
draw("k3a")
draw("k3b")
draw("k3c")
draw("k3d")
draw("k3e")
draw("k3f")
draw("k4a")
draw("k4b")
draw("k4c")
draw("k4d")
draw("k4e")
draw("k4f")
draw("k5a")
draw("k5b")
draw("k5c")
draw("k5d")
draw("k5e")
draw("k5f")
draw("k6a")
draw("k6b")
draw("k6c")
draw("k6d")
draw("k6e")
draw("k6f")
draw("k7a")
draw("k7b")
draw("k7c")
draw("k7d")
draw("k7e")
draw("k7f")
draw("k8a")
draw("k8b")
draw("k8c")
draw("k8d")
draw("k8e")
draw("k8f")


#volia
sigil

#and save it to the designated location
if(is.na(background_colour)) {
  ggsave(filename = paste(image_name,".png"), path = save_image_here, 
         device = "png", width = 1000, height = 1000, units = "px")
} else if (!is.na(background_colour)) {
  ggsave(filename = paste(image_name,".png"), path = save_image_here, 
         device = "png", width = 1000, height = 1000, units = "px", bg = background_colour)
}

print(str_glue("check {save_image_here}! {image_name} should be there!"))
