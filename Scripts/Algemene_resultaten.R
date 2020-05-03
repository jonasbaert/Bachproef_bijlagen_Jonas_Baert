# Read excel file
library(readxl)
Algemeen <- read_excel("D:/HoGent_2019-2020/Bachelorproef/Resultaten/Algemeen.xlsx")
View(Algemeen)

# Algemene resultaten van het onderzoek

# Leeftijden van testpersonen
#leeftijden <- c(23, 30, 18, 30, 23, 20, 22, 39, 30, 24, 23, 23, 19, 23, 33, 49, 34, 23)

# Aandoeningen van testpersonen
#aandoeningen <- c("Verminderde handfunctie", "Verminderde handfunctie", "Verminderde handfunctie en CVI", "CVI", "Verminderde handfunctie", "CVI", "Verminderde handfunctie en CVI", "Verminderde handfunctie", "Verminderde handfunctie", "CVI", "CVI", "CVI", "Verminderde handfunctie", "CVI", "CVI", "Verminderde handfunctie", "Verminderde handfunctie", "Verminderde handfunctie", "Verminderde handfunctie")

# Verdeling leeftijd en geslacht
boxplot(Algemeen$Leeftijd ~ Algemeen$Geslacht, horizontal = TRUE, main = "Verdeling van leeftijd testpersonen per geslacht", xlab = "Leeftijd", ylab = "Geslacht")

# Verdeling leeftijd en aandoening
boxplot(Algemeen$Leeftijd ~ Algemeen$Aandoening, horizontal = TRUE, main = "Verdeling van leeftijd testpersonen per aandoening", xlab = "Leeftijd", ylab = "Aandoening")

# Verdeling leeftijd en smartphonegebruik
boxplot(Algemeen$Leeftijd ~ Algemeen$Smartphonegebruik, horizontal = TRUE, main = "Verdeling van leeftijd en smartphonegebruik", xlab = "Leeftijd", ylab = "Smartphonegebruik")
