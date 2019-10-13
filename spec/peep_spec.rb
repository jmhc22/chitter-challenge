require 'peep'

describe Peep do

  describe '.create' do
    it 'creating a peep will return the peep object and store data in database' do
      peep = Peep.create(text: "This is a test peep!")

      peeps = Peep.all

      expect(peeps.length).to eq 1
      expect(peeps.first.text).to eq "This is a test peep!"
      expect(peeps.first).to be_a Peep
    end
  end

  describe '.all' do
    it 'returns an array of all peeps' do
      peep = Peep.create(text: "This is a test peep!")
      peep = Peep.create(text: "This is also a test peep!")

      peeps = Peep.all

      expect(peeps.length).to eq 2
      expect(peeps.first.text).to eq "This is a test peep!"
      expect(peeps.first).to be_a Peep
    end
  end
end
