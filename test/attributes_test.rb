require 'test_helper'
require 'bigdecimal'
require 'lotus/utils/attributes'

describe Lotus::Utils::Attributes do
  describe '#initialize' do
    before do
      class AttributesSet
        def to_h
          {a: 1}
        end
      end
    end

    after do
      Object.__send__(:remove_const, :AttributesSet)
    end

    it 'accepts an object that implements #to_h' do
      attributes = Lotus::Utils::Attributes.new(AttributesSet.new)
      attributes.to_h.must_equal({'a' => 1})
    end

    it "ignores hash default" do
      attributes = Lotus::Utils::Attributes.new{|h,k| h[k] = [] }
      attributes.get('uknown').must_be_nil
    end

    it 'recursively stringifies keys' do
      attributes = Lotus::Utils::Attributes.new({a: 1, b: { 2 => [3, 4] }})
      attributes.to_h.must_equal({'a'=>1, 'b'=>Lotus::Utils::Attributes.new({'2'=>[3,4]})})
    end

    it 'stores nested hashes as Attributes' do
      attributes = Lotus::Utils::Attributes.new({a: 1, b: { 2 => [3, 4] }})
      attributes.get(:b).class.must_equal Lotus::Utils::Attributes
    end
  end

  describe '#get' do
    it 'returns value associated to the given key (string)' do
      attributes = Lotus::Utils::Attributes.new('foo' => 'bar')
      attributes.get('foo').must_equal 'bar'
      attributes.get(:foo).must_equal  'bar'
    end

    it 'returns value associated to the given key (symbol)' do
      attributes = Lotus::Utils::Attributes.new(foo: 'bar')
      attributes.get(:foo).must_equal  'bar'
      attributes.get('foo').must_equal 'bar'
    end

    it 'returns value associated to the given key (number)' do
      attributes = Lotus::Utils::Attributes.new( 23 => 'foo')
      attributes.get(23).must_equal   'foo'
      attributes.get('23').must_equal 'foo'
    end

    it 'correctly handles Ruby falsey' do
      attributes = Lotus::Utils::Attributes.new('foo' => false)
      attributes.get(:foo).must_equal  false
      attributes.get('foo').must_equal false

      attributes = Lotus::Utils::Attributes.new(foo: false)
      attributes.get(:foo).must_equal false
    end

    it 'ignores hash default' do
      attributes = Lotus::Utils::Attributes.new{|h,k| h[k] = [] }
      attributes.get('foo').must_be_nil
      attributes.get(:foo).must_be_nil
    end

    it 'overrides clashing keys' do
      attributes = Lotus::Utils::Attributes.new('foo' => 'bar', foo: 'baz')
      attributes.get('foo').must_equal 'baz'
      attributes.get(:foo).must_equal  'baz'
    end
  end

  describe '#[]' do
    it 'returns value associated to the given key (string)' do
      attributes = Lotus::Utils::Attributes.new('foo' => 'bar')
      attributes['foo'].must_equal 'bar'
      attributes[:foo].must_equal  'bar'
    end

    it 'returns value associated to the given key (symbol)' do
      attributes = Lotus::Utils::Attributes.new(foo: 'bar')
      attributes[:foo].must_equal  'bar'
      attributes['foo'].must_equal 'bar'
    end

    it 'returns value associated to the given key (number)' do
      attributes = Lotus::Utils::Attributes.new( 23 => 'foo')
      attributes[23].must_equal   'foo'
      attributes['23'].must_equal 'foo'
    end

    it 'correctly handles Ruby falsey' do
      attributes = Lotus::Utils::Attributes.new('foo' => false)
      attributes[:foo].must_equal  false
      attributes['foo'].must_equal false

      attributes = Lotus::Utils::Attributes.new(foo: false)
      attributes[:foo].must_equal false
    end

    it 'ignores hash default' do
      attributes = Lotus::Utils::Attributes.new{|h,k| h[k] = [] }
      attributes['foo'].must_be_nil
      attributes[:foo].must_be_nil
    end

    it 'overrides clashing keys' do
      attributes = Lotus::Utils::Attributes.new('foo' => 'bar', foo: 'baz')
      attributes['foo'].must_equal 'baz'
      attributes[:foo].must_equal  'baz'
    end
  end

  describe '#set' do
    it 'is a void operation' do
      Lotus::Utils::Attributes.new.set('foo', 11).must_be_nil
    end

    it 'sets a value (string)' do
      attributes = Lotus::Utils::Attributes.new
      attributes.set('foo', 'bar')

      attributes.get('foo').must_equal 'bar'
      attributes.get(:foo).must_equal  'bar'
    end

    it 'sets a value (symbol)' do
      attributes = Lotus::Utils::Attributes.new
      attributes.set(:foo, 'bar')

      attributes.get('foo').must_equal 'bar'
      attributes.get(:foo).must_equal  'bar'
    end

    it 'sets a value (number)' do
      attributes = Lotus::Utils::Attributes.new
      attributes.set(23, 'bar')

      attributes.get(23).must_equal   'bar'
      attributes.get('23').must_equal 'bar'
    end
  end

  describe '#to_h' do
    it 'returns a ::Hash' do
      attributes = Lotus::Utils::Attributes.new(foo: 'bar')
      attributes.to_h.must_equal({'foo' => 'bar'})
    end

    it 'prevents information escape' do
      actual = Lotus::Utils::Attributes.new({'a' => 1})
      hash   = actual.to_h
      hash.merge!('b' => 2)

      actual.get('b').must_be_nil
    end
  end
end
