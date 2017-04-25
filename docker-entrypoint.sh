#!/bin/bash

case "$1" in
  shell)
    /bin/bash
	;;
  testing-example)
    /osal/build/examples/tasking-example/tasking-example.bin
    ;;
  unit-tests)
    /root/build/unit-tests/oscore-test/osal_core_UT
	/root/build/unit-tests/osfilesys-test/osal_filesys_UT
	/root/build/unit-tests/osfile-test/osal_file_UT
	/root/build/unit-tests/osloader-test/osal_loader_UT
	/root/build/unit-tests/osnetwork-test/osal_network_UT
	/root/build/unit-tests/ostimer-test/osal_timer_UT
    ;;
  tests)
    /root/build/tests/bin-sem-flush-test
#    /root/build/tests/bin-sem-test
#    /root/build/tests/bin-sem-timeout-test
#	/root/build/tests/count-sem-test
	/root/build/tests/file-api-test
#	/root/build/tests/mutex-test
	/root/build/tests/osal-core-test
#	/root/build/tests/queue-timeout-test
	/root/build/tests/symbol-api-test
#	/root/build/tests/timer-test
    ;;
  *)
    echo "Usage: $0 [shell|testing-example|unit-tests|test]"
    ;;
esac
