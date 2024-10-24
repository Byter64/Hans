##################################################################################################
# BSD 3-Clause License
#
# Copyright (c) 2022, Jose R. Garcia
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice, this
#    list of conditions and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright notice,
#    this list of conditions and the following disclaimer in the documentation
#    and/or other materials provided with the distribution.
#
# 3. Neither the name of the copyright holder nor the names of its
#    contributors may be used to endorse or promote products derived from
#    this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
##################################################################################################
# File name    : top.py
# Author       : Jose R Garcia (jg-fossh@protonmail.com)
# Project Name : Goldschmidt Integer Divider
# Class Name   : top
# Description  : Goldschmidt_Integer_Divider Test Top. Wraps the design units
#                into the test environment.
#
# Additional Comments:
#
##################################################################################################
import random
import sys
# Add the Wisbone Verification Agents directories.
sys.path.append('../externals/uvm_python_Wishbone_Pipeline_Slave/')
# Import cocotb clock and timers
import cocotb
from cocotb.triggers import Timer
from cocotb.clock import Clock
from cocotb_coverage.coverage import *
# Import uvm-python base items
from uvm.base import UVMCoreService
from uvm.base import run_test, UVMDebug
from uvm.base.uvm_phase import UVMPhase
from uvm.seq import UVMSequence
# Import the Wisbone Verification Agents directories.
from wb4s_if import *
# Import test bench files
from tb_env_config import *
from tb_env import *
from test_lib import *


async def initial_run_test(dut, vif_slave):
    """
       Description: Places the virtual interfaces into the Config DB and await
       for the test to finish.
    """
    #from uvm.base import UVMCoreService
    cs_ = UVMCoreService.get()
    UVMConfigDb.set(None, "*", "vif_slave", vif_slave)
    UVMConfigDb.set(None, "dut", "DUT_SLAVE_DATA_IN_LENGTH", len(dut.i_wb4s_data))
    await run_test()


async def initial_reset(vif_slave, dut):
    """
       Description: Perform power on reset. Toggle reset signals and fork the
       test routines.
    """
    #await Timer(0, "NS")
    vif_slave.rst_i <= 1
    await Timer(10, "MS")
    vif_slave.rst_i <= 0


@cocotb.test()
async def top(dut):
    """ Adder Bus signals definition """

    # Map the signals in the DUT to the verification agents interfaces
    slave_bus_map = { "clk_i": "i_clk",
                      "rst_i": "i_rst",
                      "cyc_i": "i_wb4s_cyc",
                      "stb_i": "i_wb4s_stb",
                      "dat_i": "i_wb4s_data",
                      "dat_o": "o_wb4s_data",
                      "adr_i": "adr_i",
                      "we_i": "we_i",
                      "sel_i": "sel_i",
                      "stall_o": "o_wb4s_stall",
                      "ack_o": "o_wb4s_ack",
                      "tga_i": "tga_i",
                      "tgd_i": "tgd_i",
                      "tgd_o": "tgd_o",
                      "tgc_i": "i_wb4s_tgc" }

    vif_slave = wb4s_if(dut, slave_bus_map)

    # Create a 1Mhz clock
    clock = Clock(dut.i_clk, 1, units="ms")
    # Fork process threads
    proc_clk      = cocotb.fork(clock.start(None, True))  # Start the clock
    proc_reset    = cocotb.fork(initial_reset(vif_slave, dut))
    proc_run_test = cocotb.fork(initial_run_test(dut, vif_slave))

    await sv.fork_join([proc_run_test, proc_reset])
