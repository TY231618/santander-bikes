require 'bike'

describe Bike do
#  it 'responds to is bike working?' do
#    expect(subject).to respond_to :working?
#  end
  it { is_expected.to respond_to :working? }
end
