require 'rspec'
require_relative 'character_counter'

describe CharacterCounter do
  describe '#character_count' do
    it 'returns the correct character count for a given string' do
      input_string = 'Paralelepípedo'
      counter = CharacterCounter.new(input_string)

      result = counter.character_count

      expect(result).to eq({ 'a' => 2, 'b' => 2, 'ó' => 1, 'o' => 1, 'r' => 1 })
    end

    it 'returns an empty hash for an empty string' do
      input_string = ''
      counter = CharacterCounter.new(input_string)

      result = counter.character_count

      expect(result).to eq({})
    end

    it 'handles special characters and numbers correctly' do
      input_string = 'Paralelepípedo'
      counter = CharacterCounter.new(input_string)

      result = counter.character_count

      expect(result).to eq({"p"=>3, "a"=>2, "r"=>1, "l"=>2, "e"=>3, "í"=>1, "d"=>1, "o"=>1})
    end
  end
end

# Testes
rspec character_counter_spec.rb
