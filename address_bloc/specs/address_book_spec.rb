#needs an attribute to hold the array of entries. The entries array will store entries. It also provides an easy way to add, remove, and count entries.
require_relative '../models/address_book'

RSpec.describe AddressBook do
  #create new instance of the AddressBook model and assign it to the variable named book using the let syntax provided by RSpec
  let(:book) { AddressBook.new }

  def check_entry(entry, expected_name, expected_number, expected_email)
    expect(entry.name).to eq expected_name
    expect(entry.phone_number).to eq expected_number
    expect(entry.email).to eq expected_email
  end

  describe "attributes" do
    #Create a test to confirm that AddressBook responds to entries:
    it "responds to entries" do
      book = AddressBook.new
      expect(book).to respond_to(:entries)
    end
    #AddressBook should initialize entries as an empty array so that it's ready to be used. Add a couple new tests to confirm this behavior:

    it "initializes entries as an array" do
      expect(book.entries).to be_an(Array)
    end

    it "initializes entries as empty" do
      expect(book.entries.size).to eq(0)
    end
  end

  #Having an array of entries is only useful if we can add items to that array. We need a method, add_entry, to update our entries array.
  describe "#add_entry" do
    it "adds only one entry to the address book" do
      book.add_entry('Ginny Weasley', '555.444.3333', 'gweasley@hogwarts.mag')

      expect(book.entries.size).to eq(1)
    end

    describe "#remove_entry" do
      it "removes only one entry from the address book" do
        book.remove_entry('Ginny Weasley', '555.444.3333', 'gweasley@hogwarts.mag')

        expect(book.entries.size).to eq(0)
      end
    end
#We've wrapped these tests in a separate describe to keep our specs organized. We've also included multiple expects in the second test, if any of them fail, then the entire  it test will fail.
describe "#import_from_csv" do
  it "imports the correct number of entries" do
    book.import_from_csv("entries.csv")
    book_size = book.entries.size
    expect(book_size).to eq 5
  end
end

describe "#import_from_csv" do
  it "imports the correct number of entries" do
    book.import_from_csv("entries_2.csv")
    book_size = book.entries.size
    expect(book_size).to eq 3
  end
end

    it "adds the correct information to entries" do
      book.add_entry('Ginny Weasley', '555.444.3333', 'gweasley@hogwarts.mag')
      new_entry = book.entries[0]

      expect(new_entry.name).to eq('Ginny Weasley')
      expect(new_entry.phone_number).to eq('555.444.3333')
      expect(new_entry.email).to eq('gweasley@hogwarts.mag')
    end
  end

    it "imports the 1st entry" do
      book.import_from_csv("entries_2.csv")
      entry_one = book.entries[0]
      check_entry(entry_one, "Emma Bentzen", "555-444-3333", "emma@cat.mow")
    end

    it "imports the 2nd entry" do
      book.import_from_csv("entries_2.csv")
      entry_two = book.entries[1]
      check_entry(entry_two, "Loki Bentzen", "555-444-2222", "loki@cat.mow")
    end

    it "imports the 3rd entry" do
      book.import_from_csv("entries_2.csv")
      entry_three = book.entries[2]
      check_entry(entry_three, "Sandy Bentzen", "555-444-1111", "sandy@dog.ruf")
    end

    it "imports the 1st entry" do
      book.import_from_csv("entries.csv")
      entry_one = book.entries[0]
      check_entry(entry_one, "Bill", "555-555-4854", "bill@blocmail.com")
    end

    it "imports the 2nd entry" do
       book.import_from_csv("entries.csv")
       # Check the second entry
       entry_two = book.entries[1]
       check_entry(entry_two, "Bob", "555-555-5415", "bob@blocmail.com")
     end

     it "imports the 3rd entry" do
       book.import_from_csv("entries.csv")
       # Check the third entry
       entry_three = book.entries[2]
       check_entry(entry_three, "Joe", "555-555-3660", "joe@blocmail.com")
     end

     it "imports the 4th entry" do
       book.import_from_csv("entries.csv")
       # Check the fourth entry
       entry_four = book.entries[3]
       check_entry(entry_four, "Sally", "555-555-4646", "sally@blocmail.com")
     end

     it "imports the 5th entry" do
       book.import_from_csv("entries.csv")
       # Check the fifth entry
       entry_five = book.entries[4]
       check_entry(entry_five, "Sussie", "555-555-2036", "sussie@blocmail.com")
     end
   end
