#
# Copyright (c) 2024 Nordic Semiconductor ASA
#
# SPDX-License-Identifier: LicenseRef-Nordic-5-Clause
#

if(SB_CONFIG_SUIT_BUILD_FLASH_COMPANION)
  # Calculate the network board target
  string(REPLACE "/" ";" split_board_qualifiers "${BOARD_QUALIFIERS}")
  list(GET split_board_qualifiers 1 target_soc)
  list(GET split_board_qualifiers 2 target_cpucluster)

  if(DEFINED BOARD_REVISION)
    set(board_target "${BOARD}@${BOARD_REVISION}/${target_soc}/${SB_CONFIG_FLASH_COMPANION_TARGET_CPUCLUSTER}")
  else()
    set(board_target "${BOARD}/${target_soc}/${SB_CONFIG_FLASH_COMPANION_TARGET_CPUCLUSTER}")
  endif()

  ExternalZephyrProject_Add(
    APPLICATION flash_companion
    SOURCE_DIR "${ZEPHYR_NRF_MODULE_DIR}/applications/suit/flash_companion"
    BOARD ${board_target}
  )
endif()

if (SB_CONFIG_SUIT_BUILD_RECOVERY)
  ExternalZephyrProject_Add(
    APPLICATION recovery_app
    SOURCE_DIR "${ZEPHYR_NRF_MODULE_DIR}/samples/multicore/recovery"
    BOARD "nrf54h20dk/nrf54h20/cpuapp"
  )
  ExternalZephyrProject_Add(
    APPLICATION recovery_rad
    SOURCE_DIR "${ZEPHYR_NRF_MODULE_DIR}/../zephyr/samples/bluetooth/hci_ipc"
    BOARD "nrf54h20dk/nrf54h20/cpurad"
  )
endif()
