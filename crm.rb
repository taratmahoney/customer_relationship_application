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
    while true
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
    end
  end

  def modify_contact
  end

  def delete_contact
  end

  def display_contact
    while true
      print "Enter ID of user you would like to view"
      contact_id = gets.chomp.to_i
      contact = @rolodex.find(contact_id)
    end
  end

  def	display_by_attribute
  end

  def exit
  end
end

CRM.run
