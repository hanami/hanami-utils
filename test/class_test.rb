require 'test_helper'
require 'lotus/utils/class'

describe Lotus::Utils::Class do
  describe '.load!' do
    before do
      module App
        module Layer
          class Step
          end
        end

        module Service
          class Point
          end
        end

        class ServicePoint
        end
      end
    end

    it 'loads the class from the given static string' do
      Lotus::Utils::Class.load!('App::Layer::Step').must_equal(App::Layer::Step)
    end

    it 'raises error for missing constant' do
      -> { Lotus::Utils::Class.load!('MissingConstant') }.must_raise(NameError)
    end

    it 'loads the class from given string, by interpolating tokens' do
      Lotus::Utils::Class.load!('App::Service(::Point|Point)').must_equal(App::Service::Point)
    end

    it 'loads the class from given string, by interpolating string tokens and respecting their order' do
      Lotus::Utils::Class.load!('App::Service(Point|::Point)').must_equal(App::ServicePoint)
    end

    it 'loads the class from given string, by interpolating tokens and not stopping after first fail' do
      Lotus::Utils::Class.load!('App::(Layer|Layer::)Step').must_equal(App::Layer::Step)
    end

    it 'loads class from given string and namespace' do
      Lotus::Utils::Class.load!('(Layer|Layer::)Step', App).must_equal(App::Layer::Step)
    end
  end
end

describe Lotus::Utils do
  before do
    module App
      module Layer
        class Step
        end
      end

      module Service
        class Point
        end
      end

      class ServicePoint
      end
    end
  end

  describe '.load_class!' do

    it 'loads the class from the given static string' do
      Lotus::Utils.load_class!('App::Layer::Step').must_equal(App::Layer::Step)
    end

    it 'raises error for missing constant' do
      -> { Lotus::Utils.load_class!('MissingConstant') }.must_raise(NameError)
    end

    it 'loads the class from given string, by interpolating tokens' do
      Lotus::Utils.load_class!('App::Service(::Point|Point)').must_equal(App::Service::Point)
    end

    it 'loads the class from given string, by interpolating string tokens and respecting their order' do
      Lotus::Utils.load_class!('App::Service(Point|::Point)').must_equal(App::ServicePoint)
    end

    it 'loads the class from given string, by interpolating tokens and not stopping after first fail' do
      Lotus::Utils.load_class!('App::(Layer|Layer::)Step').must_equal(App::Layer::Step)
    end

    it 'loads class from given string and namespace' do
      Lotus::Utils.load_class!('(Layer|Layer::)Step', App).must_equal(App::Layer::Step)
    end

  end
end
