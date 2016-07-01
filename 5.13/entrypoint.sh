#!/bin/bash

cmd="${1:-activemq}"; shift;
case "${cmd}" in
	console) $0 activemq console "${@}" ;;
    activemq) ${PRODUCT_HOME}/bin/activemq "${@}" ;;
	*) set -x; exec "${cmd}" "${@}" ;;
esac

