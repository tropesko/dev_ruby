# 2. Você deve implementar uma classe que interpreta um comando simples
# em Ruby. Os comandos possíveis são strings de operações aritméticas
# básicas e possuem os seguintes formatos:
# ADD N1, N2
# SUB N1, N2
# MUL N1, N2
# DIV N1, N2
# N1 e N2 são sempre números, não podem ser expressões. O separador
# decimal deve sempre ser o '.'.
#
# Ao executar um comando o resultado deve ser retornado. Por exemplo:
# > Command.new('ADD 12, 45').execute
# 57
#
# Se um comando for inválido, deve dar exceção. Forneça as classes
# utilizadas com os testes unitários.

class Calculator
  def initialize
    @result = nil
  end

  def interpret_command(command)
    operation, n1, n2 = command.split
    n1 = n1.to_f
    n2 = n2.to_f

    case operation
    when 'ADD'
      @result = n1 + n2
    when 'SUB'
      @result = n1 - n2
    when 'MUL'
      @result = n1 * n2
    when 'DIV'
      if n2 == 0
        return "Error: Division by zero"
      else
        @result = n1 / n2
      end
    else
      return "Error: invalid command"
    end

    @result
  end
end

class Command
  def initialize(command_str)
    @command_str = command_str
  end

  def execute
    calculator = Calculator.new
    result = calculator.interpret_command(@command_str)
    result
  end
end

# Teste
puts Command.new('TESTE 2 2').execute
puts Command.new('ADD 12 -45').execute
puts Command.new('SUB 12 -37.5').execute
puts Command.new('MUL 0 +346').execute
puts Command.new('DIV 2 0').execute
puts Command.new('DIV 234 -34.56').execute
