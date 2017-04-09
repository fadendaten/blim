require "spec_helper"

RSpec.describe Blim::Style do
  let(:type) { Blim::TYPES.first }

  context 'women' do
    let(:collection) { '1/17'}
    let(:style) { 'F14937' }
    let(:colour) { 'Stone' }

    let(:blim_style) do
      Blim::Style.new(style, colour, collection, type)
    end

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
        blim_style = Blim::Style.new(style, colour, collection, wrong_type)
        expect(blim_style.exists?).to eql(false)
      end
    end
  end

  context 'men' do
    let(:collection) { '1/17'}
    let(:style) { 'MF347' }
    let(:colour) { 'Marsala' }

    let(:blim_style) do
      Blim::Style.new(style, colour, collection, type, true)
    end

    describe "#image" do
      it 'return the aws path to the image' do
        expect(blim_style.image_path).to eql('https://d1csr3q4rjsmej.cloudfront.net/1_17_nile_men/nile_MF347_01_marsala.jpg')
      end
    end

    describe '#exists?', :vcr do
      it 'should return true if image exists' do
        expect(blim_style.exists?).to eql(true)
      end

      it 'should return false if image does not exists' do
        wrong_type = Blim::ImageType.new('Abcd', 'abcd')
        blim_style = Blim::Style.new(style, colour, collection, wrong_type)
        expect(blim_style.exists?).to eql(false)
      end
    end

  end
end
