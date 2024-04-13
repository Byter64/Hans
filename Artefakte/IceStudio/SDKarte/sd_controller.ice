{
  "version": "1.2",
  "package": {
    "name": "",
    "version": "",
    "description": "",
    "author": "",
    "image": ""
  },
  "design": {
    "board": "ulx3s-85f",
    "graph": {
      "blocks": [
        {
          "id": "650885e3-b045-4075-aa54-a54a42daf0b1",
          "type": "basic.output",
          "data": {
            "name": "cs",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": 1096,
            "y": 272
          }
        },
        {
          "id": "23b86167-3a0d-4b51-9d45-ca62ab6ac1a0",
          "type": "basic.input",
          "data": {
            "name": "miso",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ],
            "clock": false
          },
          "position": {
            "x": 80,
            "y": 280
          }
        },
        {
          "id": "5caeb442-d040-49d1-bc4e-aeaa38d1bee2",
          "type": "basic.output",
          "data": {
            "name": "mosi",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": 1088,
            "y": 384
          }
        },
        {
          "id": "45d136b4-6412-43d8-90ab-955a596aaf02",
          "type": "basic.input",
          "data": {
            "name": "rd",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ],
            "clock": false
          },
          "position": {
            "x": 80,
            "y": 408
          }
        },
        {
          "id": "ecb52961-de12-4f83-a3ab-143af0b4fcf3",
          "type": "basic.output",
          "data": {
            "name": "sclk",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": 1088,
            "y": 488
          }
        },
        {
          "id": "8fcccb9b-b215-4058-af9d-c720f3d4719c",
          "type": "basic.input",
          "data": {
            "name": "wr",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ],
            "clock": false
          },
          "position": {
            "x": 80,
            "y": 528
          }
        },
        {
          "id": "e0cf6e2f-e29b-4618-85ca-8a19eaccfa9f",
          "type": "basic.output",
          "data": {
            "name": "dout",
            "virtual": true,
            "range": "[7:0]",
            "pins": [
              {
                "index": "7",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "6",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "5",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "4",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "3",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "2",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "1",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": 1096,
            "y": 600
          }
        },
        {
          "id": "0810b100-edf9-4299-bc57-bd79008f75ff",
          "type": "basic.input",
          "data": {
            "name": "din",
            "virtual": true,
            "range": "[7:0]",
            "pins": [
              {
                "index": "7",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "6",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "5",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "4",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "3",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "2",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "1",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ],
            "clock": false
          },
          "position": {
            "x": 72,
            "y": 656
          }
        },
        {
          "id": "cb26b0e4-8683-4386-9d88-84d7d914f4a0",
          "type": "basic.output",
          "data": {
            "name": "byte_available",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": 1096,
            "y": 712
          }
        },
        {
          "id": "9bb254dc-f051-49a5-83bf-970a342fcd3d",
          "type": "basic.input",
          "data": {
            "name": "reset",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ],
            "clock": false
          },
          "position": {
            "x": 80,
            "y": 784
          }
        },
        {
          "id": "1a353482-939c-49fc-bd2f-0aca9eb93485",
          "type": "basic.output",
          "data": {
            "name": "ready_for_next_byte",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": 1112,
            "y": 824
          }
        },
        {
          "id": "b35f2ca0-96bd-4379-9270-ea46a1f0f58c",
          "type": "basic.input",
          "data": {
            "name": "address",
            "virtual": true,
            "range": "[31:0]",
            "pins": [
              {
                "index": "31",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "30",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "29",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "28",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "27",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "26",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "25",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "24",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "23",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "22",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "21",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "20",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "19",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "18",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "17",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "16",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "15",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "14",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "13",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "12",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "11",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "10",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "9",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "8",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "7",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "6",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "5",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "4",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "3",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "2",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "1",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ],
            "clock": false
          },
          "position": {
            "x": 88,
            "y": 904
          }
        },
        {
          "id": "92369b9b-8d33-42c0-bcd4-5f53410c533c",
          "type": "basic.output",
          "data": {
            "name": "ready",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": 1096,
            "y": 928
          }
        },
        {
          "id": "bb27476c-abb7-4884-9cfa-5381e449cb52",
          "type": "basic.input",
          "data": {
            "name": "clk",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ],
            "clock": false
          },
          "position": {
            "x": 72,
            "y": 1032
          }
        },
        {
          "id": "fbff2319-ad71-4842-98dc-e321f6ab4da6",
          "type": "basic.output",
          "data": {
            "name": "status",
            "virtual": true,
            "range": "[4:0]",
            "pins": [
              {
                "index": "4",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "3",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "2",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "1",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": 1136,
            "y": 1040
          }
        },
        {
          "id": "e21b315d-1fa2-4e02-b228-25beecac592e",
          "type": "basic.code",
          "data": {
            "ports": {
              "in": [
                {
                  "name": "miso"
                },
                {
                  "name": "rd"
                },
                {
                  "name": "wr"
                },
                {
                  "name": "din",
                  "range": "[7:0]",
                  "size": 8
                },
                {
                  "name": "reset"
                },
                {
                  "name": "address",
                  "range": "[31:0]",
                  "size": 32
                },
                {
                  "name": "clk"
                }
              ],
              "out": [
                {
                  "name": "cs"
                },
                {
                  "name": "mosi"
                },
                {
                  "name": "sclk"
                },
                {
                  "name": "dout",
                  "range": "[7:0]",
                  "size": 8
                },
                {
                  "name": "byte_available"
                },
                {
                  "name": "ready_for_next_byte"
                },
                {
                  "name": "ready"
                },
                {
                  "name": "status",
                  "range": "[4:0]",
                  "size": 5
                }
              ]
            },
            "params": [],
            "code": "/* SD Card controller module. Allows reading from and writing to a microSD card\nthrough SPI mode.\ntaken from: https://web.mit.edu/6.111/volume2/www/f2019/tools/sd_controller.v\n */\n\nreg cs; // Connect to SD_DAT[3].\nreg [7:0] dout; // Data output for READ operation. [0-7]\nreg byte_available; // A new byte has been presented on [dout].\nreg ready_for_next_byte; // A new byte should be presented on [din].\n\n\n    parameter RST = 0;\n    parameter INIT = 1;\n    parameter CMD0 = 2;\n    parameter CMD55 = 3;\n    parameter CMD41 = 4;\n    parameter POLL_CMD = 5;\n    \n    parameter IDLE = 6;\n    parameter READ_BLOCK = 7;\n    parameter READ_BLOCK_WAIT = 8;\n    parameter READ_BLOCK_DATA = 9;\n    parameter READ_BLOCK_CRC = 10;\n    parameter SEND_CMD = 11;\n    parameter RECEIVE_BYTE_WAIT = 12;\n    parameter RECEIVE_BYTE = 13;\n    parameter WRITE_BLOCK_CMD = 14;\n    parameter WRITE_BLOCK_INIT = 15;\n    parameter WRITE_BLOCK_DATA = 16;\n    parameter WRITE_BLOCK_BYTE = 17;\n    parameter WRITE_BLOCK_WAIT = 18;\n    \n    parameter WRITE_DATA_SIZE = 515;\n    \n    reg [4:0] state = RST;\n    assign status = state;\n    reg [4:0] return_state;\n    reg sclk_sig = 0;\n    reg [55:0] cmd_out;\n    reg [7:0] recv_data;\n    reg cmd_mode = 1;\n    reg [7:0] data_sig = 8'hFF;\n    \n    reg [9:0] byte_counter;\n    reg [9:0] bit_counter;\n    \n    reg [26:0] boot_counter = 27'd100_000_000;\n    always @(posedge clk) begin\n        if(reset == 1) begin\n            state <= RST;\n            sclk_sig <= 0;\n            boot_counter <= 27'd100_000_000;\n        end\n        else begin\n            case(state)\n                RST: begin\n                    if(boot_counter == 0) begin\n                        sclk_sig <= 0;\n                        cmd_out <= {56{1'b1}};\n                        byte_counter <= 0;\n                        byte_available <= 0;\n                        ready_for_next_byte <= 0;\n                        cmd_mode <= 1;\n                        bit_counter <= 160;\n                        cs <= 1;\n                        state <= INIT;\n                    end\n                    else begin\n                        boot_counter <= boot_counter - 1;\n                    end\n                end\n                INIT: begin\n                    if(bit_counter == 0) begin\n                        cs <= 0;\n                        state <= CMD0;\n                    end\n                    else begin\n                        bit_counter <= bit_counter - 1;\n                        sclk_sig <= ~sclk_sig;\n                    end\n                end\n                CMD0: begin\n                    cmd_out <= 56'hFF_40_00_00_00_00_95;\n                    bit_counter <= 55;\n                    return_state <= CMD55;\n                    state <= SEND_CMD;\n                end\n                CMD55: begin\n                    cmd_out <= 56'hFF_77_00_00_00_00_01;\n                    bit_counter <= 55;\n                    return_state <= CMD41;\n                    state <= SEND_CMD;\n                end\n                CMD41: begin\n                    cmd_out <= 56'hFF_69_00_00_00_00_01;\n                    bit_counter <= 55;\n                    return_state <= POLL_CMD;\n                    state <= SEND_CMD;\n                end\n                POLL_CMD: begin\n                    if(recv_data[0] == 0) begin\n                        state <= IDLE;\n                    end\n                    else begin\n                        state <= CMD55;\n                    end\n                end\n                IDLE: begin\n                    if(rd == 1) begin\n                        state <= READ_BLOCK;\n                    end\n                    else if(wr == 1) begin\n                        state <= WRITE_BLOCK_CMD;\n                    end\n                    else begin\n                        state <= IDLE;\n                    end\n                end\n                READ_BLOCK: begin\n                    cmd_out <= {16'hFF_51, address, 8'hFF};\n                    bit_counter <= 55;\n                    return_state <= READ_BLOCK_WAIT;\n                    state <= SEND_CMD;\n                end\n                READ_BLOCK_WAIT: begin\n                    if(sclk_sig == 1 && miso == 0) begin\n                        byte_counter <= 511;\n                        bit_counter <= 7;\n                        return_state <= READ_BLOCK_DATA;\n                        state <= RECEIVE_BYTE;\n                    end\n                    sclk_sig <= ~sclk_sig;\n                end\n                READ_BLOCK_DATA: begin\n                    dout <= recv_data;\n                    byte_available <= 1;\n                    if (byte_counter == 0) begin\n                        bit_counter <= 7;\n                        return_state <= READ_BLOCK_CRC;\n                        state <= RECEIVE_BYTE;\n                    end\n                    else begin\n                        byte_counter <= byte_counter - 1;\n                        return_state <= READ_BLOCK_DATA;\n                        bit_counter <= 7;\n                        state <= RECEIVE_BYTE;\n                    end\n                end\n                READ_BLOCK_CRC: begin\n                    bit_counter <= 7;\n                    return_state <= IDLE;\n                    state <= RECEIVE_BYTE;\n                end\n                SEND_CMD: begin\n                    if (sclk_sig == 1) begin\n                        if (bit_counter == 0) begin\n                            state <= RECEIVE_BYTE_WAIT;\n                        end\n                        else begin\n                            bit_counter <= bit_counter - 1;\n                            cmd_out <= {cmd_out[54:0], 1'b1};\n                        end\n                    end\n                    sclk_sig <= ~sclk_sig;\n                end\n                RECEIVE_BYTE_WAIT: begin\n                    if (sclk_sig == 1) begin\n                        if (miso == 0) begin\n                            recv_data <= 0;\n                            bit_counter <= 6;\n                            state <= RECEIVE_BYTE;\n                        end\n                    end\n                    sclk_sig <= ~sclk_sig;\n                end\n                RECEIVE_BYTE: begin\n                    byte_available <= 0;\n                    if (sclk_sig == 1) begin\n                        recv_data <= {recv_data[6:0], miso};\n                        if (bit_counter == 0) begin\n                            state <= return_state;\n                        end\n                        else begin\n                            bit_counter <= bit_counter - 1;\n                        end\n                    end\n                    sclk_sig <= ~sclk_sig;\n                end\n                WRITE_BLOCK_CMD: begin\n                    cmd_out <= {16'hFF_58, address, 8'hFF};\n                    bit_counter <= 55;\n                    return_state <= WRITE_BLOCK_INIT;\n                    state <= SEND_CMD;\n\t\t    ready_for_next_byte <= 1;\n                end\n                WRITE_BLOCK_INIT: begin\n                    cmd_mode <= 0;\n                    byte_counter <= WRITE_DATA_SIZE; \n                    state <= WRITE_BLOCK_DATA;\n                    ready_for_next_byte <= 0;\n                end\n                WRITE_BLOCK_DATA: begin\n                    if (byte_counter == 0) begin\n                        state <= RECEIVE_BYTE_WAIT;\n                        return_state <= WRITE_BLOCK_WAIT;\n                    end\n                    else begin\n                        if ((byte_counter == 2) || (byte_counter == 1)) begin\n                            data_sig <= 8'hFF;\n                        end\n                        else if (byte_counter == WRITE_DATA_SIZE) begin\n                            data_sig <= 8'hFE;\n                        end\n                        else begin\n                            data_sig <= din;\n                            ready_for_next_byte <= 1;\n                        end\n                        bit_counter <= 7;\n                        state <= WRITE_BLOCK_BYTE;\n                        byte_counter <= byte_counter - 1;\n                    end\n                end\n                WRITE_BLOCK_BYTE: begin\n                    if (sclk_sig == 1) begin\n                        if (bit_counter == 0) begin\n                            state <= WRITE_BLOCK_DATA;\n                            ready_for_next_byte <= 0;\n                        end\n                        else begin\n                            data_sig <= {data_sig[6:0], 1'b1};\n                            bit_counter <= bit_counter - 1;\n                        end;\n                    end;\n                    sclk_sig <= ~sclk_sig;\n                end\n                WRITE_BLOCK_WAIT: begin\n                    if (sclk_sig == 1) begin\n                        if (miso == 1) begin\n                            state <= IDLE;\n                            cmd_mode <= 1;\n                        end\n                    end\n                    sclk_sig = ~sclk_sig;\n                end\n            endcase\n        end\n    end\n\n    assign sclk = sclk_sig;\n    assign mosi = cmd_mode ? cmd_out[55] : data_sig[7];\n    assign ready = (state == IDLE);"
          },
          "position": {
            "x": 312,
            "y": 248
          },
          "size": {
            "width": 720,
            "height": 880
          }
        }
      ],
      "wires": [
        {
          "source": {
            "block": "bb27476c-abb7-4884-9cfa-5381e449cb52",
            "port": "out"
          },
          "target": {
            "block": "e21b315d-1fa2-4e02-b228-25beecac592e",
            "port": "clk"
          }
        },
        {
          "source": {
            "block": "b35f2ca0-96bd-4379-9270-ea46a1f0f58c",
            "port": "out"
          },
          "target": {
            "block": "e21b315d-1fa2-4e02-b228-25beecac592e",
            "port": "address"
          },
          "size": 32
        },
        {
          "source": {
            "block": "9bb254dc-f051-49a5-83bf-970a342fcd3d",
            "port": "out"
          },
          "target": {
            "block": "e21b315d-1fa2-4e02-b228-25beecac592e",
            "port": "reset"
          }
        },
        {
          "source": {
            "block": "0810b100-edf9-4299-bc57-bd79008f75ff",
            "port": "out"
          },
          "target": {
            "block": "e21b315d-1fa2-4e02-b228-25beecac592e",
            "port": "din"
          },
          "size": 8
        },
        {
          "source": {
            "block": "8fcccb9b-b215-4058-af9d-c720f3d4719c",
            "port": "out"
          },
          "target": {
            "block": "e21b315d-1fa2-4e02-b228-25beecac592e",
            "port": "wr"
          }
        },
        {
          "source": {
            "block": "45d136b4-6412-43d8-90ab-955a596aaf02",
            "port": "out"
          },
          "target": {
            "block": "e21b315d-1fa2-4e02-b228-25beecac592e",
            "port": "rd"
          }
        },
        {
          "source": {
            "block": "23b86167-3a0d-4b51-9d45-ca62ab6ac1a0",
            "port": "out"
          },
          "target": {
            "block": "e21b315d-1fa2-4e02-b228-25beecac592e",
            "port": "miso"
          }
        },
        {
          "source": {
            "block": "e21b315d-1fa2-4e02-b228-25beecac592e",
            "port": "cs"
          },
          "target": {
            "block": "650885e3-b045-4075-aa54-a54a42daf0b1",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "e21b315d-1fa2-4e02-b228-25beecac592e",
            "port": "mosi"
          },
          "target": {
            "block": "5caeb442-d040-49d1-bc4e-aeaa38d1bee2",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "e21b315d-1fa2-4e02-b228-25beecac592e",
            "port": "sclk"
          },
          "target": {
            "block": "ecb52961-de12-4f83-a3ab-143af0b4fcf3",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "e21b315d-1fa2-4e02-b228-25beecac592e",
            "port": "dout"
          },
          "target": {
            "block": "e0cf6e2f-e29b-4618-85ca-8a19eaccfa9f",
            "port": "in"
          },
          "size": 8
        },
        {
          "source": {
            "block": "e21b315d-1fa2-4e02-b228-25beecac592e",
            "port": "byte_available"
          },
          "target": {
            "block": "cb26b0e4-8683-4386-9d88-84d7d914f4a0",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "e21b315d-1fa2-4e02-b228-25beecac592e",
            "port": "ready_for_next_byte"
          },
          "target": {
            "block": "1a353482-939c-49fc-bd2f-0aca9eb93485",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "e21b315d-1fa2-4e02-b228-25beecac592e",
            "port": "ready"
          },
          "target": {
            "block": "92369b9b-8d33-42c0-bcd4-5f53410c533c",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "e21b315d-1fa2-4e02-b228-25beecac592e",
            "port": "status"
          },
          "target": {
            "block": "fbff2319-ad71-4842-98dc-e321f6ab4da6",
            "port": "in"
          },
          "size": 5
        }
      ]
    }
  },
  "dependencies": {}
}