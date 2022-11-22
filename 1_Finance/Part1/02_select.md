# Niveau facile

### Donner la liste des noms des jeunes trader et leurs classe actifs ; où jeune si moins de 5 ans d'expérience.
``` sql
SELECT name, classe_actif FROM trader 
WHERE anneeExperience < 5
```

### mf02 Donner la liste des différentes classes d’actifs de l’équipe 1
``` sql
SELECT classe_actif FROM trader
WHERE nomEquipe = 'equipe1'
```

### mf03 Donner toutes les informations sur les traders commodities
``` sql
SELECT * FROM trader
WHERE classe_actif = 'commodities'
```

### mf04 Donner la liste des classes d’actifs des traders de  plus de 20 ans d'expérience.
``` sql
SELECT classe_actif FROM trader
WHERE anneeExperience > 20
```

### mf05 Donner la liste des noms des traders ayant entre 5 et 10 ans d'expérience (bornes incluses). 
``` sql
SELECT classe_actif FROM trader
WHERE anneeExperience BETWEEN 5 AND 10
```

### mf06 Donner la liste des classes d’actifs commençant par « ch » (e.g. change...)
``` sql
SELECT classe_actif FROM trader
WHERE classe_actif LIKE 'ch%'
```

### mf07 Donner la liste des noms des équipes utilisant l’arbitrage statistique
``` sql
SELECT name FROM equipe
WHERE style = 'arbitrage statistique'
```

### mf08 Donner la liste des noms des équipes dont le chef est Smith.
``` sql
SELECT name FROM equipe
WHERE chef = 'Smith'
```

### mf09 Donner la liste des transactions  triés par ordre alphabétique.
``` sql
SELECT * FROM transaction
ORDER BY name ASC
```

### mf10 Donner la liste des transactions se déroulant le 20 Avril 2019  à Hong Kong 
``` sql
SELECT * FROM transaction
WHERE date = '2019-04-20'
```

### mf11 Donner la liste des marchés ( lieux)  où le prix est supérieur à 150 euros.
``` sql
SELECT lieu FROM transaction 
WHERE prix > 150
```

### mf12 Donner la liste des transactions se déroulant à Paris pour moins de 50 euros.
``` sql
SELECT * FROM transaction 
WHERE prix < 50
AND lieu ='PARIS'
```

### mf13 Donner la liste des marchés ( lieux)  ayant eu lieu en 2014.
``` sql
SELECT lieu FROM transaction 
WHERE YEAR(date) = '2014'
```

# Niveau moyen

### mmtj01 Donner la liste des noms et classes d’actifs des traders ayant plus de 3 ans d'expérience et faisant partie d'une équipe de style arbitrage statisque. On affichera par ordre alphabétique sur les noms
``` sql
SELECT t.name, t.classe_actif FROM trader t
INNER JOIN equipe ON t.nomEquipe = equipe.name
WHERE anneeExperience > 3
AND equipe.style = 'arbitrage statistique'
ORDER BY t.name ASC
```

### mmtj02 Donner les différents marchés(lieux), triés par ordre alphabétique, des transactions effectuées dans  l'équipe du chef Smith avec un prix inférieur à 20.
``` sql
SELECT t.lieu FROM transaction t
INNER JOIN equipe e ON t.nomEquipe = e.name
WHERE e.chef = 'Smith' 
AND t.prix < 20
ORDER BY t.lieu ASC
```

### mmtj03 Donner le nombre de marchés sur lesquels intervenaient les traders  de style Market Making  en 2021.
``` sql
SELECT COUNT(t.lieu) as 'nb marché', t.lieu FROM transaction t
INNER JOIN equipe e ON t.nomEquipe = e.name
WHERE e.style = 'market making' 
AND YEAR(t.date) = '2021'
```

### mmtj04 Donner le prix moyen des actifs des traités par les traders market maker  par zone géographique de transaction
``` sql
SELECT AVG(t.prix), t.lieu as 'prix moyen' FROM transaction t
INNER JOIN equipe e ON t.nomEquipe = e.name
WHERE e.style = 'market making' 
GROUP BY t.lieu
```

### Donner la liste des classes d’actifs des traders qui ont effectué des transactions le 1ER Janvier 2016 sous le management de monsieur Smith
``` sql
SELECT tr.classe_actif, t.date, e.chef FROM trader tr
INNER JOIN transaction t ON t.nomEquipe = t.nomEquipe
INNER JOIN equipe e ON e.name = tr.nomEquipe
WHERE t.date = '2016-01-01' 
AND e.chef = 'Smith'
```

### Donner le nombre moyen d'années d'expérience des traders d’action par style  de stratégie d’équipe 
``` sql
SELECT AVG(tr.anneeExperience) as 'AVG année exp', e.style FROM trader tr
INNER JOIN equipe e ON e.name = tr.nomEquipe
WHERE tr.classe_actif = 'action' 
GROUP BY e.style
```

# Multi-tables, avec jointures

### mmts01 Donner la liste des noms et classes d’actifs des traders ayant plus de 3 ans d'expérience et faisant partie d'une équipe de style arbitrage statistique. On affichera par ordre alphabétique sur les noms.
``` sql
SELECT tr.name, tr.classe_actif FROM trader tr
WHERE tr.nomEquipe IN (
    SELECT e.name FROM equipe e
    WHERE e.style = 'arbitrage statistique'
    AND e.name = tr.nomEquipe
)
AND tr.anneeExperience > 3
ORDER BY tr.name

``` 

### mmtj02 Donner les différents marchés(lieux), triés par ordre alphabétique, des transactions effectuées dans  l'équipe du chef Smith avec un prix inférieur à 20
``` sql
SELECT t.lieu FROM transaction t
WHERE t.nomEquipe IN (
    SELECT e.name FROM equipe e
    WHERE e.chef = 'Smith'
    AND e.name = t.nomEquipe
)
AND t.prix < 20
ORDER BY t.lieu

```

### mmts03 Donner le nombre de marchés sur lesquels sont intervenus les traders de volatilite en 2015
``` sql
SELECT COUNT(t.lieu) as 'nb marché' FROM transaction t
WHERE t.nomEquipe IN (
    SELECT e.name FROM equipe e
    WHERE e.style = 'trading de volatilite'
    AND e.name = t.nomEquipe
)
AND YEAR(t.date) = 2015

```

### mmts04 Donner le prix moyen des actifs des traités par les traders market maker  par zone géographique de transaction
``` sql
SELECT AVG(t.prix) as 'Prix moyen', t.lieu FROM transaction t
WHERE t.nomEquipe IN (
    SELECT e.name FROM equipe e
    WHERE e.style = 'market making'
    AND e.name = t.nomEquipe
)
GROUP BY t.prix

```

### mmts05 Donner la liste des classes d’actifs des traders qui ont effectué des transactions le 1ER Janvier 2016 sous le management de monsieur Smith

``` sql
SELECT tr.classe_actif FROM trader tr
WHERE tr.nomEquipe IN (
    SELECT e.name FROM equipe e
    WHERE e.chef = 'Smith'
    AND e.name = tr.nomEquipe
)
AND tr.nomEquipe IN (
    SELECT t.nomEquipe FROM transaction t
    WHERE t.date = '2016-01-01'
    AND t.nomEquipe = tr.nomEquipe
)

```