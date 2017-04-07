require "spec_helper"

RSpec.describe Blim::Colour do
  let!(:collection) { Collection.new }
  let!(:program) { Program.new }
  let!(:style) { Style.new }
  let!(:colour) { Colour.new }

  let(:women) do
    allow(collection).to receive(:season) { '1' }
    allow(collection).to receive(:year) { '2017' }
    allow(collection).to receive(:men?) { false }
    collection
  end

  let(:collection_ii_shirt) do
    allow(program).to receive(:name) { 'Collection II Shirt' }
    allow(program).to receive(:collection) { women }
    program
  end

  let(:rose_water) do
    allow(colour).to receive(:name) { 'Rose Water' }
    allow(colour).to receive(:parent) { collection_ii_shirt }
    colour
  end

  let(:blue) do
    allow(colour).to receive(:name) { 'Blue' }
    allow(colour).to receive(:parent) { collection_ii_shirt }
    colour
  end

  let(:blim_colour) { Blim::Colour.new(rose_water) }

  describe "#image" do
    it 'return the aws path to the image' do
      expect(blim_colour.image_path).to eql('https://d2t93hgs2uwaga.cloudfront.net/1_17_nile/collection ii shirt/rose water.jpg')
    end
  end

  describe '#exists?', :vcr do
    it 'should return true if image exists' do
      expect(blim_colour.exists?).to eql(true)
    end

    it 'should return false if image does not exists' do
      blim_colour = Blim::Colour.new(blue)
      expect(blim_colour.exists?).to eql(false)
    end
  end
end
