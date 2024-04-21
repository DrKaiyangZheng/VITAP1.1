#!/bin/bash

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

if [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]]; then
  echo "*******************************************************************"
  echo "The VITAP (VIral Taxonomy Assigning Pipeline) Copyright 2023 Kaiyang Zheng, Viral/microbial diversity Lab. Ocean University of China"
  echo "*******************************************************************"
  echo "Usage: $0 <command> [options]"
  echo "Commands:"
  echo "  assignment    VITAP taxonomic assignment pipeline."
  echo "  upd           Update program of VITAP. The VITAP will update database based on ICTV VMR."
  echo ""
  echo "For command-specific help, run: $0 <command> -h"
  exit 0
fi

if [ "$#" -lt 1 ]; then
  echo "Usage: $0 <command> [options]"
  exit 1
fi

COMMAND=$1

shift

case $COMMAND in
  assignment)
    python3 "${SCRIPT_DIR}/VITAP_assignment_20240421.py" "$@"
    ;;
  upd)
    python3 "${SCRIPT_DIR}/VITAP_upd_20240317.py" "$@"
    ;;
  *)
    echo "Unknown command: $COMMAND"
    echo "Available commands: assignment, upd"
    exit 1
    ;;
esac
