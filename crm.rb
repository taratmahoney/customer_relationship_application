require_relative 'contact'
# Bad practice to have many classes in one file. Use load to reference your files, or require "./contact" OR load "contact.rb"
require_relative 'rolodex'

class CRM

  def self.run #class methods go at the top of the class. A class method will always have self at the front
    my_crm = CRM.new #methods we call on a class are class methods!
    my_crm.main_menu
  end

  def initialize
    @rolodex = Rolodex.new
  end

  def print_main_menu #Numbering these makes it better UX
  	puts "[1] Add a new contact"
  	puts "[2] Modify an existing contact"
  	puts "[3] Delete a contact"
  	puts "[4] Display all contacts"
  	puts "[5] Display an attribute"
  	puts "[6] Exit"
  	puts "Enter a selection"
  end	

  def call_selection(selection)
    #this is an inline if statement
    add_new_contact if selection == 1
    modify_contact if selection == 2
    delete_contact if selection == 3
    display_contact if selection == 4
    display_by_attribute if selection == 5
    exit if selection == 6
  end 

  def main_menu
    print_main_menu
    selection = gets.chomp.to_i #better to split these into two lines - it's cleaner
    call_selection(selection) #this
  end


  def add_new_contact #instance methods
      print "First name "
      first_name = gets.chomp
      print "Last name "
      last_name = gets.chomp
      print "E-mail"
      email = gets.chomp
      print "Note:"
      note = gets.chomp
      contact = Contact.new(first_name, last_name, email, note)
      @rolodex.add_contact(contact)
      puts "Contact added!"
      main_menu
  end

  def modify_contact
    puts "Enter the ID of the contact you would like to modify"
    contact_id = gets.chomp.to_i
    contact = @rolodex.find(contact_id)
    puts "Did you enter #{contact_id}? Type 'yes' to confirm. Type 'no' to re-type."
    user_input = gets.chomp
    
    if user_input == "yes"
        yes_modify(contact)
    end
    
    if user_input == "no"
       main_menu
    end
  end

  def yes_modify(contact)
        puts "[1] First name"
        puts "[2] Last name"
        puts "[3] Email"
        puts "[4] Notes"
        puts "Enter the number of the information you would like to modify"
        
        mod_selection_num = gets.chomp.to_i

        puts "What's the new value?"

        new_value = gets.chomp

        contact.first_name = new_value if mod_selection_num == 1 
        contact.last_name = new_value if mod_selection_num == 2
        contact.email = new_value if mod_selection_num == 3
        contact.note = new_value if mod_selection_num == 4

        puts contact.to_s
        main_menu

  end

  def delete_contact
  end

  def display_contact
    
      print "Enter ID of user you would like to view"
      contact_id = gets.chomp.to_i
      contact = @rolodex.find(contact_id)
    
  end



  def	display_by_attribute
  end

  def exit
  end
end

CRM.run
