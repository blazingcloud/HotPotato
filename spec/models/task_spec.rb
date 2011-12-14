require 'spec_helper'

describe Task do
    it { should have_many(:activities) }

    it { should validate_presence_of(:person) }

    let(:my_person) do
      my_person = Person.create!(:name => 'Kermit the Frog')
    end
    let(:my_task) do
      my_task = Task.create!(:name => 'Thing 1',
                             :person => my_person)
    end

    it "should default to open" do
      my_task.should_not be_closed
    end

    it "can be marked as closed" do
      my_task.close
      my_task.should be_closed # closed? true
    end

    it "can't be closed twice" do
      lambda do 
        my_task.close
        my_task.close
      end.should change(ClosedActivity,:count).by(1)
    end

    it "has no closed activity if it is not closed" do
      my_task.closed.should be_nil
    end

    it "has a closed accessor which returns a ClosedActivity" do
      my_task.closed.should be_instance_of ClosedActivity
    end

    it "sets task owner to be the initiator of the close activity" do
      my_task.close
      my_task.closed.initiator_person.should == my_task.person
    end

end
