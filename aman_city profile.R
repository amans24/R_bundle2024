
#graph 1 -Population growth line chart

# Data (formatted without commas for numeric compatibility in R)
tot_pop <- c(32114, 35335, 38341, 45390, 63465, 89804, 139792, 205986, 
             338245, 452301, 707469, 1027264)

male_pop <- c(16573, 18038, 19910, 24060, 32488, 47752, 73977, 108758, 
              176554, 235335, 368196, 527365)

female_pop <- c(15541, 17297, 18431, 21330, 30977, 42052, 65815, 97228, 
                161691, 216966, 339273, 499899)

# Year data remains the same
yrs <- c(1901, 1911, 1921, 1931, 1941, 1951, 1961, 1971, 1981, 1991, 2001, 2011)

# Create the plot with 'tot_pop' as the main line
plot(yrs, tot_pop, type = "o", col = "black", pch = 16, lty = 1,
     xlab = "Year", ylab = "Population", ylim = c(0, 1100000),
     main = "Population Growth of Raipur Muncipal corporation(1901-2011)", xaxt = 'n', yaxt = 'n')

# Add the male population line
lines(yrs, male_pop, type = "o", col = "blue", pch = 17, lty = 2)

# Add the female population line
lines(yrs, female_pop, type = "o", col = "red", pch = 18, lty = 3)

# Add a legend to distinguish the lines
legend("topleft", legend = c("Total Population", "Male Population", "Female Population"),
       col = c("black", "blue", "red"), pch = c(16, 17, 18), lty = c(1, 2, 3))

#ADD text lables
text(x=2011,y=1027264,labels="1027264",pos=3,col="black")
text(x=2011,y= 527365,labels=" 527365",pos=3,col="blue")
text(x=2011,y=499899,labels="499899",pos=1,col="red")

#add axis labels

axis(1,seq(1901,2011,by=10),)
axis(2,seq(0,1100000,by=100000))

#graph 2 - land use barplot raipur

# Data Preparation
categories <- c("Residential", "Commercial", "Industrial", 
                "Public Utilities", "Recreational", "Transportation")
areas_hectares <- c(2050, 180, 430, 450, 100, 500)
percentages <- c("55.3%", "4.8%", "11.6%", "12.1%", "2.7%", "13.5%")

# Define colors for each bar
bar_colors <- c("red", "blue", "green", "purple", "orange", "brown")

# Plotting the bar chart with customized Y-axis limits and colors
bar_midpoint<-barplot(
  areas_hectares, 
  names.arg = categories, 
  col = bar_colors,         # Assign different colors to bars
  main = "Urban Land Use Pattern in Raipur MC", 
  xlab = "Land Use Categories", 
  ylab = "Area (Hectares)", 
  ylim = c(0, 2500),        # Set Y-axis limit from 0 to 2500
  las = 1,                  # Make category labels 
  cex.names = 0.8  ,font=2         # Adjust label size
)

# Adding percentage labels above the bars
text(
  x =bar_midpoint, 
  y = areas_hectares+100, 
  labels =percentages, 
  pos = 3,                 # Place labels above the bars
  cex = 1  ,adj=1             # Adjust text size
)

#GRAPH 3 -Religious population Stacked Bar chart

# Define the religion names
religions <- c("Hindu", "Muslim", "Christian", "Sikh", "Buddhist", "Jain", "Other Religions", "Religion Not Stated")

# Define the male and female populations for each religion
male_populations <- c(462660, 37659, 7605, 7618, 3663, 7292, 212, 656)
female_populations <- c(437436, 36002, 7918, 7023, 3617, 7041, 207, 655)

# Combine male and female populations into a matrix
pop_matrix <- rbind(male_populations, female_populations)
colnames(pop_matrix) <- religions
rownames(pop_matrix) <- c("Male", "Female")

# Define colors for each gender
colors <- c("skyblue", "lightpink")

# Plot the stacked bar chart
barplot(pop_matrix,
        beside = FALSE,             # Stack males and females
        col = colors,               # Use defined colors for genders
        legend.text = rownames(pop_matrix),  # Add legend for Male and Female
        args.legend = list(x = "topright"),  # Position the legend
        main = "Population by Religion and Gender in Raipur",
        xlab = "Religion",
        ylab = "Population")


#graph-04-pie chart religion wise

# Main Pie Chart (Hindu, Muslim, and Other Religions)

# Define the religion names and populations
religion_labels <- c("Hindu", "Muslim", "Other Religions")
population_values <- c(900096, 73661, sum(15523, 14641, 7280, 14333, 419, 1311))

# Calculate percentages for each group
total_pop <- sum(population_values)
percentages <- round(population_values / total_pop * 100, 1)
labels <- paste(religion_labels, percentages, "%")

# Define colors for the pie chart
colors <- c("orange", "lightgreen", "grey")

