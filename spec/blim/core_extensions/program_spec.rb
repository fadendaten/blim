require "spec_helper"

RSpec.describe Program do

  let(:program) { Program.new }

  let(:atelier_base) do
    allow(program).to receive(:name) { '1/14 NILE Atelier Base I' }
    program
  end


  describe 'short_name' do
    it 'should return only name of the program' do
      expect(atelier_base.short_name).to eql('Atelier Base I')
    end
  end

  describe 'path_name' do
    it 'should have a path_name' do
      expect(atelier_base.path_name).to eql('atelier base i')
    end
  end

end
