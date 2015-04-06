class Rolodex
  def initialize #creates empty array for contacts to go in
    @contacts = []
    @id = 1000
  end

  def add_contact(contact)
    contact.id = @id
    @contacts << contact
    @id += 1
  end

  def find(contact_id) #We need to find inside our array an object whose ID is the same as the one the user is searching for
  		@contacts.find do |contact|
  			contact.id == contact_id
  			to_s
  		end
  	end
end