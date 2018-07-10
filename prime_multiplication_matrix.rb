#!/usr/bin/env ruby

require 'getoptlong'
require_relative "lib/prime_generator"
require_relative "lib/multiplication_matrix"

count = 10

options = GetoptLong.new(['--count', '-c', GetoptLong::OPTIONAL_ARGUMENT])

options.each do |option, argument|
  count = argument.to_i if option == '--count'
end

primes = PrimeGenerator.generate(count)
MultiplicationMatrix.print(primes)
