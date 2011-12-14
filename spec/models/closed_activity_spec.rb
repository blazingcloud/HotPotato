require 'spec_helper'
describe ClosedActivity do

  it { should validate_presence_of(:initiator_person) }

end
