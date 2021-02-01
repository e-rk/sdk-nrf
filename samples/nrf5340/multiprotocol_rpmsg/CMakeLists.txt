# SPDX-License-Identifier: Apache-2.0

cmake_minimum_required(VERSION 3.13.1)

find_package(Zephyr REQUIRED HINTS $ENV{ZEPHYR_BASE})
project(multiprotocol_rpmsg)

target_sources(app PRIVATE src/main.c)

if (CONFIG_D154_TESTAPPS_DEBUG)
  add_compile_definitions(NRF_802154_SL_ENABLE_DEBUG_LOG=1)
endif()
