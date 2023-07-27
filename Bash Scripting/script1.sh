#!/bin/bash

# Ce script va créer automatiquement les fichiers nécessaires pour un module Terraform.

echo " salut et bienvenue dans mon script bash ; tu vas certainement aimer "  


echo '1 - voici un script bash réutilisable qui vous permettra de créer des modules  terraform automatiquement ( variables.tf, main.tf, ouputs.tf et Readme.md)'

# on demande l'utilisateur le nom du module

  read -p 'quel est le nom de votre dossier où seront crée les fichiers ? : ' moduleName 

 # on crée le répertoire du module

  mkdir $moduleName

 # et on se déplace dedans
 cd $moduleName


# On crée les fichiers variables.tf, main.tf, outputs.tf et Readme.md


 touch variables.tf
 touch main.tf
 touch ouputs.tf
 touch Readme.md

# On édite le fichier Readme.md et on y ajoute le titre

echo "# $moduleName" > Readme.md 

# On édite le fichier main.tf et on y ajoute le provider

echo 'provider "kubernetes" {' >> main.tf
		echo '	config_path    = "~/.kube/config"' >> main.tf
		echo '}' >>  main.tf

# On affiche un message de confirmation a l'utilisateur
echo 'Les fichiers ont été créés avec succès!'






 
