require_relative '../models/entry'
 # #1
 RSpec.describe Entry do
   # #2
   describe "attributes" do
     #Instead of creating an entry local variable within each test, let's define an entry method once
     let(:entry) { Entry.new('Ginny Weasley', '555.444.3333', 'gweasley@hogwarts.mag') }
     # #3
     #An entry without initialized attributes isn't useful. Modify the tests so they assume entries will always be created with values for the name, phone_number, and email attributes
     it "responds to name" do
       #entry = Entry.new('Ginny Weasley', '555.444.3333', 'gweasley@hogwarts.mag')
       # #4
       expect(entry).to respond_to(:name)
     end
     #The core idea is to be able to read an attribute's value. Let's add three tests:
     it "reports its name" do
       #entry = Entry.new('Ginny Weasley', '555.444.3333', 'gweasley@hogwarts.mag')
       expect(entry.name).to eq('Ginny Weasley')
     end


     it "responds to phone number" do
       #entry = Entry.new('Ginny Weasley', '555.444.3333', 'gweasley@hogwarts.mag')
       expect(entry).to respond_to(:phone_number)
     end
     it "reports its phone _number" do
       #entry = Entry.new('Ginny Weasley', '555.444.3333', 'gweasley@hogwarts.mag')
       expect(entry.phone_number).to eq('555.444.3333')
     end

     it "responds to email" do
       #entry = Entry.new('Ginny Weasley', '555.444.3333', 'gweasley@hogwarts.mag')
       expect(entry).to respond_to(:email)
     end
     it "reports its email" do
       #entry = Entry.new('Ginny Weasley', '555.444.3333', 'gweasley@hogwarts.mag')
       expect(entry.email).to eq('gweasley@hogwarts.mag')
     end
   end
   #To build the menu we'll need a method to return a string representation of an Entry, to be displayed in the terminal. It's standard convention to name such a method  to_s, short for "(convert) to string".
   #5
   describe "#to_s" do
     it "prints an entry as a string" do
       entry = Entry.new('Ginny Weasley', '555.444.3333', 'gweasley@hogwarts.mag')
       expected_entry = "Name: Ginny Weasley\nPhone Number: 555.444.3333\nEmail: gweasley@hogwarts.mag"
       #6
       expect(entry.to_s).to eq(expected_entry)
     end
      #5, we use a new describe block to separate the to_s test from the initializer tests. The # in front of to_s indicates that it is an instance method.

      #6, we use eq to check that to_s returns a string equal to expected_string
   end
 end

 ###1 is the standard first line of an RSpec test file. We are saying that the file is a spec file and that it tests Entry.

 #2, we use describe to give our test structure. In this case, we're using it to communicate that the specs test the Entry attributes.

#3, we separate our individual tests using the it method. Each it represents a unique test.

#4 each RSpec test ends with one or more expect method, which we use to declare the expectations for the test. If those expectations are met, our test passes, if they are not, it fails.
