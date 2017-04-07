require "spec_helper"

RSpec.describe Blim do


  it "has a version number" do
    expect(Blim::VERSION).not_to be nil
  end

  context 'methods' do
    describe '#image_type' do
      it 'should return the image type as string' do
        expect(subject.image_type).to eql('jpg')
      end
    end

    describe '#style_base_url' do
      it 'should return the style image base url' do
        expect(subject.style_base_url).to eql('https://d1csr3q4rjsmej.cloudfront.net')
      end
    end

    describe '#colour_base_url' do
      it 'should return the colour image base url' do
        expect(subject.colour_base_url).to eql('https://d2t93hgs2uwaga.cloudfront.net')
      end
    end
  end
end
