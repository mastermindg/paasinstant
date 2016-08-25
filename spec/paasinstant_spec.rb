require 'spec_helper'

describe Paasinstant do
  it 'has a version number' do
    expect(Paasinstant::VERSION).not_to be nil
  end

  it 'loads a builder class' do
    expect(Paasinstant::Builder).to be_a(Class)
  end
end

# Build tests for Builder Class
module Paasinstant
	describe Builder do
		before do
			@buildit = Paasinstant::Builder.new('demo/test.json')
		end
	end
end