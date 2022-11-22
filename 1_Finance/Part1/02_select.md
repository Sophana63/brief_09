# Niveau facile

### Donner la liste des noms des jeunes trader et leurs classe actifs ; où jeune si moins de 5 ans d'expérience.
``` sql
SELECT name, classe_actif FROM trader 
WHERE anneeExperience < 5
```

## mf02 Donner la liste des différentes classes d’actifs de l’équipe 1
``` sql
SELECT classe_actif FROM trader
WHERE nomEquipe = 'equipe1'
```

## mf03 Donner toutes les informations sur les traders commodities
``` sql
SELECT * FROM trader
WHERE classe_actif = 'commodities'
```

## mf04 Donner la liste des classes d’actifs des traders de  plus de 20 ans d'expérience.
``` sql
SELECT classe_actif FROM trader
WHERE anneeExperience > 20
```

## mf05 Donner la liste des noms des traders ayant entre 5 et 10 ans d'expérience (bornes incluses). 
``` sql
SELECT classe_actif FROM trader
WHERE anneeExperience BETWEEN 5 AND 10
```

## mf06 Donner la liste des classes d’actifs commençant par « ch » (e.g. change...)
``` sql
SELECT classe_actif FROM trader
WHERE classe_actif LIKE 'ch%'
```

## mf07 Donner la liste des noms des équipes utilisant l’arbitrage statistique
``` sql
SELECT name FROM equipe
WHERE style = 'arbitrage statistique'
```

## mf08 Donner la liste des noms des équipes dont le chef est Smith.
``` sql
SELECT name FROM equipe
WHERE chef = 'Smith'
```

## mf09 Donner la liste des transactions  triés par ordre alphabétique.
``` sql
SELECT * FROM transaction
ORDER BY name ASC
```

## mf10 Donner la liste des transactions se déroulant le 20 Avril 2019  à Hong Kong 
``` sql
SELECT * FROM transaction
WHERE date = '2019-04-20'
```

## mf11 Donner la liste des marchés ( lieux)  où le prix est supérieur à 150 euros.
``` sql
SELECT lieu FROM transaction 
WHERE prix > 150
```

## mf12 Donner la liste des transactions se déroulant à Paris pour moins de 50 euros.
``` sql
SELECT * FROM transaction 
WHERE prix < 50
AND lieu ='PARIS'
```

## mf13 Donner la liste des marchés ( lieux)  ayant eu lieu en 2014.
``` sql
SELECT lieu FROM transaction 
WHERE YEAR(date) = '2014'
```

# Niveau moyen

## mmtj01 Donner la liste des noms et classes d’actifs des traders ayant plus de 3 ans d'expérience et faisant partie d'une équipe de style arbitrage statisque. On affichera par ordre alphabétique sur les noms
``` sql

```