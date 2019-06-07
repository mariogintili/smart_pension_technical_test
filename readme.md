# Smart Pension Technical Test

The specification for this technical submission can be located in the file `SP Test - Ruby.pdf`

# Requirements

To run the script you must have

- [RVM](http://rvm.io/)
- [Ruby 2.6.3](https://www.ruby-lang.org/en/news/2019/04/17/ruby-2-6-3-released/)
- [Git](https://git-scm.com/)

# Installation

- Clone or unpack this repo
- `$ bundle install`
- `$ bundle exec rspec` to run tests
- `sad`

# Usage

To run the script you can simply invoke

```bash
$ ./main.rb webserver.log 
```

# Additional notes

- TDD was applied throughout the development of this script. I tend to follow [these guidelines](http://www.betterspecs.org/)
- I used [mocks](https://relishapp.com/rspec/rspec-mocks/docs) for testing

The current terminal output looks like this:

```
--------------------
Most Page views

/about/2 90
/contact 89
/index 82
/about 81
/help_page/1 80
/home 78
--------------------
Most Unique Page views

/about/2 10
/contact 10
/index 9
/about 8
/home 7
/help_page/1 6
```

The example of the requirements signal that a path that is a child of another path should be treated as different paths, e,g:

```
/about/2 and
/about are different
```

This has been accounted for during the implementation.
