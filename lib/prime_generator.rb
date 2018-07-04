module PrimeGenerator
  def self.generate(number_of_primes = 1)
    raise ArgumentError, 'Number of primes must be 1 or more' if number_of_primes < 1

    primes = [2]

    return primes if number_of_primes == 1

    # Approximating our limit, according to the Rosser's theorem
    limit = (number_of_primes * (Math.log(number_of_primes) + Math.log(Math.log(number_of_primes)))).round

    # Prime number generation
    # Sieve of Sundaram - https://en.wikipedia.org/wiki/Sieve_of_Sundaram
    list_size = limit / 2 + 1

    # Initialize our list with all numbers marked as primes
    prime_candidates = Array.new(list_size, true)

    # Remove composite numbers
    (1..list_size).each do |i|
      max_j = (list_size - i) / (2 * i + 1)

      (i..max_j).each do |j|
        index = i + j + 2 * i * j
        index -= 1 # arrays are zero-indexed

        prime_candidates[index] = false
      end
    end

    # Every remaining number is a prime after doubling and incrementing by 1
    prime_candidates.each_with_index do |marked, index|
      next unless marked
      primes << (index + 1) * 2 + 1
    end

    primes.first(number_of_primes)
  end
end
