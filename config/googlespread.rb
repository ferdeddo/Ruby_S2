require 'google_drive'
require 'rubygems'
require 'nokogiri'
require 'open-uri'

session = GoogleDrive::Session.from_config("config.json")


$worksheet = session.spreadsheet_by_key("1X0kGrUno0WbuwoqKA9dHkyn8lbcdjYt5GrD_x_ax43U").worksheets[0]

def set_worksheet
	$worksheet[1, 1] = "Ville"
	$worksheet[1, 2] = "Adresse email"
	$worksheet.save
end

set_worksheet


def get_the_email_of_a_townhal_from_its_webpage(url)
	page = Nokogiri::HTML(open(url))
	email = page.css("table tr td table tr td table tr td table tr td.style27 p.Style22")[5]  
    email.text
end



def get_all_the_urls_of_val_doise_townhalls(url)
	list_mail = Hash.new()
	page = Nokogiri::HTML(open(url))
	page.css(".lientxt").each do |town|
		town_name = town.text.downcase
		proper_town_name = town_name.upcase
		town_name = town_name.split(' ').join('-')
		url = "http://annuaire-des-mairies.com/95/#{town_name}.html"
		list_mail[proper_town_name.to_sym] = get_the_email_of_a_townhal_from_its_webpage(url)
	end
	counter = 2
	list_mail.each do |key, value|
		$worksheet[counter, 1] = key
		$worksheet[counter, 2] = value
		counter += 1
		$worksheet.save
	end
end
get_all_the_urls_of_val_doise_townhalls("http://annuaire-des-mairies.com/val-d-oise.html")