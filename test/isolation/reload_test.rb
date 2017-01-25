require 'test_helper'
require 'hanami/utils'
require 'pathname'

describe 'Hanami::Utils.reload!' do
  before do
    FileUtils.rm_rf(root) if root.exist?
    root.mkpath
  end

  after do
    FileUtils.rm_rf(root.parent)
  end

  let(:root) { Pathname.new(Dir.pwd).join('tmp', 'reload') }

  it 'reloads the files set of files' do
    File.open(root.join('user.rb'), 'w+') do |f|
      f.write <<-EOF
class User
  def greet
    "Hi"
  end
end
EOF
    end

    Hanami::Utils.reload!(root)
    User.new.greet.must_equal "Hi"

    File.open(root.join('user.rb'), 'w+') do |f|
      f.write <<-EOF
class User
  def greet
    "Ciao"
  end
end
EOF
    end

    Hanami::Utils.reload!(root)
    User.new.greet.must_equal "Ciao"
  end
end
