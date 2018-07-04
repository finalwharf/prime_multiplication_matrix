require 'rspec'
require_relative '../lib/prime_generator'

RSpec.describe PrimeGenerator, '#generate' do
  context 'without parameters' do
    it 'returns one prime number' do
      expect(PrimeGenerator.generate).to eq [2]
    end
  end

  context 'with parameters' do
    it 'raises an error when called with less than 1' do
      expect { PrimeGenerator.generate(-1) }.to raise_error ArgumentError, 'Number of primes must be 1 or more'
    end

    it 'returns 1024 primes' do
      expect(PrimeGenerator.generate(1024).count).to eq 1024
    end

    it 'returns the correnct 3rd prime' do
      expect(PrimeGenerator.generate(3).last).to eq 5
    end

    it 'returns the correnct 256th prime' do
      expect(PrimeGenerator.generate(256).last).to eq 1619
    end

    it 'returns the correnct 512th prime' do
      expect(PrimeGenerator.generate(512).last).to eq 3671
    end

    it 'returns the correnct 4096rd prime' do
      expect(PrimeGenerator.generate(4096).last).to eq 38_873
    end

    it 'returns the correnct 1000000th prime' do
      skip 'Takes ~ 4.6 seconds. Comment to run the test'
      expect(PrimeGenerator.generate(1_000_000).last).to eq 15_485_863
    end
  end
end
