require "gmail"

USERMAIL = ""
PASSWORD = ""


gmail = Gmail.connect!(USERMAIL, PASSWORD)
gmail.deliver do
  to "trallmighty@outlook.fr"
  subject "test gem gmail"
  text_part do
    body "wesh moi du future ? je t'envois ce mail à travers l'espace et le temps, afin de te prévenir ... (blablablabla)."
  end
 
add_file "/home/ferdeddo/Bureau/Frieza/Ruby_S2/PV_Mardi/TestGmail/yonko.jpg"
  
end
gmail.logout