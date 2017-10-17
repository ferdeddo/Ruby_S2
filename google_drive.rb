require " google_drive "

 # Crée une session.  Cela vous demandera les informations d'identification via la ligne de commande pour
 # première fois et enregistrez-le dans le fichier config.json pour les utilisations ultérieures.
 # Consultez ce document pour apprendre à créer config.json:
 # https://github.com/gimite/google-drive-ruby/blob/master/doc/authorization.md
 session = GoogleDrive :: Session .from_config ( " config.json " )

 # Obtient la liste des fichiers distants.
 session.files.each do | fichier |
   p fichier.title
 fin

 # Télécharge un fichier local.
 session.upload_from_file ( " /chemin/vers/hello.txt " , " bonjour.txt " , convert: false )

 # Téléchargements dans un fichier local.
 file = session.file_by_title ( " hello.txt " )
 file.download_to_file ( " /chemin/vers/hello.txt " )

 # Met à jour le contenu du fichier distant.
 file.update_from_file ( " /chemin/vers/hello.txt " ) 
