require "spec_helper"

RSpec.describe Blim do


  it "has a version number" do
    expect(Blim::VERSION).not_to be nil
  end

  it "has a image type" do
    expect(Blim::IMAGE_TYPE).not_to be nil
  end

  it "has a style base url" do
    expect(Blim::STYLE_BASE_URL).not_to be nil
  end

  it "has a colour base url" do
    expect(Blim::COLOUR_BASE_URL).not_to be nil
  end

  it "has a prefix" do
    expect(Blim::PREFIX).not_to be nil
  end

  context 'methods' do
    describe '#collection_path' do
      it 'should return the path for a collection' do
        expect(Blim.collection_path('1/17', false)).to eql('1_17_nile')
      end
      it 'should return the path for a men colleciton' do
        expect(Blim.collection_path('1/17', true)).to eql('1_17_nile_men')
      end
    end

    describe '#program_path' do
      it 'should return the path for a program' do
        expect(Blim.program_path('Collection II Shirt ')).to eql('collection ii shirt')
      end
    end

    describe '#colour_path' do
      it 'should return the path for a colour' do
        expect(Blim.colour_path('Rose Blue')).to eql('rose blue')
      end
    end
  end
end
