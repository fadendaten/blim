require "spec_helper"

RSpec.describe Collection do

  let!(:collection) { Collection.new }
  let(:women) do
    allow(collection).to receive(:season) { '1' }
    allow(collection).to receive(:year) { '2018' }
    allow(collection).to receive(:men?) { false }
    collection
  end

  let(:men) do
    allow(women).to receive(:men?) { true }
    collection
  end

  describe 'path_name' do
    context 'women' do
      it 'should have a path_name' do
        expect(women.path_name).to eql('1_18_nile')
      end
    end

    context 'women' do
      it 'should have a path_name' do
        expect(men.path_name).to eql('1_18_nile_men')
      end
    end
  end
end
