set_env () {
      if [ "$#" -ne 1 ]; then
         read -p 'Please select the target environment (XX-yyy): ' env
         echo
      else
         env=$1
      fi
      if [ -d environments/$env ]; then
           export ANSIBLE_ENVIRONMENT=$env
           export ANSIBLE_INVENTORY=environments/$env
           export ANSIBLE_FILES=environments/$env/files
           for VAR in ANSIBLE_ENVIRONMENT ANSIBLE_INVENTORY ANSIBLE_FILES; do
                 echo $VAR is now set to ${!VAR}
           done
      else
         echo Environment files for $env not found
         return 1
      fi
