#!/usr/bin/env bash

# This script executes all features. If any scenarios fails, exits with a zero
# status code. In other case it uses the rerun file to execute only the failing
# scenarios. After three attemps exits with a non zero status code.

SPINACH_RERUN_FILE="tmp/spinach-rerun.txt"
SPINACH_RERUN_TAGS="~@todo,~@firefox"

set +e

bundle exec spinach --tags $SPINACH_RERUN_TAGS -r rerun; exitCode=$?

counter=1

while [ true ]; do
  if [ $exitCode = 0 ]; then
    exit 0
  else
    if [ $counter -gt 3 ]; then
      exit 1
    else
      counter=$((counter + 1))
      bundle exec spinach "`cat $SPINACH_RERUN_FILE | tr "\\n" " "` --tags $SPINACH_RERUN_TAGS -r rerun; exitCode=$?"
    fi
  fi
done

exit $exitCode
