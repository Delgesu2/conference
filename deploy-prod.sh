#!user/bin/env bash

# Récuperer le code source
git pull origin master

#Récuperer les librairies
composer install --no-dev

# vide le cache
drush cr

# mettre à jour base donner
drush updb -y

# Exporte les config de prod
drush csex prod -y

git add config/prod
git commit -m "Ajout de confis de prod"
git push origin master

#Import le config
drush cim -y

# vide le cache
drush cr


