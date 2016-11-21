#!/bin/bash
case $1 in
  experimental )
    docker exec -ti salt_master_1 salt '*' state.highstate test=True
    ;;
  master )
    docker exec -ti salt_master_1 salt '*' state.highstate test=True
    ;;
  production )
    docker exec -ti salt_master_1 salt '*' state.highstate
    ;;
  * )
    echo "Your options are:"
    echo "./salt.sh experimental, prone to failure but first step before pushing to main."
    echo "./salt.sh master, this is the default shared production branch and should only be here for review prior to production."
    echo "./salt.sh production, this is the production branch only push code you want to immediately deploy."
    ;;
esac
