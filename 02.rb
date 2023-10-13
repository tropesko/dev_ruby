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
