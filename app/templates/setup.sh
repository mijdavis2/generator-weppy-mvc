#!/usr/bin/env bash
# ------------------------------------------------------------------
# [Michael J. Davis]
#    setup.sh
#          Setup python's virtualenv, install requirements,
#          and set environment variables with one command.
# ------------------------------------------------------------------

VERSION=0.1.0
USAGE='Usage: source setup.sh -hv -p "/path/to/python/" -r "repoName" -q "/path/to/requirements.txt"'
PY_MAJ_REQ=3
PY_MIN_REQ=4
PY_PAT_REQ=1

# --- Option processing --------------------------------------------
while getopts ":v:h:p:r:q:" o; do
    case "${o}" in
      v)
        echo "Version $VERSION"
        return 0;
        ;;
      h)
        echo $USAGE
        return 0;
        ;;
      p)
        PYTHON=$OPTARG
        ;;
      r)
        REQUIRED_VENV=$OPTARG
        ;;
      q)
        REQUIREMENTS_DIR=$OPTARG
        ;;
      ?)
        echo "Unknown option $OPTARG"
        return 0;
        ;;
      :)
        echo "No argument value for option $OPTARG"
        return 0;
        ;;
      *)
        echo $USAGE
        echo "Unknown error while processing options"
        return 0;
        ;;
    esac
  done

# -----------------------------------------------------------------
#  SCRIPT LOGIC GOES HERE
# -----------------------------------------------------------------

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ ! "$REQUIRED_VENV" ]
then
  REQUIRED_VENV="$( basename "$THIS_DIR" )"
fi

if [ ! "$PYTHON" ]
then
    echo "No python version designated."
    echo "Using machine's default python$PY_MAJ_REQ.$PY_MIN_REQ version"
    PYTHON="$( which python"$PY_MAJ_REQ"."$PY_MIN_REQ" )"
fi

PMAJOR="$( "$PYTHON" -c 'import platform; major, minor, patch = platform.python_version_tuple(); print(major);' )"
PMINOR="$( "$PYTHON" -c 'import platform; major, minor, patch = platform.python_version_tuple(); print(minor);' )"
PPATCH="$( "$PYTHON" -c 'import platform; major, minor, patch = platform.python_version_tuple(); print(patch);' )"

if [[ "$PMAJOR" -ge $PY_MAJ_REQ ]] && [[ "$PMINOR" -ge $PYMIN_REQ ]] && [[ "$PPATCH" -ge $PY_PAT_REQ ]]
then
    echo "Python version is good enough: $PMAJOR.$PMINOR.$PPATCH."
else
    echo "Python version must be $PY_MAJ_REQ.$PY_MIN_REQ.$PY_PAT_REQ."
    echo "Yours is $PMAJOR.$PMINOR.$PPATCH :("
    return 1
fi

export VIRTUALENVWRAPPER_PYTHON="$PYTHON"


export WORKON_HOME=~/.virtualenvs

if [ ! -d $HOME/.virtualenvs/ ]
then
  if [ -f $HOME/.venvburrito/startup.sh ]
  then
    if [ ! -f $HOME/.venvburrito/bin/virtualenvwrapper.sh ]
    then
      curl -sL https://bitbucket.org/dhellmann/virtualenvwrapper/raw/5c88ad1fbd749f473784b3346b949fb35d9459a0/virtualenvwrapper.sh --output $HOME/.venvburrito/bin/virtualenvwrapper.sh
    fi
    source $HOME/.venvburrito/startup.sh 2> /dev/null
  else
    if [ -f /usr/local/bin/virtualenvwrapper.sh ]
    then
      source /usr/local/bin/virtualenvwrapper.sh 2> /dev/null
    else
      curl -sL https://raw.githubusercontent.com/brainsik/virtualenv-burrito/master/virtualenv-burrito.sh | $SHELL
      curl -sL https://bitbucket.org/dhellmann/virtualenvwrapper/raw/5c88ad1fbd749f473784b3346b949fb35d9459a0/virtualenvwrapper.sh --output $HOME/.venvburrito/bin/virtualenvwrapper.sh
      source $HOME/.venvburrito/startup.sh 2> /dev/null
    fi
  fi
else
  if [ ! -f $HOME/.virtualenvs/virtualenvwrapper.sh ]
  then
    curl -sL https://bitbucket.org/dhellmann/virtualenvwrapper/raw/5c88ad1fbd749f473784b3346b949fb35d9459a0/virtualenvwrapper.sh --output $HOME/.virtualenvs/virtualenvwrapper.sh
  fi
  source $HOME/.virtualenvs/virtualenvwrapper.sh 2> /dev/null
fi

export WORKON_HOME=~/.virtualenvs

if [ ! -d ~/.virtualenvs/"$REQUIRED_VENV" ]
then
  mkvirtualenv "$REQUIRED_VENV" --python="$PYTHON"
fi


if [ ! "$REQUIREMENTS_DIR" ]
then
  REQUIREMENTS_DIR="."
fi

PYTHONHOME=~/.virtualenvs/"$REQUIRED_VENV"/
export PYTHONHOME="$PYTHONHOME"

# Support both unix and Windows :hankey:
if [ -d $PYTHONHOME/bin/ ]
then
  source $PYTHONHOME/bin/activate
else
  source $PYTHONHOME/Scripts/activate
fi

while read dependency; do
    dependency_stripped="$(echo "${dependency}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
    # Skip comments
    if [[ $dependency_stripped == \#* ]]; then
        continue
    # Skip blank lines
    elif [ -z "$dependency_stripped" ]; then
        continue
    else
        if pip install -q "$dependency_stripped"; then
            echo "$dependency_stripped is installed"
        else
            echo "Could not install $dependency_stripped, skipping"
        fi
    fi
done < "$REQUIREMENTS_DIR"/requirements.txt

export PYTHONPATH="$THIS_DIR":$HOME/.virtualenvs/"$REQUIRED_VENV"/lib/python"$PMAJOR"."$PMINOR"/site-packages:"$REQUIREMENTS_DIR"
