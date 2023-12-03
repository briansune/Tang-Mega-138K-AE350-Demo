//Copyright (C)2014-2023 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: Template file for instantiation
//GOWIN Version: V1.9.9 Beta-6
//Part Number: GW5AST-LV138FPG676AC1/I0
//Device: GW5AST-138B
//Device Version: B
//Created Time: Fri Nov 03 20:45:08 2023

//Change the instance name and port connections to the signal names
//--------Copy here to design--------

    ddr_pll your_instance_name(
        .lock(lock_o), //output lock
        .clkout0(clkout0_o), //output clkout0
        .clkout2(clkout2_o), //output clkout2
        .clkin(clkin_i), //input clkin
        .reset(reset_i), //input reset
        .enclk0(enclk0_i) //input enclk0
    );

//--------Copy end-------------------
