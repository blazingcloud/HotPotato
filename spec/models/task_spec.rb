require 'spec_helper'

describe Task do

    it { should have_many(:activities) }

    it { should validate_presence_of(:person) }

    it "should default to open" do
      my_task = Task.create!(:name => 'Thing 1',
                             :person => Person.create!)
      my_task.should_not be_closed
    end

    it "can be marked as closed" do
      my_task = Task.create!(:name => 'Thing 1',
                             :person => Person.create!)
      my_task.close
      my_task.should be_closed # closed? true
    end

    it "can't be closed twice" do
      my_task = Task.create!(:name => 'Thing 1',
                             :person => Person.create!)
      lambda do 
        my_task.close
        my_task.close
      end.should change(ClosedActivity,:count).by(1)
    end

    it "should remember who closed the task" do
      my_person = Person.create!(:name => 'Kermit the Frog')
      my_task = Task.create!(:name => 'Thing 1',
                             :person => my_person)
      my_task.close
      my_task.closed.initiator_person.should be my_person
    end

end
