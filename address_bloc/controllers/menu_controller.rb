##With models to store and retrieve data, we have the foundation we need to make
#Address Bloc an interactive experience. We will give users a command-line menu
#that allows them to view entries, create entries, search for a specific entry,
#import entries from a file, and exit the program. To do this, we'll create
#a MenuController to process user selections, update the models, and present
#information to the user

#MenuController will need to connect to AddressBook. It will also need methods to display the main menu and process user input:
require_relative '../models/address_book'

class MenuController
  attr_reader :address_book

  def initialize
    @address_book = AddressBook.new
  end

  def main_menu
    #2
    puts "Main Menu - #{address_book.entries.count} entries"
    puts "1 - View all entries"
    puts "2 - Create an entry"
    puts "3 - Search for an entry"
    puts "4 - Import entries from a CSV"
    puts "5 - Exit"
    print "Enter your selection: "
    #3  gets reads the next line from standard input. Standard input is stream data (often text) going into a program.
    selection = gets.to_i # to_i is to integer
    case selection
      when 1
        system "clear"
        view_all_entries
        main_menu
      when 2
        system "clear"
        create_entry
        main_menu
      when 3
        system "clear"
        search_entries
        main_menu
      when 4
        system "clear"
        read_csv
        main_menu
      when 5
        puts "Good-bye!"
        #terminate the program using exit(0). 0 signals the program is exiting without an error
        exit(0)
      else
        system "clear"
        puts "Sorry, that is not a valid input"
      end
    end

    def view_all_entries
     address_book.entries.each do |entry|
       system "clear"
       entry_submenu(entry)
     end

     system "clear"
     puts "End of entries"
   end

# chomp - If $/ has not been changed from the default Ruby record separator, then chomp also removes carriage return characters (that is it will remove \n , \r , and \r\n ). If $/ is an empty string, it will remove all trailing newlines from the string. "hello".chomp #=> "hello" "hello\n".chomp #=> "hello"
    def create_entry
      system "clear"
      puts "New AddressBloc Entry"
      print "Name: "
      name = gets.chomp
      print "Phone number: "
      phone = gets.chomp
      print "Email: "
      email = gets.chomp

      address_book.add_entry(name, phone, email)

      system "clear"
      puts "New entry created"
    end

    def search_entries
    end

    def read_csv

    def entry_submenu(entry)
     # #16
     puts "n - next entry"
     puts "d - delete entry"
     puts "e - edit this entry"
     puts "m - return to main menu"

     selection = gets.chomp

     case selection
       when "n"
       when "d"
       when "e"
       when "m"
         system "clear"
         main_menu
       else
         system "clear"
         puts "#{selection} is not a valid input"
         entry_submenu(entry)
     end
   end
  end
end
