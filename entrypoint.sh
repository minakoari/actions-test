#!/bin/bash

set -e

# usage()
# {
# cat << EOF
# usage: ./entrypoint.sh --type=test_type --extra=extra_parameters
# -t    | --type  (required)  Test type
# -e    | --extra (optional)  Extra parameters
# -h    | --help
# EOF
# }

# for i in "$@"
# do
#     case $i in
#         -t=*|--type=*)
#             TYPE="${i#*=}"
#             shift # past argument=value
#         ;;
        
#         -e=*|--extra=*)
#             EXTRA="${i#*=}"
#             shift # past argument=value
#         ;;
        
#         *)
#             # unknown option
#         ;;
#     esac
# done

# if [ -z $INPUT_TEST_TYPE ]
# then
#     usage
#     exit 1
# fi

case $INPUT_TEST_TYPE in
    pytest)
        sh -c "if [ -f requirements.txt ]; then pip install -r requirements.txt; fi && pytest $INPUT_EXTRA_ARGUMENTS"
    ;;
    
    maven)
        sh -c "mvn test $INPUT_EXTRA_ARGUMENTS -q"
    ;;
    
    *)
        echo -n "unknown"
    ;;
esac

# sh -c "$*"
