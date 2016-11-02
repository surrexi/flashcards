Card.destroy_all
User.destroy_all

# Filling a table User
user = User.create(email: 'test@gmail.com', password: 'pass')

# Filling a table Card with site (url)
url = 'http://alltop10.org/100-krasivyih-slov-na-angliyskom-s-proiznosheniem/'
Nokogiri::HTML(open(url)).css('table tbody tr').collect do |row|
  original_text = row.at('td[1]').text.strip
  translated_text = row.at('td[3]').text.strip
  Card.create(original_text: original_text, translated_text: translated_text, user: user)
end
