require 'spec_helper'

describe Task do
    it { should have_many(:activities) }
    it { should belong_to(:person) }
    it "I have a new task and it defaults to open" do
      my_task = Task.create!(:name => 'Thing 1')
      my_task.should_not be_closed
    end
    it "I can finish a task" do
      my_task = Task.create!(:name => 'Thing 1')
      my_task.close
      my_task.should be_closed # closed? true
    end

    it "can't be closed twice" do
      my_task = Task.create!(:name => 'Thing 1')
      lambda do 
        my_task.close
        my_task.close
      end.should change(ClosedActivity,:count).by(1)
    end
    it "remembers who closed the task" do
      my_task = Task.create!(:name => 'Thing 1',
                             :person => Person.create!)
      my_task.close
    end
end
