require "spec_helper"

RSpec.describe Blim::ImageType do
  let(:front) { Blim::ImageType.new('Front', '01') }

  it 'has a name' do
    expect(front.name).to eq('Front')
  end

  it 'has an identifier' do
    expect(front.identifier).to eq('01')
  end

end
