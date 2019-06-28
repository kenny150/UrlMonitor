#!/bin/bash

#https://cloudbees.santanderbr.corp
__URL__="$1"
__CONTEXT__="$2"
__RETURN_CODE__="$3"
__PREFIX__="$4"
__PEER__="$__PREFIX__://${__URL__}/${__CONTEXT__}"

function check_response () {

    [ $__PREFIX__ == 'http' ] && $__PREFIX__='0' || $__PREFIX__='1' ;

    if [ $__PREFIX__ -eq '0' ]
        then
            declare -g __RESPONSE__CODE__=$(curl -XGET -u 'x209998:Junho@2019!!' -s -L -I $__PEER__ | grep -E "HTTP.*${__RETURN_CODE__}"\
             | sed -e 's/[a-zA-Z]//g' | awk '{print $2}')
    else
            declare -g __RESPONSE__CODE__=$(curl -XGET -u 'x209998:Junho@2019!!' -s -L -I --insecure $__PEER__ \
            | grep -E "HTTP.*${__RETURN_CODE__}" | sed -e 's/[a-zA-Z]//g' | awk '{print $2}')
    fi

    if [ $__RESPONSE_CODE__ -ne '200' ]
        then
            echo "URL RETURNOU $__RESPONSE_CODE__"
            exit 1
    else
            echo "URL RETURNOU $__RESPONSE_CODE__"
            exit 0
    fi

}

check_response
