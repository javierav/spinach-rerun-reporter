# spinach-rerun-reporter

A reporter for [Spinach](https://github.com/codegram/spinach) that writes in a file all failed scenarios in order to re-execute them.


## Installation

Add this line to your application's `Gemfile`:

```
gem 'spinach-rerun-reporter', '~> 0.0.2'
```

And then execute:

```
$ bundle install
```


## Usage

```
$ bundle exec spinach -r rerun
```

When a scenario fails, the reporter writes the feature file and line in `tmp/spinach-rerun.txt` file.

### Example

```
features/login.feature:21
features/login.feature:38
features/home.feature:10
```

### How to rerun

In order to rerun the failing scenarios I use the following Bash script:

```bash
#!/usr/bin/env bash

RERUN_FILE="tmp/spinach-rerun.txt"
TAGS="~@todo,~@firefox"

set +e

bundle exec spinach --tags $TAGS -r rerun; exitCode=$?

counter=1

while [ true ]; do
  if [ $exitCode = 0 ]; then
    exit 0
  else
    if [ $counter -gt 3 ]; then
      exit 1
    else
      counter=$((counter + 1))
      bundle exec spinach `cat $RERUN_FILE | tr "\\n" " "` --tags $TAGS -r rerun; exitCode=$?
    fi
  fi
done

exit $exitCode
```

The script executes all features. If any scenarios fails, exits with a zero status code. In other case it uses the rerun file to execute only the failing scenarios. After three attemps exits with a non zero status code.


## Contributing

1. Fork it ( https://github.com/javierav/spinach-rerun-reporter/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request


## Versioning

**spinach-rerun-reporter** uses [Semantic Versioning 2.0.0](http://semver.org)


## License

Copyright (c) 2016 Javier Aranda - Released under [MIT](LICENSE) license
