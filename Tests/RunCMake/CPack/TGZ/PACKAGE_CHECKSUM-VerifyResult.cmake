if(NOT ${RunCMake_SUBTEST_SUFFIX} MATCHES "invalid")
  string(TOLOWER ${RunCMake_SUBTEST_SUFFIX} EXTENSION)
  file(GLOB PACKAGE RELATIVE ${bin_dir} "*.tar.gz")
  file(GLOB CSUMFILE RELATIVE ${bin_dir} "*.${EXTENSION}")
  file(STRINGS ${CSUMFILE} CHSUM_VALUE)
  file(${RunCMake_SUBTEST_SUFFIX} ${PACKAGE} expected_value )
  set(expected_value "${expected_value}  ${PACKAGE}")

  if(NOT expected_value STREQUAL CHSUM_VALUE)
    message(FATAL_ERROR "Generated checksum is not valid! Expected [${expected_value}] Got [${CHSUM_VALUE}]")
  endif()
else()
  message(${error})
endif()
