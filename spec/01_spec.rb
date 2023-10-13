require 'rspec'
require '../teste/1.rb'

describe CharacterCounter do
  describe '#character_count' do
    it 'returns the correct character count for a given string' do
      input_string = 'Paralelepípedo'
      counter = CharacterCounter.new(input_string)

      result = counter.character_count

      expect(result).to eq({"p"=>3, "a"=>2, "r"=>1, "l"=>2, "e"=>3, "í"=>1, "d"=>1, "o"=>1})
    end

    it 'returns an empty hash for an empty string' do
      input_string = ''
      counter = CharacterCounter.new(input_string)

      result = counter.character_count

      expect(result).to eq({})
    end

    it 'handles special characters and numbers correctly' do
      input_string = '123teste123'
      counter = CharacterCounter.new(input_string)

      result = counter.character_count

      expect(result).to eq({"t"=>2, "e"=>2, "s"=>1})
    end
  end
end
