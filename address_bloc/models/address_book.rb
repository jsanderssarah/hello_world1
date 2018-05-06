#We need an address book model to store entries
#needs an attribute to hold the array of entries. The entries array will store entries. It also provides an easy way to add, remove, and count entries.
#we tell Ruby to load the library named entry.rb relative to  address_book.rb's file path using require_relative.
require_relative 'entry'
  class AddressBook
    attr_reader :entries

    def inititalize
      @entries = []
    end
#Having an array of entries is only useful if we can add items to that array. We need a method, add_entry, to update our entries array.
#creating add_entry. To keep entries nicely ordered we'll code add_entry to insert entries in lexicographical order.
  def add_entry(name, phone_number, email)
    #9
    index = 0
    entries.each do |entry|
      #10
      if name < entry.name
        break
      end
      index+= 1
    end
    #11
    entries.insert(index, Entry.new(name, phone_number, email))
  end

  def remove_entry(name, phone_number, email)
    entries.each do |entry|
      if name == entry.name && phone_number == entry.phone_number && email == entry.email
        entries.remove(entry)
      end
    end
  end

end
 #9, we create a variable to store the insertion
# index. At #10, we compare name with the name of the current  entry. If name lexicographically
# proceeds entry.name, we've found the index to insert at. Otherwise we increment index and
#continue comparing with the other entries. At #11, we insert a new entry into
# entries using the calculated `index.
