#!/bin/bash
./sof2ded +set net_ip 0.0.0.0 +set net_port 20100 +set fs_game $SOF2_GAME +set sv_master5 "master.1fxmod.org" +set dedicated 1 +set fs_basepath /home/docker +exec $SOF2_CONFIG
