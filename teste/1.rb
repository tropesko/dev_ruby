# 1. Escreva uma classe Ruby que é inicializada com uma string e contém um
# método que retorna um hash que mapeia os caracteres da string
# (convertidos para minúsculos) para a sua contagem de ocorrências na
# string.
# Por exemplo, com a string "Abóbora" seria retornado:
# { 'a' => 2, 'b' => 2, 'ó' => 1, 'o' => 1, 'r' => 1 }
# Deve-se fornecer também testes unitários para o código.

class CharacterCounter
  def initialize(input_string)
    @input_string = input_string
  end

  def character_count
    counts = Hash.new(0)

    @input_string.scan(/[a-zA-Záàâãéêíóôõúüç]/).each do |char|
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
