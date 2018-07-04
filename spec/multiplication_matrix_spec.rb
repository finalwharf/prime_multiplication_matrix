require 'rspec'
require_relative '../lib/multiplication_matrix'

RSpec.describe MultiplicationMatrix, '#print' do
  it 'raises an error when not called with an enumerable' do
    expect { MultiplicationMatrix.print(123) }.to raise_error ArgumentError, 'Numbers must be an Enumerable'
  end

  it 'prints a 3 by 3 matrix' do
    matrix3x3 = <<~MATRIX
                         1         2         3
      ----------------------------------------
            1 |          1         2         3
            2 |          2         4         6
            3 |          3         6         9
    MATRIX

    expect { MultiplicationMatrix.print([1, 2, 3]) }.to output(matrix3x3).to_stdout
  end

  it 'prints a 5 by 5 matrix' do
    matrix5x5 = <<~MATRIX
                         2         3         5         7        11
      ------------------------------------------------------------
            2 |          4         6        10        14        22
            3 |          6         9        15        21        33
            5 |         10        15        25        35        55
            7 |         14        21        35        49        77
           11 |         22        33        55        77       121
    MATRIX

    expect { MultiplicationMatrix.print([2, 3, 5, 7, 11]) }.to output(matrix5x5).to_stdout
  end
end
