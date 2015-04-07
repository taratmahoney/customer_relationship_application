class Contact
  attr_accessor :id, :first_name, :last_name, :email, :note
  
  ## THIS IS WHAT ATTR_ACCESSOR DOES
  # def id=(new_value)  
  #   @id = new_value
  # end

  # def id
  #   @id
  # end

  # def first_name
  #   @first_name
  # end

  # def first_name=(value)
  #   @first_name = value
  # end

  def initialize (first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
  end

  def to_s
  	"First name: #{@first_name} Last name: #{@last_name} Email: #{@email} Notes: #{@note}"
  end
end
