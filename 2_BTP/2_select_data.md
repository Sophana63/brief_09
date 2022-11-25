# Partie 2 : Requêtes SQL

### 1 - toutes les informations sur les clients. 
``` sql
SELECT * FROM client
```

### 2 - toutes les informations « utiles à l’utilisateur » sur les clients, i.e. sans l’identifiant (servant à lier les relations)
``` sql
SELECT nom, anneeNaiss, ville FROM client
```

### 3 - le nom des clients dont l’âge est supérieur à 50
``` sql
SELECT nom FROM client
WHERE (YEAR(CURDATE()) - anneeNaiss) > 50
```

### 4 - la liste des produits (leur label), sans doublon !
``` sql
SELECT label FROM produit
GROUP BY label 
```

### 5 - idem, mais cette fois la liste est triée par ordre alphabétique décroissant
``` sql
SELECT label FROM produit
GROUP BY label 
ORDER BY label DESC
```

### 6 - Les commandes avec une quantité entre 8 et 18 inclus.
``` sql
SELECT * FROM commande
WHERE quantite > 8 
AND quantite < 18
```
``` sql
SELECT * FROM commande
WHERE quantite BETWEEn 8 AND 18
```

### 7 - le nom et la ville des clients dont le nom commence par ’P’.
``` sql
SELECT nom, ville FROM client
WHERE nom LIKE 'P%' 
```

### 8 - le nom des fournisseurs situés à PARIS.
``` sql
SELECT nom FROM fournisseur
WHERE ville LIKE '%Paris%' 
```

### 9 - l’identifiant Fournisseur et le prix associés des "briques" et des "parpaing".
``` sql
SELECT id, p.prix FROM fournisseur f
LEFT JOIN produit p ON p.idF = f.id
WHERE p.label = 'briques' OR p.label = 'parpaing' 
```