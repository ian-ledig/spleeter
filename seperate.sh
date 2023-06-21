#!/bin/bash

# Définition du répertoire d'entrée et de sortie
input_dir="input"
output_dir="output"

# Création du répertoire de sortie s'il n'existe pas
mkdir -p "$output_dir"

# Boucle sur tous les fichiers .wav du répertoire d'entrée
for wav_file in "$input_dir"/*.wav; do
  # Vérification si le fichier existe
  if [ -e "$wav_file" ]; then
    # Extraction du nom de fichier sans extension
    filename=$(basename -- "$wav_file")
    filename="${filename%.*}"

    # Exécution de la commande spleeter separate avec les options spécifiées
    spleeter separate -p spleeter:2stems -o "$output_dir" "$wav_file"
    
    echo "Fichier $filename.wav traité avec succès."
  fi
done