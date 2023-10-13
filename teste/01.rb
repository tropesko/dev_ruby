class CharacterCounter
  def initialize(input_string)
    @input_string = input_string
  end

  def character_count
    # Create an empty hash to store character counts
    counts = Hash.new(0)

    # Use a regular expression to match only alphabetic characters
    @input_string.scan(/[a-zA-Záàâãéêíóôõúüç]/).each do |char|
      # Convert the character to lowercase and increment the count
      counts[char.downcase] += 1
    end

    counts
  end
end

# Testes
input_string = "Paralelepípedo"
counter = CharacterCounter.new(input_string)
result = counter.character_count
puts result
