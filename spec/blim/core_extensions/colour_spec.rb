require "spec_helper"

RSpec.describe Colour do

  let!(:colour) { Colour.new }
  let(:dark_white) do
    allow(colour).to receive(:name) { 'Dark White' }
    colour
  end

  describe 'path_name' do
    it 'should return a path_name' do
     expect(dark_white.path_name).to eql('dark white')
    end
  end

end
