require 'rspec'
require './lib/photograph'

RSpec.describe Photograph do
  describe 'iteration 1' do
    before :each do
      attributes = {
                      id: "1",
                      name: "Rue Mouffetard, Paris (Boy with Bottles)",
                      artist_id: "4",
                      year: "1954"
                    }
      @photograph = Photograph.new(attributes)
    end

    it 'exists' do
      expect(@photograph).to be_a(Photograph)
    end

    it 'initializes with attributes' do
      expect(@photograph.id).to eq("1")
      expect(@photograph.name).to eq("Rue Mouffetard, Paris (Boy with Bottles)")
      expect(@photograph.artist_id).to eq("4")
      expect(@photograph.year).to eq("1954")
    end
  end
end