# Plot the pie chart
pie(population_values,
    labels = labels,
    col = colors,
    main = "Raipur:Religionwise Population Distribution")

# Pie Chart for Breakdown of "Other Religions"

# Define the smaller religions within "Other Religions" and their populations
other_labels <- c("Christian", "Sikh", "Buddhist", "Jain", "Other miscellaneous Religions", "Religion Not Stated")
other_values <- c(15523, 14641, 7280, 14333, 419, 1311)

# Calculate percentages for each smaller religion
total_other <- sum(other_values)
other_percentages <- round(other_values / total_other * 100, 1)
other_labels <- paste(other_labels, other_percentages, "%")

# Define colors for each smaller religion
other_colors <- c("gold", "mediumseagreen", "orchid", "slateblue", "darkorange", "lightcoral")

# Plot the pie chart for "Other Religions" breakdown
pie(other_values,
    labels = other_labels,
    col = other_colors,
    main = "Breakdown of Other Religions")

#Graph 05- sc population in all wards

# Load necessary library
library(readxl)

# Load data
file_path <- "Raipur census population data (1).xlsx"
ward_data <- read_excel(file_path, sheet = "City pop(ward level)")

# Select relevant columns: Ward, SC population (Male and Female)
sc_data <- ward_data[, c("Ward", "M_SC", "F_SC")]
sc_data <- sc_data[!is.na(sc_data$Ward), ]  # Remove rows without ward numbers

# Set up data for stacked bar plot
male_sc <- sc_data$M_SC
female_sc <- sc_data$F_SC
wards <- as.factor(sc_data$Ward)  # Ensure ward numbers are treated as factors

# Plot: Stacked bar plot of SC population by ward
barplot(rbind(male_sc, female_sc), beside = FALSE, col = c("lightblue", "lightpink"),
        names.arg = wards, las = 2, cex.names = 0.7,
        main = "Scheduled Caste Population by Ward",
        xlab = "Ward Number", ylab = "SC Population",ylim=c(0,6000))

# Add legend
legend("topright", legend = c("Male", "Female"), fill = c("lightblue", "lightpink"))
abline(h=4000,lty=1,col="red")

#graph-06- illiteracy rate ward level

library(readxl)
file_path <- "raipur only ward.xlsx"
file_path
raipur_sheet<-read_excel(file_path)
raipur_sheet
threshold<-6000
bar_col<-ifelse(raipur_sheet$P_ILL>threshold,"red","lightgreen")
barplot(raipur_sheet$P_ILL,beside=T,names.arg=raipur_sheet$Ward,col=bar_col,ylim =c(0,10000),main="Ward level illiterate population",xlab="wards",ylab="illiterate population ")
abline(h=6000,col="red")

#graph-07- marginal workers ward level

library(readxl)
file_path <- "raipur only ward.xlsx"
file_path
raipur_sheet<-read_excel(file_path)
raipur_sheet
threshold<-900
bar_col<-ifelse(raipur_sheet$MARGWORK_P>threshold,"red","lightyellow")
barplot(raipur_sheet$MARGWORK_P,beside=T,names.arg=raipur_sheet$Ward,col=bar_col,ylim =c(0,2000),main="Ward level marginal workers population",xlab="wards",ylab="Marginal workers population ")
abline(h=900,col="red")


#Graph 8: pie chart sex ratio

# Data
population <- c(527365, 499899)  # Male, Female counts
labels <- c("Male", "Female")  # Labels
percentages <- round(population / sum(population) * 100, 1)  # Calculate percentages
labels_with_pct <- paste(labels, percentages, "%")  # Add percentages to labels

# Create pie chart
pie(
  population, 
  labels = labels_with_pct, 
  col = c("skyblue", "lightcoral"), 
  main = "Sex Ratio: Raipur City", 
  radius = 1, 
  init.angle = 140
)


#Graph 09 :

library(readxl)
getwd()
dir()
raipur<-read_excel("raipur only ward.xlsx")
View(raipur)
plot(raipur$F_LIT, raipur$MAINWORK_F, pch=20, col="pink", 
     main="Correlation - Total Female Population and Working Female Population",
     xlab="Total Female Population", ylab="Total Working Female Population")
abline(lm(raipur$MAINWORK_F~raipur$F_LIT), col="grey", lwd=2)

# Plot the scatter plot
plot(raipur$F_LIT, raipur$MAINWORK_F, pch=20, col="blue", 
     main="Correlation bw Literate Female Population and Female Population involved in Primary job",
     xlab="Total literate Female Population", ylab="Total Working Female Population involved in Primary work")

# Fit the linear regression model
model <- lm(raipur$MAINWORK_F ~ raipur$F_LIT)

# Add the regression line
abline(model, col="grey", lwd=2)



cor(raipur$MAINWORK_F,raipur$F_LIT)
resid(model)
print(model)
hist(resid(model))
