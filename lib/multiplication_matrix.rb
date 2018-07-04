module MultiplicationMatrix
  def self.print(numbers = [])
    raise ArgumentError, 'Numbers must be an Enumerable' unless numbers.is_a?(Enumerable)

    header = numbers.map { |i| justify(i) }.join
    puts "#{' ' * 10}#{header}"

    puts '-' * (numbers.count + 1) * 10

    numbers.each do |i|
      row = numbers.map { |j| justify(i * j) }.join
      puts "#{justify(i, 7)} | #{row}"
    end
  end

  def self.justify(object, width = 10)
    object.to_s.rjust(width)
  end
end
