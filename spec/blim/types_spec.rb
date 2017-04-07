require "spec_helper"

RSpec.describe Blim::TYPES do

  it 'contains 6 types' do
    expect(Blim::TYPES.count).to eq(6)
  end

  it 'contains only elements of the type Blim::ImageType' do
    Blim::TYPES.each do |type|
      expect(type).to be_a(Blim::ImageType)
    end
  end

end
