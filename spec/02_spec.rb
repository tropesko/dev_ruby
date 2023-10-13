require '../teste/2.rb'

describe Calculator do
  describe '#interpret_command' do
    it 'executes add' do
      calculator = Calculator.new
      result = calculator.interpret_command('ADD 12 45')
      expect(result).to eq(57.0)
    end

    it 'executes subtraction' do
      calculator = Calculator.new
      result = calculator.interpret_command('SUB 12 -37.5')
      expect(result).to eq(49.5)
    end

    it 'executes multiplication' do
      calculator = Calculator.new
      result = calculator.interpret_command('MUL 0 +346')
      expect(result).to eq(0.0)
    end

    it 'executes division' do
      calculator = Calculator.new
      result = calculator.interpret_command('DIV 234 -34.56')
      expect(result).to eq(-6.770833333333333)
    end

    it 'divides by zero' do
      calculator = Calculator.new
      result = calculator.interpret_command('DIV 2 0')
      expect(result).to eq('Error: Division by zero')
    end

    it 'invalid commands' do
      calculator = Calculator.new
      result = calculator.interpret_command('TESTE 2 2')
      expect(result).to eq('Error: invalid command')
    end
  end
end

describe Command do
  describe '#execute' do
    it 'executes command and returns result' do
      command = Command.new('ADD 12 45')
      result = command.execute
      expect(result).to eq(57.0)
    end
  end
end
