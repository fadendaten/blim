require "spec_helper"

RSpec.describe Style do

  let(:style) { Style.new }

  describe 'path_name' do
    it 'should have a path_name' do
      allow(style).to receive(:number) { 'f1234' }
      expect(style.path_name).to eql('nile_F1234')
    end
  end

end
