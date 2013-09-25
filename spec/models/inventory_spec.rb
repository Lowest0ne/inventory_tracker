require 'spec_helper'

describe Inventory do

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:quantity ) }

  it { should     have_valid(:quantity).when(1, 2, 4, 8, 128 ) }
  it { should_not have_valid(:quantity).when( -10, -1, 0 ) }

end
