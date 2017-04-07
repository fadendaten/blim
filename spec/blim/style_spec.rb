require "spec_helper"

RSpec.describe Blim::Style do
  let!(:collection) { Collection.new }
  let!(:style) { Style.new }
  let!(:colour) { Colour.new }

  let(:women) do
    allow(collection).to receive(:season) { '1' }
    allow(collection).to receive(:year) { '2017' }
    allow(collection).to receive(:men?) { false }
    collection
  end

  let(:f14937) do
    allow(style).to receive(:collection) { women }
    allow(style).to receive(:number) { 'F14937' }
    style
  end

  let(:stone) do
    allow(colour).to receive(:name) { 'Stone' }
    colour
  end

  let(:type) { Blim::TYPES.first }

  let(:blim_style) { Blim::Style.new(f14937, stone, type) }

  describe "#image" do
    it 'return the aws path to the image' do
      expect(blim_style.image_path).to eql('https://d1csr3q4rjsmej.cloudfront.net/1_17_nile/nile_F14937_01_stone.jpg')
    end
  end

  describe '#exists?', :vcr do
    it 'should return true if image exists' do
      expect(blim_style.exists?).to eql(true)
    end

    it 'should return false if image does not exists' do
      wrong_type = Blim::ImageType.new('Abcd', 'abcd')
      blim_style = Blim::Style.new(f14937, stone, wrong_type)
      expect(blim_style.exists?).to eql(false)
    end
  end
end
