.. _multiprotocol-rpmsg-sample:

Multiprotocol RPMsg
###################

Overview
********

This sample exposes :ref:`softdevice_controller` and IEEE 802.15.4 radio driver support to the nRF5340 application CPU using RPMsg transport which is a part of `OpenAMP <https://github.com/OpenAMP/open-amp/>`__.

The sample requires a nRF5340 development kit. The
firmware must be flashed to the nRF5340 network core.
This sample is compatible with the HCI RPMsg driver provided by Zephyr's Bluetooth :ref:`bt_hci_drivers` core.

See the :option:`CONFIG_BT_RPMSG`, :option:`CONFIG_NRF_802154_SER_HOST`, and :option:`CONFIG_BT_RPMSG_NRF53` configuration options for more information.

You might need to adjust the Kconfig configuration of this sample to make it compatible with the peer application.
For example, :option:`CONFIG_BT_MAX_CONN` must be equal to the maximum number of connections supported by the peer application.

Requirements
************

The sample supports the following development kits:

.. table-from-rows:: /includes/sample_board_rows.txt
   :header: heading
   :rows: nrf5340dk_nrf5340_cpunet

Building and Running
********************

This sample can be found under :file:`samples/nrf5340/multiprotocol_rpmsg` in the Zephyr tree.

The recommended way of building this sample is to use the multi-image feature of the build system.
The sample is built automatically as a child image when both :option:`CONFIG_BT_RPMSG_NRF53` and :option:`CONFIG_NRF_802154_SER_HOST` are enabled.

It is also possible to build this sample as a stand-alone.

Testing
*******

To test the application run the following commands:

#. Go to :zephyr_file:`samples/net/sockets/echo_server` sample directory

#. ``west build -b nrf5340dk_nrf5340_cpuapp -p -- -DOVERLAY_CONFIG="overlay-802154.conf;overlay-bt.conf"``

   During the build, the :ref:`multiprotocol-rpmsg-sample` image will be automatically included.

#. ``west flash``

   This command will flash both application and network core firmwares to the nRF5340 SoC.

#. Run :ref:`sockets-echo-client-sample` in IEEE 802.15.4 variant on a second board.

#. |connect terminal|

   Note that on the nRF5340 DK has multiple UART instances, so the correct port must be identified.

#. Observe that packets are exchanged between the devices and the nRF5340 advertises over Bluetooth.


Dependencies
************

This sample uses the following |NCS| libraries:

* :ref:`softdevice_controller`
* :ref:`nrf_802154_sl`
* :ref:`mpsl`
