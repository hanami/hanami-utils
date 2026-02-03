## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hanami-utils'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hanami-utils

## Usage

**Hanami::Utils** is designed to enhance Ruby's code and stdlib.
**By default this gem doesn't load any code, you must require what you need.**

## Features

### Hanami::Utils::Blank

Checks for blank. [[API doc](http://www.rubydoc.info/gems/hanami-utils/Hanami/Utils/Blank)]

### Hanami::Utils::Callbacks

Callbacks to decorate methods with `before` and `after` logic. It supports polymorphic callbacks (methods and procs). [[API doc](http://www.rubydoc.info/gems/hanami-utils/Hanami/Utils/Callbacks)]

### Hanami::Utils::Class

Load classes from strings. It also supports namespaces. [[API doc](http://www.rubydoc.info/gems/hanami-utils/Hanami/Utils/Class)]

### Hanami::Utils::ClassAttribute

Inheritable class attributes. [[API doc](http://www.rubydoc.info/gems/hanami-utils/Hanami/Utils/ClassAttribute)]

### Hanami::Utils::Deprecation

Deprecate Hanami features. [[API doc](http://www.rubydoc.info/gems/hanami-utils/Hanami/Utils/Deprecation)]

### Hanami::Utils::FileList

Recursive, cross-platform ordered list of files. [[API doc](http://www.rubydoc.info/gems/hanami-utils/Hanami/Utils/FileList)]

### Hanami::Utils::Files

File utilities to manipulate files and directories. [[API doc](http://www.rubydoc.info/gems/hanami-utils/Hanami/Utils/Files)]

### Hanami::Utils::Hash

`Hash` transformations. [[API doc](http://www.rubydoc.info/gems/hanami-utils/Hanami/Utils/Hash)]

### Hanami::Utils::IO

Silence Ruby warnings. [[API doc](http://www.rubydoc.info/gems/hanami-utils/Hanami/Utils/IO)]

### Hanami::Utils::Json

JSON engine with swappable backends (via optional `multi_json` gem) or powered by Ruby's `json` (default). [[API doc](http://www.rubydoc.info/gems/hanami-utils/Hanami/Utils/Json)]

### Hanami::Utils::Kernel

Type coercions for most common Ruby types. [[API doc](http://www.rubydoc.info/gems/hanami-utils/Hanami/Utils/Kernel)]

### Hanami::Utils::LoadPaths

Manage directories where to find Ruby source code or web static assets. [[API doc](http://www.rubydoc.info/gems/hanami-utils/Hanami/Utils/LoadPaths)]

### Hanami::Utils::PathPrefix

Safe logic to manage relative URLs. [[API doc](http://www.rubydoc.info/gems/hanami-utils/Hanami/Utils/PathPrefix)]

### Hanami::Utils::QueryString

URI query string transformation [[API doc](http://www.rubydoc.info/gems/hanami-utils/Hanami/Utils/QueryString)]

### Hanami::Utils::ShellColor

Shell colorizer [[API doc](http://www.rubydoc.info/gems/hanami-utils/Hanami/Utils/ShellColor)]

### Hanami::Utils::String

Enhanced version of Ruby's `String`. [[API doc](http://www.rubydoc.info/gems/hanami-utils/Hanami/Utils/String)]

## Contributing

1. Fork it ( https://github.com/hanami/utils/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
