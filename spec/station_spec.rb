require 'station'

describe Station do

  it 'It checks for station name' do
    expect(subject.name).to eq("Barbican")
  end

  it "It checks for the station zone" do
    expect(subject.zone).to eq(1)
  end
end
