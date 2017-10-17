require 'gmail'
require 'google_drive'
require 'rubygems'
require "mail"

USERMAIL = "ferdeddo"
PASSWORD = "Adamou11"
def send_email_to_line
	mail_hash = Hash.new
session = GoogleDrive::Session.from_config("config.json")
# https://docs.google.com/spreadsheets/d/1GpHbDGyuAcdYHKFlnj9o-siXt8lUkm3QLHeo3MDUsG4/edit#gid=0
worksheet = session.spreadsheet_by_key("1GpHbDGyuAcdYHKFlnj9o-siXt8lUkm3QLHeo3MDUsG4").worksheets[0]
(1..worksheet.num_rows).each do |row|
	mail_hash[worksheet[row, 1]] = worksheet[row, 2]
end
puts mail_hash
gmail = Gmail.connect!(USERMAIL, PASSWORD)
mail_hash.each do |ville, mail|
	gmail.deliver do
		to mail
		subject "StartUp The Hacking project"
		html_part do
			body "<p>Bonjour,</p> \n <p>Je m'appelle Farid, je suis élève à une formation de code gratuite, ouverte à tous, sans restriction géographique, ni restriction de niveau. La formation s'appelle The Hacking Project (http://thehackingproject.org/). Nous apprenons l'informatique via la méthode du peer-learning : nous faisons des projets concrets qui nous sont assignés tous les jours, sur lesquel nous planchons en petites équipes autonomes. Le projet du jour est d'envoyer des emails à nos élus locaux pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation gratuite.

Nous vous contactons pour vous parler du projet, et vous dire que vous pouvez ouvrir une cellule à #{ville}, où vous pouvez former gratuitement 6 personnes (ou plus), qu'elles soient débutantes, ou confirmées. Le modèle d'éducation de The Hacking Project n'a pas de limite en terme de nombre de moussaillons (c'est comme cela que l'on appelle les élèves), donc nous serions ravis de travailler avec #{ville} !

Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : 06.95.46.60.80</p>"
		end
		
	end
end
	gmail.logout
end
send_email_to_line

