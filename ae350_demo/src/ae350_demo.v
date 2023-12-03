
// AE350 demo
module ae350_demo_top
(
    input CLK,
    input RSTN,
    // GPIO
    inout [3:0] LED,     // 2:0
    inout [2:0] KEY,     // 5:3
    // UART2
    output UART2_TXD,
    input  UART2_RXD,
    // SPI Flash Memory
    inout FLASH_SPI_CSN,
    inout FLASH_SPI_MISO,
    inout FLASH_SPI_MOSI,
    inout FLASH_SPI_CLK,
    inout FLASH_SPI_HOLDN,
    inout FLASH_SPI_WPN,
    // DDR3 Memory
    output DDR3_INIT,
    output [2:0] DDR3_BANK,
    output DDR3_RAS_N,
    output DDR3_CAS_N,
    output DDR3_WE_N,
    output DDR3_CK,
    output DDR3_CK_N,
    output DDR3_CKE,
    output DDR3_RESET_N,
    output DDR3_ODT,
    output DDR3_CS_N,
	
    output [13:0] DDR3_ADDR,
    output [3:0] DDR3_DM,
    inout [15:0] DDR3_DQ,
    inout [3:0] DDR3_DQS,
    inout [3:0] DDR3_DQS_N,
    // JTAG
    input TCK_IN,
    input TMS_IN,
    input TRST_IN,
    input TDI_IN,
    output TDO_OUT
);


wire CORE_CLK;

wire DDR_CLK;
wire AHB_CLK;
wire APB_CLK;
// wire COM_CLK;

wire RTC_CLK;

wire DDR3_MEMORY_CLK;
wire DDR3_CLK_IN;
wire DDR3_LOCK;
wire DDR3_STOP;


ELVDS_IOBUF dummy_lvds0(
	.O		(),
	.IO		(DDR3_DQS[2]),
	.IOB	(DDR3_DQS_N[2]),
	.I		(1'b0),
	.OEN	(1'b1)
);

ELVDS_IOBUF dummy_lvds1(
	.O		(),
	.IO		(DDR3_DQS[3]),
	.IOB	(DDR3_DQS_N[3]),
	.I		(1'b0),
	.OEN	(1'b1)
);

wire [31 : 0]	cpu_gpio;

wire ddr_init_n;

assign DDR3_INIT = ~ddr_init_n;
assign LED[2:0] = cpu_gpio[2:0];
assign cpu_gpio[5:3] = KEY;

// assign DDR3_ADDR[14] = 1'b0;
assign DDR3_DM[3:2] = 2'b00;


reg [31:0] led_cnt;
reg			led_f;

assign LED[3] = led_f;

always@(posedge CLK)begin // clk_x1 来自 DDR IP 的 时钟输出
    if(led_cnt >= 50_000_000) begin
            led_f <= ~led_f;
            led_cnt <= 'd0;
    end
    else
            led_cnt <= led_cnt + 1'b1;
end

wire core_lock;

// Gowin_PLL_AE350 instantiation
core_pll u_core_pll
(
	.lock(core_lock),
    
	.clkout0(DDR_CLK),          // 80MHz
    .clkout1(CORE_CLK),         // 800MHz
    .clkout2(AHB_CLK),          // 100MHz
    .clkout3(APB_CLK),          // 100MHz
    .clkout4(RTC_CLK),          // 10MHz
	
    .clkin(CLK),
    .reset(1'b0),
    .enclk0(1'b1),
    .enclk1(1'b1),
    .enclk2(1'b1),
    .enclk3(1'b1),
    .enclk4(1'b1)
);


// Gowin_PLL_DDR3 instantiation
ddr_pll u_ddr_pll
(
    .lock(DDR3_LOCK),
    .clkout0(DDR3_CLK_IN),          // 50MHz
    .clkout2(DDR3_MEMORY_CLK),      // 400MHz
    .clkin(CLK),
    .reset(1'b0),
    .enclk0(1'b1),
    .enclk2(DDR3_STOP)
);

wire	ddr3_rstn;

key_debounce u_key_debounce_ddr3
(
    .out(ddr3_rstn),
    .in(RSTN),
    .clk(CLK),      // 50MHz
    .rstn(1'b1)
);


key_debounce u_key_debounce_ae350
(
    .out(ae350_rstn),
    .in(ddr_init_n),
    .clk(CLK),      // 50MHz
    .rstn(1'b1)
);


// RiscV_AE350_SOC_Top instantiation
RiscV_AE350_SOC_Top u_RiscV_AE350_SOC_Top
(
    .FLASH_SPI_CSN(FLASH_SPI_CSN),
    .FLASH_SPI_MISO(FLASH_SPI_MISO),
    .FLASH_SPI_MOSI(FLASH_SPI_MOSI),
    .FLASH_SPI_CLK(FLASH_SPI_CLK),
    .FLASH_SPI_HOLDN(FLASH_SPI_HOLDN),
    .FLASH_SPI_WPN(FLASH_SPI_WPN),
    
	.DDR3_MEMORY_CLK(DDR3_MEMORY_CLK),
    .DDR3_CLK_IN(DDR3_CLK_IN),
	.DDR3_RSTN(ddr3_rstn),
    .DDR3_LOCK(DDR3_LOCK),
    .DDR3_STOP(DDR3_STOP),
    .DDR3_INIT(ddr_init_n),
    .DDR3_BANK(DDR3_BANK),
    .DDR3_RAS_N(DDR3_RAS_N),
    .DDR3_CAS_N(DDR3_CAS_N),
    .DDR3_WE_N(DDR3_WE_N),
    .DDR3_CK(DDR3_CK),
    .DDR3_CK_N(DDR3_CK_N),
    .DDR3_CKE(DDR3_CKE),
    .DDR3_RESET_N(DDR3_RESET_N),
    .DDR3_ODT(DDR3_ODT),
    .DDR3_ADDR(DDR3_ADDR),
    .DDR3_DM(DDR3_DM[1:0]),
    .DDR3_DQ(DDR3_DQ),
    .DDR3_DQS(DDR3_DQS[1:0]),
    .DDR3_DQS_N(DDR3_DQS_N[1:0]),
	.DDR3_CS_N	(DDR3_CS_N),
	
    .TCK_IN(TCK_IN),
    .TMS_IN(TMS_IN),
    .TRST_IN(TRST_IN),
    .TDI_IN(TDI_IN),
    .TDO_OUT(TDO_OUT),
    .TDO_OE(),
    .UART2_TXD(UART2_TXD),
    .UART2_RTSN(),
    .UART2_RXD(UART2_RXD),
    .UART2_CTSN(1'b1),
    .UART2_DCDN(1'b1),
    .UART2_DSRN(1'b1),
    .UART2_RIN(1'b1),
    .UART2_DTRN(),
    .UART2_OUT1N(),
    .UART2_OUT2N(),
    .GPIO(cpu_gpio),
	
    .CORE_CLK(CORE_CLK),
    
	.DDR_CLK(DDR_CLK),
    .AHB_CLK(AHB_CLK),
    .APB_CLK(APB_CLK),
	
    .RTC_CLK(RTC_CLK),
    
	.POR_RSTN(ae350_rstn),              // AE350 CPU core power on reset, 0 is reset state
	.HW_RSTN(ae350_rstn)                // AE350 hardware reset, 0 is reset state
);

endmodule