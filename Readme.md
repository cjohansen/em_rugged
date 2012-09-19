# EMRugged

Asynchronous [`Rugged`](https://github.com/libgit2/rugged) for EventMachine.
Provides an API exactly like that of Rugged's, only where costly operations are
asynchronous and return deferrables.

The idea behind this library is to eventually build a complete asynchronous
Rugged implementation. For now, it only provides asynchronous versions of a
select few methods. More are added as needed. It is currently being used by
[`dolt`](http://gitorious.org/gitorious/dolt).

## API Docs

### `EMRugged.Repository`

Wraps a
[`Rugged::Repository`](http://rubydoc.info/github/libgit2/rugged/master/Rugged/Repository).

Currently only the `rev_parse` method is provided as asynchronous. Note that
other methods are not proxied. When you need them, add asynchronous versions of
them.

    require "em_rugged"
    require "eventmachine"

    EM.run do

      # Async version
      repo = EMRugged::Repository.new(".")
      repo.rev_parse("master:").callback do |tree|
        tree.entries.each { |e| puts e[:name] }
      end

      # Sync version
      repo = EMRugged::Repository.new(".")
      repo.rev_parse("master:").entries.each { |e| puts e[:name] }

    end

## Installing

`em_rugged` ships as a gem:

    $ gem install em_rugged

Or in your Gemfile:

    gem "em_rugged", "~> 0.1"

## Contributing

Contributions are welcome. To get started:

    $ git clone git://gitorious.org/gitorious/em_rugged.git
    $ cd em_rugged
    $ bundle install
    $ rake

When you have fixed a bug/added a feature/done your thing, create a
[clone on Gitorious](http://gitorious.org/gitorious/em_rugged) or a
[fork on GitHub](http://github.com/cjohansen/em_rugged) and send a
merge request/pull request, whichever you prefer.

Please add tests when adding/altering code, and always make sure all the tests
pass before submitting your contribution.

## License

### The MIT License (MIT)

**Copyright (C) 2012 Gitorious AS**

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
