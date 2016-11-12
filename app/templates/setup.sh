#!/usr/bin/env bash
# ------------------------------------------------------------------
# [Michael J. Davis]
#    setup.sh
#          Easily setup python's virtualenv, install requirements.
# ------------------------------------------------------------------

{
  [[ "${BASH_SOURCE[0]}" != $0 ]]
} || {
  echo "
  Please run script as 'source'
  "
  exit 1
}

# ------------------------------------------------------------------
#  DESIGNATE REQUIRED PYTHON VERSION
# ------------------------------------------------------------------
PYTHON_VERSION="<%= reqMajor %>.<%= reqMinor %>.<%= reqPatch %>"


THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# ------------------------------------------------------------------
#  RUN SETUP
# ------------------------------------------------------------------
run_first_time_setup() {
    read -r -p "${1:-Are you in the parent directory of your python project? [y/N]} " response
    case ${response} in
        [yY][eE][sS]|[yY])
            READY=true
            ;;
        *)
            echo "Make sure this script location and current directory == project root directory"
            READY=false
            ;;
    esac
}

if [ ! -d ${THIS_DIR}/env ]
then
    run_first_time_setup
    if [ ${READY} = true ]
    then
        {
            curl -O https://raw.githubusercontent.com/mijdavis2/ezpz-setup/master/ezpz-setup.sh
            source ${THIS_DIR}/ezpz-setup.sh -r ${PYTHON_VERSION}
        } && {
            mv ${THIS_DIR}/ezpz-setup.sh ${THIS_DIR}/env/
        } || {
            echo "Setup failed!"
            echo "Try removing THIS_DIR/env and THIS_DIR/tmp"
            echo "TODO:"
            echo "    implement '--update' arg to download fresh copy of ezpz-setup.sh"
        }
    fi
else
    {
        source ${THIS_DIR}/env/ezpz-setup.sh -r ${PYTHON_VERSION}
    } || {
        echo "Setup failed!"
        echo "Try removing THIS_DIR/env and THIS_DIR/tmp"
        echo "TODO:"
        echo "    implement '--update' arg to download fresh copy of ezpz-setup.sh"
    }
fi
