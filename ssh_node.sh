#!/bin/bash

echo "Need to update this script with the latest cloudlab reservation"

case "$1" in
  node0)
    ssh Alicia@d7525-10s10337.wisc.cloudlab.us
    ;;
  node1)
    ssh Alicia@d7525-10s10323.wisc.cloudlab.us
    ;;
  node2)
    ssh Alicia@d7525-10s10311.wisc.cloudlab.us
    ;;
  node3)
    ssh Alicia@d7525-10s10339.wisc.cloudlab.us
    ;;
  node4)
    ssh Alicia@d7525-10s10327.wisc.cloudlab.us
    ;;
  node5)
    ssh Alicia@d7525-10s10317.wisc.cloudlab.us
    ;;
  node6)
    ssh Alicia@d7525-10s10331.wisc.cloudlab.us
    ;;
  node7)
    ssh Alicia@d7525-10s10315.wisc.cloudlab.us
    ;;
  node8)
    ssh Alicia@d7525-10s10309.wisc.cloudlab.us
    ;;
  node9)
    ssh Alicia@d7525-10s10321.wisc.cloudlab.us
    ;;
  node10)
    ssh Alicia@d7525-10s10335.wisc.cloudlab.us
    ;;
  node11)
    ssh Alicia@d7525-10s10325.wisc.cloudlab.us
    ;;
  *)
    echo "Usage: $0 {node0|node1|...}"
    exit 1
    ;;
esac
