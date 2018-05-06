#needs an attribute to hold the array of entries. The entries array will store entries. It also provides an easy way to add, remove, and count entries.
require_relative '../models/address_book'

RSpec.describe AddressBook do
  let(:book) { AddressBook.new }

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
#We've wrapped these tests in a separate describe to keep our specs organized. We've also included multiple expects in the second test, if any of them fail, then the entire  it test will fail.

    it "adds the correct information to entries" do
      book.add_entry('Ginny Weasley', '555.444.3333', 'gweasley@hogwarts.mag')
      new_entry = book.entries[0]

      expect(new_entry.name).to eq('Ginny Weasley')
      expect(new_entry.phone_number).to eq('555.444.3333')
      expect(new_entry.email).to eq('gweasley@hogwarts.mag')
    end
  end

  describe "#remove_entry" do
    it "removes only one entry from the address book" do
      book.remove_entry('Ginny Weasley', '555.444.3333', 'gweasley@hogwarts.mag')

      expect(book.entries.size).to eq(0)
    end
  end
end
