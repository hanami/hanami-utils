require 'test_helper'
require 'lotus/utils/string'

describe Lotus::Utils::String do
  describe '#classify' do
    it 'returns an instance of Lotus::Utils::String' do
      Lotus::Utils::String.new('lotus').classify.must_be_kind_of(Lotus::Utils::String)
    end

    it 'returns a classified string' do
      Lotus::Utils::String.new('lotus').classify.must_equal('Lotus')
      Lotus::Utils::String.new('lotus_router').classify.must_equal('LotusRouter')
    end

    it 'returns a classified string from symbol' do
      Lotus::Utils::String.new(:lotus).classify.must_equal('Lotus')
      Lotus::Utils::String.new(:lotus_router).classify.must_equal('LotusRouter')
    end
  end

  describe '#underscore' do
    it 'returns an instance of Lotus::Utils::String' do
      Lotus::Utils::String.new('Lotus').underscore.must_be_kind_of(Lotus::Utils::String)
    end

    it 'keep self untouched' do
      string = Lotus::Utils::String.new('Lotus')
      string.underscore
      string.must_equal 'Lotus'
    end

    it 'removes all the upcase characters' do
      string = Lotus::Utils::String.new('Lotus')
      string.underscore.must_equal 'lotus'
    end

    it 'transforms camel case class names' do
      string = Lotus::Utils::String.new('LotusView')
      string.underscore.must_equal 'lotus_view'
    end

    it 'substitutes double colons with path separators' do
      string = Lotus::Utils::String.new('Lotus::Utils::String')
      string.underscore.must_equal 'lotus/utils/string'
    end

    it 'handles acronyms' do
      string = Lotus::Utils::String.new('APIDoc')
      string.underscore.must_equal 'api_doc'
    end

    it 'handles numbers' do
      string = Lotus::Utils::String.new('Lucky23Action')
      string.underscore.must_equal 'lucky23_action'
    end
  end

  describe '#demodulize' do
    it 'returns an instance of Lotus::Utils::String' do
      Lotus::Utils::String.new('Lotus').demodulize.must_be_kind_of(Lotus::Utils::String)
    end

    it 'returns the class name without the namespace' do
      Lotus::Utils::String.new('String').demodulize.must_equal('String')
      Lotus::Utils::String.new('Lotus::Utils::String').demodulize.must_equal('String')
    end
  end

  describe '#namespace' do
    it 'returns an instance of Lotus::Utils::String' do
      Lotus::Utils::String.new('Lotus').namespace.must_be_kind_of(Lotus::Utils::String)
    end

    it 'returns the top level module name' do
      Lotus::Utils::String.new('String').namespace.must_equal('String')
      Lotus::Utils::String.new('Lotus::Utils::String').namespace.must_equal('Lotus')
    end
  end

  describe '#tokenize' do
    before do
      @logger = []
    end

    it 'returns an instance of Lotus::Utils::String' do
      string = Lotus::Utils::String.new('Lotus::(Utils|App)')
      string.tokenize do |token|
        @logger.push token
      end

      @logger.each do |token|
        token.must_be_kind_of(Lotus::Utils::String)
      end
    end

    it 'calls the given block for each token occurrence' do
      string = Lotus::Utils::String.new('Lotus::(Utils|App)')
      string.tokenize do |token|
        @logger.push token
      end

      @logger.must_equal(['Lotus::Utils', 'Lotus::App'])
    end

    it "guarantees the block to be called even when the token conditions aren't met" do
      string = Lotus::Utils::String.new('Lotus')
      string.tokenize do |token|
        @logger.push token
      end

      @logger.must_equal(['Lotus'])
    end

    it 'returns nil' do
      result = Lotus::Utils::String.new('Lotus::(Utils|App)').tokenize { }
      result.must_be_nil
    end
  end

  describe 'string interface' do
    it 'responds to ::String methods and returns a new Lotus::Utils::String' do
      string = Lotus::Utils::String.new("Lotus\n").chomp
      string.must_equal      'Lotus'
      string.must_be_kind_of Lotus::Utils::String
    end

    it 'responds to ::String methods and only returns a new Lotus::Utils::String when the return value is a string' do
      string = Lotus::Utils::String.new('abcdef')
      string.casecmp('abcde').must_equal 1
    end

    it 'responds to whatever ::String responds to' do
      string = Lotus::Utils::String.new('abcdef')

      string.must_respond_to :reverse
      string.wont_respond_to :unknown_method
    end

    describe 'equality' do
      it 'has a working equality' do
        string = Lotus::Utils::String.new('lotus')
        other  = Lotus::Utils::String.new('lotus')

        assert string == other
      end

      it 'has a working equality with raw strings' do
        string = Lotus::Utils::String.new('lotus')
        assert string == 'lotus'
      end
    end

    describe 'case equality' do
      it 'has a working case equality' do
        string = Lotus::Utils::String.new('lotus')
        other  = Lotus::Utils::String.new('lotus')
        assert string === other
      end

      it 'has a working case equality with raw strings' do
        string = Lotus::Utils::String.new('lotus')
        assert string === 'lotus'
      end
    end

    describe 'value equality' do
      it 'has a working value equality' do
        string = Lotus::Utils::String.new('lotus')
        other  = Lotus::Utils::String.new('lotus')
        assert string.eql?(other)
      end

      it 'has a working value equality with raw strings' do
        string = Lotus::Utils::String.new('lotus')
        assert string.eql?('lotus')
      end
    end

    describe 'identity equality' do
      it 'has a working identity equality' do
        string = Lotus::Utils::String.new('lotus')
        assert string.equal?(string)
      end

      it 'has a working identity equality with raw strings' do
        string = Lotus::Utils::String.new('lotus')
        assert !string.equal?('lotus')
      end
    end

    describe '#hash' do
      it 'returns the same hash result of ::String' do
        expected = 'hello'.hash
        actual   = Lotus::Utils::String.new('hello').hash

        actual.must_equal expected
      end
    end
  end

  describe '#singularize' do
    it 'returns an instance of Lotus::Utils::String' do
      Lotus::Utils::String.new('lotus').singularize.must_be_kind_of(Lotus::Utils::String)
    end

    it 'returns a singularized string' do
      Lotus::Utils::String.new('lotuses').singularize.must_equal('lotus')
    end

    it 'returns a singularized string from symbol' do
      Lotus::Utils::String.new(:lotuses).singularize.must_equal('lotus')
    end
  end

  describe 'unknown method' do
    it 'raises error' do
      begin
        Lotus::Utils::String.new('one').yay!
      rescue NoMethodError => e
        e.message.must_equal %(undefined method `yay!' for "one":Lotus::Utils::String)
      end
    end
  end
end
