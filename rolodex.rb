require_relative 'contact'

class Rolodex

  def initialize #creates empty array for contacts to go in
    @contacts = []
    @next_contact_id = 1
  end

  def add_contact(contact)
    contact.id = @next_contact_id #=> contact.id=(@id)
    
    @contacts << contact

    @next_contact_id += 1
  end

  def find(contact_id) #We need to find inside our array an object whose ID is the same as the one the user is searching for
		@contacts.find do |contact|
			contact.id == contact_id
			to_s
		end
	end
end

# class Rolodex
#   def find_by_name(name)
#     @contacts.find { |c| c.first_name == name or c.last_name == name }
#   end
# end


# r = Rolodex.new
# r.add_contact(Contact.new("","","",""))
# p r.contacts
# r.add_contact(Contact.new("","","",""))


