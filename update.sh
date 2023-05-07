#!/bin/bash

#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail
if [[ "${TRACE-0}" == "1" ]]; then set -o xtrace; fi
export SHELLOPTS

cd "$(dirname "$0")"

git pull

[ ! -d "get-git-branch-name" ] && git clone https://github.com/gturi/get-git-branch-name.git

cd get-git-branch-name
git pull
