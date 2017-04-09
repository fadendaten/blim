require "spec_helper"

RSpec.describe Blim::Colour do
  let(:collection) { '1/17'}
  let(:type) { Blim::TYPES.first }

  context "women" do
    let(:colour) { 'Rose Water' }
    let(:blue_colour) { 'Blue' }
    let(:program) { 'Collection II Shirt' }

    let(:blim_colour) { Blim::Colour.new(colour, program, collection) }

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
        blim_colour = Blim::Colour.new(blue_colour, program, collection)
        expect(blim_colour.exists?).to eql(false)
      end
    end
  end

  context "men" do
    let(:colour) { 'Marsala' }
    let(:blue_colour) { 'Blue' }
    let(:program) { 'MEN SHIRT FLAME' }

    let(:blim_colour) { Blim::Colour.new(colour, program, collection, true) }
    describe "#image" do
      it 'return the aws path to the image' do
        expect(blim_colour.image_path).to eql('https://d2t93hgs2uwaga.cloudfront.net/1_17_nile_men/men shirt flame/marsala.jpg')
      end
    end

    describe '#exists?', :vcr do
      it 'should return true if image exists' do
        expect(blim_colour.exists?).to eql(true)
      end

      it 'should return false if image does not exists' do
        blim_colour = Blim::Colour.new(blue_colour, program, collection)
        expect(blim_colour.exists?).to eql(false)
      end
    end

  end
end
