# De analyse van de testen

# Data uit de excel files halen
library(readxl)
Stappen_niet_toegankelijk <- read_excel("D:/HoGent_2019-2020/Bachelorproef/Resultaten/Stappen_niet-toegankelijk.xlsx")
View(Stappen_niet_toegankelijk)

Stappen_toegankelijk <- read_excel("D:/HoGent_2019-2020/Bachelorproef/Resultaten/Stappen_toegankelijk.xlsx")
View(Stappen_niet_toegankelijk)

# Analyse niet-toegankelijke app

# Totaal succesvol vs totaal onsuccesvol
aantalNT <- table(Stappen_niet_toegankelijk$SlotsomNT)/19 * 100 # 19 = totaal aantal testpersonen

barplot(aantalNT, main = "Algemeen verloop van gebruik niet-toegankelijke app")

# Analyse toegankelijke app
aantalT <- table(Stappen_toegankelijk$Slotsom)/19 * 100

barplot(aantalT, main = "Algemeen verloop van gebruik toegankelijke app")

# Vergelijking tussen aantal succesvol vs aantal onsucccesvol
matrix <- rbind(c(5.26, 84.2), c(94.74, 15.8)) # De uitgekomen waarden hierboven

# t : toegankelijk
# nt : niet-toegankelijk

#    succes onsucces
# t   94.74   5.26
# nt  15.8    84.2

bp <- barplot(prop.table(matrix, 2) * 100, beside = TRUE, main = "Gebruik van toegankelijke app versus niet-toegankelijke app", ylab = "percentage", ylim = c(0, 100), names.arg = c("Toegankelijk", "Niet-toegankelijk"), col = c("black", "lightgrey"))
legend("topright", c("Onsuccesvol", "Succesvol"), fill = c("black", "lightgrey"))
axis(side=2,at=bp[1+c(0,20,40,60,80)],labels=c(20,40,60,80,100))

# Top 5 meestgebruikte apps
apps <- read_excel("D:/HoGent_2019-2020/Bachelorproef/Resultaten/Appgebruik.xlsx")
View(apps)

apps$...1 <- NULL # Verwijder de eerste kolom zodat er met correcte waarden kan worden gewerkt.

appsWithTotal <- rbind(apps, colSums(apps)) # Voeg een rij met totalen toe onderaan de tabel.
View(appsWithTotal)

ftApps <- appsWithTotal[20,] # Behou enkel de rij met totalen

topFiveApps <- head(sort(ftApps, decreasing = TRUE), n = 5) # Sorteer van hoog naar laag
View(topFiveApps)
topFiveApps <- topFiveApps[,1:5] # Neem de 5 kolommen met de hoogste waarden

bpTopApps <- barplot(as.matrix(topFiveApps), main = "Top 5 meest gebruikte apps bij de testpersonen") # Creëer de grafiek
axis(side = 2, at = bpTopApps[1 + c(0, 5, 10, 15, 20)], labels = c(5, 10, 15, 20, 25)) # Voeg correcte labels toe aan grafiek

# Top 5 meestgebruikte hulpmiddelen
hulpmiddelen <- read_excel("D:/HoGent_2019-2020/Bachelorproef/Resultaten/Toegankelijkheidsopties.xlsx")
View(hulpmiddelen)
hulpmiddelen$...1 <- NULL

hulpmiddelenWithTotal <- rbind(hulpmiddelen, colSums(hulpmiddelen))
View(hulpmiddelenWithTotal)
ftHulp <- hulpmiddelenWithTotal[20,]

topFiveHulp <- head(sort(ftHulp, decreasing = TRUE), n = 5)
topFiveHulp <- topFiveHulp[,1:5]
View(topFiveHulp)

barplot(as.matrix(topFiveHulp), main = "Top 5 meest gebruikte toegankelijkheidsopties bij de testpersonen")

# Top 5 problemen bij de niet-toegankelijke app
problemen <- read_excel("D:/HoGent_2019-2020/Bachelorproef/Resultaten/Problemen_app.xlsx")
View(problemen)
problemen$...1 <- NULL

problemenWithTotal <- rbind(problemen, colSums(problemen))
View(problemenWithTotal)
ftProblemen <- problemenWithTotal[20,]

topFiveProblemen <- head(sort(ftProblemen, decreasing = TRUE), n = 5)
topFiveProblemen <- topFiveProblemen[,1:5]
View(topFiveProblemen)

barplot(as.matrix(topFiveProblemen), main = "Top 5 problemen bij niet-toegankelijke app")

# Merkbare verbeteringen van de toegankelijke app t.o.v. de niet-toegankelijke app
verbeteringen <- read_excel("D:/HoGent_2019-2020/Bachelorproef/Resultaten/Opmerkingen_toegankelijk.xlsx")
View(verbeteringen)
verbeteringen$...1 <- NULL
verbeteringen$Mooier <- NULL # Een subjectief gegeven, dus niet relevant voor dit onderzoek

verbeteringenWithTotal <- rbind(verbeteringen, colSums(verbeteringen))
ftVerbeteringen <- verbeteringenWithTotal[20,]

verbeteringenOverview <- sort(ftVerbeteringen, decreasing = TRUE)

barplot(as.matrix(verbeteringenOverview), main = "Verbeteringen van toegankelijke app t.o.v. niet-toegankelijke app")
