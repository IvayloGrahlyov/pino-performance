#!/bin/sh

# Remove old test results before a new test run
rm -f ./test-results.log

# Traverse through the test-data files and make requests for each file for both of the loggers
# for DIR in $PWD/test-data/*; do
#   for FILE in $DIR/*; do
#     echo $FILE >> test-results.log
#     ab -p $FILE -T application/json -c 50 -n 50000 http://localhost:3000/test-winston >> test-results.log
#     echo  >> test-results.log
#     echo "==========================================================================================" >> test-results.log
#     echo  >> test-results.log
#     echo $FILE >> test-results.log
#     ab -p $FILE -T application/json -c 50 -n 50000 http://localhost:3000/test-pino >> test-results.log
#     echo  >> test-results.log
#     echo "==========================================================================================" >> test-results.log
#     echo  >> test-results.log
#     echo "$FILE completed"
#   done
# done

    echo small-num-keys-small-values/100.json >> test-results.log
    ab -p ./test-data/small-num-keys-small-values/100.json -T application/json -c 100 -n 100000 -k http://localhost:3000/test-winston >> test-results.log
    echo  >> test-results.log
    echo "==========================================================================================" >> test-results.log
    echo  >> test-results.log
    echo small-num-keys-small-values/100.json >> test-results.log
    ab -p ./test-data/small-num-keys-small-values/100.json -T application/json -c 100 -n 100000 -k http://localhost:3000/test-pino >> test-results.log
    echo  >> test-results.log
    echo "==========================================================================================" >> test-results.log
    echo  >> test-results.log
    echo "small-num-keys-small-values/1000.json completed"

