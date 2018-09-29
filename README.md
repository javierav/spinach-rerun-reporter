# spinach-rerun-reporter

A reporter for [Spinach](https://github.com/codegram/spinach) that writes in a
file all failed scenarios in order to re-execute them.


## Status

![Gem](https://img.shields.io/gem/v/spinach-rerun-reporter.svg)
![Depfu](https://badges.depfu.com/badges/5dfc158e963346012b4c0fe02786c993/count.svg)


## Installation

Add this line to your application's `Gemfile`:

```
group :development, :test do
  gem 'spinach-rerun-reporter'
end
```

And then execute:

```
$ bundle install
```

## Usage

```
$ bundle exec spinach -r rerun
```

When a scenario fails, the reporter writes the feature file and line in the file
specified in `SPINACH_RERUN_FILE` environment variable which defaults to
`tmp/spinach-rerun.txt` if not exists.

### How to rerun

In order to rerun the failing scenarios you can use [this](examples/rerun.sh)
script.

### Rails

If Rails is present, this gem adds a Rake task to your project that automatize
the rerun process.

```
$ rake spinach:rerun
```

You can use the following environment variables to configure it:

| Variable | Description | Default |
| --- | --- | --- |
| SPINACH_RERUN_TAGS | Specify tags for Spinach | nil |
| SPINACH_RERUN_FILE | Specify the rerun file | tmp/spinach-rerun.txt |
| SPINACH_RERUN_RETRY_COUNT | Specify the number of retry attemps | 3 |
| SPINACH_RERUN_PREPEND_CMD | Specify a prefix for run Spinach command | nil |


## Contributing

1. Fork it ( https://github.com/javierav/spinach-rerun-reporter/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request


## Versioning

**spinach-rerun-reporter** uses [Semantic Versioning 2.0.0](http://semver.org)


## License

Copyright (c) 2018 Javier Aranda - Released under [MIT](LICENSE) license
