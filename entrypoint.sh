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

TYPE = $INPUT_TEST_TYPE
EXTRA = $INPUT_EXTRA_ARGUMENTS

if [ -z "$TYPE" ]
then
    usage
    exit 1
fi

case $TYPE in
    pytest)
        sh -c "if [ -f requirements.txt ]; then pip install -r requirements.txt; fi && pytest $EXTRA"
    ;;
    
    maven)
        sh -c "mvn test $EXTRA -q"
    ;;
    
    *)
        echo -n "unknown"
    ;;
esac

# sh -c "$*"
