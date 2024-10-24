{
  "version": "1.2",
  "package": {
    "name": "TopModul",
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
          "id": "e39c8f1f-beee-4cd5-ab96-6b4f5e57ba09",
          "type": "basic.input",
          "data": {
            "name": "clk_25mhz",
            "virtual": false,
            "pins": [
              {
                "index": "0",
                "name": "clk",
                "value": "G2"
              }
            ],
            "clock": false
          },
          "position": {
            "x": -592,
            "y": 232
          }
        },
        {
          "id": "9bdc82e5-240c-42f5-b3c7-83fd792743d8",
          "type": "basic.output",
          "data": {
            "name": "gpdi_dp",
            "virtual": false,
            "range": "[3:0]",
            "pins": [
              {
                "index": "3",
                "name": "gpdi_dp0",
                "value": "A16"
              },
              {
                "index": "2",
                "name": "gpdi_dp1",
                "value": "A14"
              },
              {
                "index": "1",
                "name": "gpdi_dp2",
                "value": "A12"
              },
              {
                "index": "0",
                "name": "gpdi_dp3",
                "value": "A17"
              }
            ]
          },
          "position": {
            "x": 1608,
            "y": 312
          }
        },
        {
          "id": "391b0387-8a29-49b3-bdd4-aeb958ac092c",
          "type": "basic.input",
          "data": {
            "name": "reset",
            "virtual": false,
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
            "x": -632,
            "y": 528
          }
        },
        {
          "id": "11aaa571-fde6-4c16-981f-44e3266e8d19",
          "type": "basic.input",
          "data": {
            "name": "sd_d",
            "virtual": false,
            "pins": [
              {
                "index": "0",
                "name": "sd_d0",
                "value": "J3"
              }
            ],
            "clock": false
          },
          "position": {
            "x": -640,
            "y": 680
          }
        },
        {
          "id": "b77552f5-12b0-4dd0-81bc-c9fe809ded7c",
          "type": "basic.output",
          "data": {
            "name": "sd_cmd",
            "virtual": false,
            "pins": [
              {
                "index": "0",
                "name": "sd_cmd",
                "value": "J1"
              }
            ]
          },
          "position": {
            "x": 1576,
            "y": 808
          }
        },
        {
          "id": "68897741-4fc7-4d37-ab10-e42bc22149f8",
          "type": "basic.output",
          "data": {
            "name": "sd_clk",
            "virtual": false,
            "pins": [
              {
                "index": "0",
                "name": "sd_clk",
                "value": "H2"
              }
            ]
          },
          "position": {
            "x": 1496,
            "y": 960
          }
        },
        {
          "id": "1bffb8f0-003c-4edf-8092-f54d13fad3aa",
          "type": "basic.output",
          "data": {
            "name": "sd_d",
            "virtual": false,
            "range": "[2:0]",
            "pins": [
              {
                "index": "2",
                "name": "sd_d1",
                "value": "H1"
              },
              {
                "index": "1",
                "name": "sd_d2",
                "value": "K1"
              },
              {
                "index": "0",
                "name": "sd_d3",
                "value": "K2"
              }
            ]
          },
          "position": {
            "x": 1496,
            "y": 1040
          }
        },
        {
          "id": "1283a9b3-51a2-4524-813c-277f092f9e76",
          "type": "6dd3642b688588e5816855b80fcdbfb94b02f7cd",
          "position": {
            "x": -104,
            "y": -120
          },
          "size": {
            "width": 96,
            "height": 224
          }
        },
        {
          "id": "f2b30bb0-a227-457f-9128-37f25a8e9cc0",
          "type": "01f8f2c1fde6577d48cde920614264880126d824",
          "position": {
            "x": 0,
            "y": 536
          },
          "size": {
            "width": 96,
            "height": 256
          }
        },
        {
          "id": "c86e5323-dd97-48db-a770-88bd37e3b7b3",
          "type": "061b6edb3e4d1e61ee050a4224b6905e2244e81f",
          "position": {
            "x": 1144,
            "y": -376
          },
          "size": {
            "width": 96,
            "height": 160
          }
        },
        {
          "id": "8c26d938-fbef-4fa6-8836-9dd271397f38",
          "type": "4d6afb1baefb6483d995731210cbaef0ac0611f7",
          "position": {
            "x": -440,
            "y": 200
          },
          "size": {
            "width": 96,
            "height": 128
          }
        },
        {
          "id": "22fafdda-5f09-47b7-9405-b0152e5b525b",
          "type": "bf62ac3a58701db2485f608b61f6478e64a75825",
          "position": {
            "x": 640,
            "y": 744
          },
          "size": {
            "width": 96,
            "height": 160
          }
        },
        {
          "id": "6a5000fe-e784-4016-9ba7-7314718b1b0c",
          "type": "bf62ac3a58701db2485f608b61f6478e64a75825",
          "position": {
            "x": 720,
            "y": 424
          },
          "size": {
            "width": 96,
            "height": 160
          }
        },
        {
          "id": "9aac8ef8-22cf-4c0f-88db-49b9e322709a",
          "type": "2242e9a7e06238ebde879aa159340ce4673f5e54",
          "position": {
            "x": 1376,
            "y": 328
          },
          "size": {
            "width": 96,
            "height": 128
          }
        },
        {
          "id": "ca95e7f0-d188-4ee6-b260-02a017c47270",
          "type": "febcfed8636b8ee9a98750b96ed9e53a165dd4a8",
          "position": {
            "x": -392,
            "y": -32
          },
          "size": {
            "width": 96,
            "height": 64
          }
        },
        {
          "id": "103a704d-ab08-470a-b3b4-4fddd0e483c1",
          "type": "873425949b2a80f1a7f66f320796bcd068a59889",
          "position": {
            "x": 264,
            "y": -696
          },
          "size": {
            "width": 96,
            "height": 64
          }
        },
        {
          "id": "4086489a-7985-451f-9f2e-74450b600a7d",
          "type": "0a3829887879c9ec2512930d44b0e91e93f99aa3",
          "position": {
            "x": 224,
            "y": -120
          },
          "size": {
            "width": 96,
            "height": 96
          }
        },
        {
          "id": "1e39d59c-df43-416c-91f7-e1cd6d8144a8",
          "type": "869226df2dcc89387737d5ee549d56fe3cb334a4",
          "position": {
            "x": 392,
            "y": -240
          },
          "size": {
            "width": 96,
            "height": 160
          }
        },
        {
          "id": "82f07849-bbad-46d0-a21e-c7bf86c047dd",
          "type": "ba518ee261a2be13a9739cd3a01cdcebe0ef63c0",
          "position": {
            "x": 568,
            "y": -696
          },
          "size": {
            "width": 96,
            "height": 64
          }
        },
        {
          "id": "8899b7be-a47f-41f8-90cd-7964528cd6af",
          "type": "ba518ee261a2be13a9739cd3a01cdcebe0ef63c0",
          "position": {
            "x": 536,
            "y": -504
          },
          "size": {
            "width": 96,
            "height": 64
          }
        },
        {
          "id": "7a045180-91fd-4b6f-a4f7-b0a005daf685",
          "type": "468a0568931bf0e98f0069778cf0f1b58849922a",
          "position": {
            "x": 392,
            "y": 440
          },
          "size": {
            "width": 96,
            "height": 128
          }
        },
        {
          "id": "3f6d4fdf-ad23-40fa-be38-9a158bad2812",
          "type": "468a0568931bf0e98f0069778cf0f1b58849922a",
          "position": {
            "x": 408,
            "y": 656
          },
          "size": {
            "width": 96,
            "height": 128
          }
        },
        {
          "id": "65ce1a31-68a4-4e88-8dca-28cf2e200e0e",
          "type": "93126406b5693ec7613b2330def84048b59b4816",
          "position": {
            "x": 1064,
            "y": 336
          },
          "size": {
            "width": 96,
            "height": 96
          }
        },
        {
          "id": "59decd0b-30eb-43f2-9465-554b749883ce",
          "type": "93126406b5693ec7613b2330def84048b59b4816",
          "position": {
            "x": 1064,
            "y": 448
          },
          "size": {
            "width": 96,
            "height": 96
          }
        },
        {
          "id": "64d03bcb-d352-47f2-a73f-5b00d61e61c7",
          "type": "93126406b5693ec7613b2330def84048b59b4816",
          "position": {
            "x": 1064,
            "y": 568
          },
          "size": {
            "width": 96,
            "height": 96
          }
        },
        {
          "id": "71b372aa-cafc-42dd-b107-0c44e806048a",
          "type": "c08fe76a6c29817d0ffc53cf3da575a99ea85fbd",
          "position": {
            "x": 864,
            "y": 8
          },
          "size": {
            "width": 96,
            "height": 64
          }
        },
        {
          "id": "c08482a3-0a04-4daa-926b-423427124e13",
          "type": "8f83ac156e4ebfce6389d8e2466ea3caf3cd26b9",
          "position": {
            "x": 616,
            "y": -400
          },
          "size": {
            "width": 96,
            "height": 96
          }
        },
        {
          "id": "6680c207-dc19-4853-b109-8b3527cc3645",
          "type": "c8c790949fbd0bc2ef709c514d0561d7f65fe6e8",
          "position": {
            "x": 888,
            "y": -448
          },
          "size": {
            "width": 96,
            "height": 96
          }
        },
        {
          "id": "4c37744e-1831-48c0-977c-6b55cc31f85c",
          "type": "c8c790949fbd0bc2ef709c514d0561d7f65fe6e8",
          "position": {
            "x": 896,
            "y": -296
          },
          "size": {
            "width": 96,
            "height": 96
          }
        }
      ],
      "wires": [
        {
          "source": {
            "block": "391b0387-8a29-49b3-bdd4-aeb958ac092c",
            "port": "out"
          },
          "target": {
            "block": "f2b30bb0-a227-457f-9128-37f25a8e9cc0",
            "port": "ee6f7fb6-9ed5-41c3-ba4f-5377420e9069"
          }
        },
        {
          "source": {
            "block": "e39c8f1f-beee-4cd5-ab96-6b4f5e57ba09",
            "port": "out"
          },
          "target": {
            "block": "8c26d938-fbef-4fa6-8836-9dd271397f38",
            "port": "9587c369-a387-45b2-b343-3801e918a059"
          }
        },
        {
          "source": {
            "block": "8c26d938-fbef-4fa6-8836-9dd271397f38",
            "port": "90fcd0b6-4267-458d-b976-3bc58f82c3fb"
          },
          "target": {
            "block": "c86e5323-dd97-48db-a770-88bd37e3b7b3",
            "port": "4c5cef1b-6a89-44c3-a27f-765302415d9c"
          },
          "vertices": []
        },
        {
          "source": {
            "block": "8c26d938-fbef-4fa6-8836-9dd271397f38",
            "port": "90fcd0b6-4267-458d-b976-3bc58f82c3fb"
          },
          "target": {
            "block": "6a5000fe-e784-4016-9ba7-7314718b1b0c",
            "port": "a5d312e9-8a9e-4a98-82dc-d7162cf43f89"
          }
        },
        {
          "source": {
            "block": "8c26d938-fbef-4fa6-8836-9dd271397f38",
            "port": "e128ad5d-bf5d-480d-920f-c76d28075181"
          },
          "target": {
            "block": "9aac8ef8-22cf-4c0f-88db-49b9e322709a",
            "port": "8a9606d8-fc3a-4842-aa6b-c60f03853d0c"
          }
        },
        {
          "source": {
            "block": "c86e5323-dd97-48db-a770-88bd37e3b7b3",
            "port": "b63b3c8b-7212-4d6b-8509-b3f0e03c91a5"
          },
          "target": {
            "block": "1283a9b3-51a2-4524-813c-277f092f9e76",
            "port": "f58bbf14-1a59-4ab5-b089-adc50d20fbca"
          },
          "vertices": [
            {
              "x": 1056,
              "y": -608
            }
          ],
          "size": 32
        },
        {
          "source": {
            "block": "c86e5323-dd97-48db-a770-88bd37e3b7b3",
            "port": "b63b3c8b-7212-4d6b-8509-b3f0e03c91a5"
          },
          "target": {
            "block": "1283a9b3-51a2-4524-813c-277f092f9e76",
            "port": "6e1ba584-c79b-4406-af86-e3b5d1a120d7"
          },
          "vertices": [
            {
              "x": 1232,
              "y": -608
            }
          ],
          "size": 32
        },
        {
          "source": {
            "block": "ca95e7f0-d188-4ee6-b260-02a017c47270",
            "port": "3d584b0a-29eb-47af-8c43-c0822282ef05"
          },
          "target": {
            "block": "1283a9b3-51a2-4524-813c-277f092f9e76",
            "port": "edefb09b-c29e-4a69-b85f-a2f4fbc72210"
          }
        },
        {
          "source": {
            "block": "ca95e7f0-d188-4ee6-b260-02a017c47270",
            "port": "3d584b0a-29eb-47af-8c43-c0822282ef05"
          },
          "target": {
            "block": "1283a9b3-51a2-4524-813c-277f092f9e76",
            "port": "4e26d5a2-2872-4cc7-9bab-669e80d69aaa"
          }
        },
        {
          "source": {
            "block": "ca95e7f0-d188-4ee6-b260-02a017c47270",
            "port": "3d584b0a-29eb-47af-8c43-c0822282ef05"
          },
          "target": {
            "block": "1283a9b3-51a2-4524-813c-277f092f9e76",
            "port": "401121b3-49d8-4643-92be-ae050ce654e6"
          }
        },
        {
          "source": {
            "block": "1283a9b3-51a2-4524-813c-277f092f9e76",
            "port": "89259631-8cbe-496f-b598-578ddca5dda0"
          },
          "target": {
            "block": "103a704d-ab08-470a-b3b4-4fddd0e483c1",
            "port": "18c2ebc7-5152-439c-9b3f-851c59bac834"
          }
        },
        {
          "source": {
            "block": "1283a9b3-51a2-4524-813c-277f092f9e76",
            "port": "76f311bf-1e0c-4bcf-8f5f-1f0477d32577"
          },
          "target": {
            "block": "103a704d-ab08-470a-b3b4-4fddd0e483c1",
            "port": "97b51945-d716-4b6c-9db9-970d08541249"
          }
        },
        {
          "source": {
            "block": "1283a9b3-51a2-4524-813c-277f092f9e76",
            "port": "ff9dbe4c-e0ae-4070-8558-efcd79b0bb0c"
          },
          "target": {
            "block": "4086489a-7985-451f-9f2e-74450b600a7d",
            "port": "35be441c-33c2-4cc6-af21-cb3b24da4e58"
          },
          "size": 26
        },
        {
          "source": {
            "block": "1283a9b3-51a2-4524-813c-277f092f9e76",
            "port": "2401dc10-920b-42dc-bc81-444fe50e83e7"
          },
          "target": {
            "block": "4086489a-7985-451f-9f2e-74450b600a7d",
            "port": "f6616a0f-1abf-411a-bdd0-4956655ddf4b"
          },
          "size": 32
        },
        {
          "source": {
            "block": "1283a9b3-51a2-4524-813c-277f092f9e76",
            "port": "192aecbd-966b-4285-81f4-2ead68dd3815"
          },
          "target": {
            "block": "4086489a-7985-451f-9f2e-74450b600a7d",
            "port": "8177371e-8059-44a3-b01c-975ae8b6aae9"
          }
        },
        {
          "source": {
            "block": "8c26d938-fbef-4fa6-8836-9dd271397f38",
            "port": "90fcd0b6-4267-458d-b976-3bc58f82c3fb"
          },
          "target": {
            "block": "f2b30bb0-a227-457f-9128-37f25a8e9cc0",
            "port": "e85fe67c-e3f9-4346-8ad3-3031acc0ec82"
          },
          "vertices": [
            {
              "x": -184,
              "y": 664
            }
          ]
        },
        {
          "source": {
            "block": "9aac8ef8-22cf-4c0f-88db-49b9e322709a",
            "port": "642804dd-2c55-4fd5-a21b-3be648642513"
          },
          "target": {
            "block": "9bdc82e5-240c-42f5-b3c7-83fd792743d8",
            "port": "in"
          },
          "size": 4
        },
        {
          "source": {
            "block": "391b0387-8a29-49b3-bdd4-aeb958ac092c",
            "port": "out"
          },
          "target": {
            "block": "1283a9b3-51a2-4524-813c-277f092f9e76",
            "port": "c58f9db8-dc00-43ff-ac6b-3669cb7357e5"
          }
        },
        {
          "source": {
            "block": "103a704d-ab08-470a-b3b4-4fddd0e483c1",
            "port": "664caf9e-5f40-4df4-800a-b626af702e62"
          },
          "target": {
            "block": "82f07849-bbad-46d0-a21e-c7bf86c047dd",
            "port": "18c2ebc7-5152-439c-9b3f-851c59bac834"
          }
        },
        {
          "source": {
            "block": "82f07849-bbad-46d0-a21e-c7bf86c047dd",
            "port": "664caf9e-5f40-4df4-800a-b626af702e62"
          },
          "target": {
            "block": "c86e5323-dd97-48db-a770-88bd37e3b7b3",
            "port": "1e9a6507-3298-4599-99f5-5b2fdd8734f3"
          }
        },
        {
          "source": {
            "block": "4086489a-7985-451f-9f2e-74450b600a7d",
            "port": "3c8913e5-5a81-4a5c-acbd-04b16f3c180d"
          },
          "target": {
            "block": "1e39d59c-df43-416c-91f7-e1cd6d8144a8",
            "port": "118cd74a-87b9-45ac-9a56-3f5a1561b047"
          },
          "size": 32
        },
        {
          "source": {
            "block": "1e39d59c-df43-416c-91f7-e1cd6d8144a8",
            "port": "28874c32-d349-43ad-911d-a90cc1000ca9"
          },
          "target": {
            "block": "82f07849-bbad-46d0-a21e-c7bf86c047dd",
            "port": "97b51945-d716-4b6c-9db9-970d08541249"
          }
        },
        {
          "source": {
            "block": "1283a9b3-51a2-4524-813c-277f092f9e76",
            "port": "192aecbd-966b-4285-81f4-2ead68dd3815"
          },
          "target": {
            "block": "8899b7be-a47f-41f8-90cd-7964528cd6af",
            "port": "18c2ebc7-5152-439c-9b3f-851c59bac834"
          }
        },
        {
          "source": {
            "block": "1e39d59c-df43-416c-91f7-e1cd6d8144a8",
            "port": "28874c32-d349-43ad-911d-a90cc1000ca9"
          },
          "target": {
            "block": "8899b7be-a47f-41f8-90cd-7964528cd6af",
            "port": "97b51945-d716-4b6c-9db9-970d08541249"
          }
        },
        {
          "source": {
            "block": "8899b7be-a47f-41f8-90cd-7964528cd6af",
            "port": "664caf9e-5f40-4df4-800a-b626af702e62"
          },
          "target": {
            "block": "c86e5323-dd97-48db-a770-88bd37e3b7b3",
            "port": "ae1fb74e-5800-404c-bc83-98a5460af38b"
          }
        },
        {
          "source": {
            "block": "1e39d59c-df43-416c-91f7-e1cd6d8144a8",
            "port": "cb961297-252b-4eb8-b64f-bb3d83b00f2d"
          },
          "target": {
            "block": "6a5000fe-e784-4016-9ba7-7314718b1b0c",
            "port": "153911c5-0dd5-4a8d-ba3b-f234499a33ba"
          }
        },
        {
          "source": {
            "block": "1e39d59c-df43-416c-91f7-e1cd6d8144a8",
            "port": "0472be73-fd4a-4727-9810-a575afbe13f9"
          },
          "target": {
            "block": "22fafdda-5f09-47b7-9405-b0152e5b525b",
            "port": "153911c5-0dd5-4a8d-ba3b-f234499a33ba"
          },
          "vertices": []
        },
        {
          "source": {
            "block": "8c26d938-fbef-4fa6-8836-9dd271397f38",
            "port": "90fcd0b6-4267-458d-b976-3bc58f82c3fb"
          },
          "target": {
            "block": "22fafdda-5f09-47b7-9405-b0152e5b525b",
            "port": "a5d312e9-8a9e-4a98-82dc-d7162cf43f89"
          }
        },
        {
          "source": {
            "block": "8c26d938-fbef-4fa6-8836-9dd271397f38",
            "port": "90fcd0b6-4267-458d-b976-3bc58f82c3fb"
          },
          "target": {
            "block": "1283a9b3-51a2-4524-813c-277f092f9e76",
            "port": "768309c3-31a1-46f2-8036-2d878503ed03"
          }
        },
        {
          "source": {
            "block": "7a045180-91fd-4b6f-a4f7-b0a005daf685",
            "port": "bbc72c72-9eec-46c2-aeff-4233b746b9c2"
          },
          "target": {
            "block": "6a5000fe-e784-4016-9ba7-7314718b1b0c",
            "port": "14f4884a-7b29-42cd-9968-3711902de5ef"
          },
          "size": 8
        },
        {
          "source": {
            "block": "7a045180-91fd-4b6f-a4f7-b0a005daf685",
            "port": "bbc72c72-9eec-46c2-aeff-4233b746b9c2"
          },
          "target": {
            "block": "22fafdda-5f09-47b7-9405-b0152e5b525b",
            "port": "14f4884a-7b29-42cd-9968-3711902de5ef"
          },
          "size": 8
        },
        {
          "source": {
            "block": "7a045180-91fd-4b6f-a4f7-b0a005daf685",
            "port": "ab69e2b6-41cb-4145-883c-ff7d66e29c69"
          },
          "target": {
            "block": "6a5000fe-e784-4016-9ba7-7314718b1b0c",
            "port": "6e6bd2ed-aaa0-4bdc-89b9-0b1457b0df48"
          },
          "size": 8
        },
        {
          "source": {
            "block": "7a045180-91fd-4b6f-a4f7-b0a005daf685",
            "port": "ab69e2b6-41cb-4145-883c-ff7d66e29c69"
          },
          "target": {
            "block": "22fafdda-5f09-47b7-9405-b0152e5b525b",
            "port": "6e6bd2ed-aaa0-4bdc-89b9-0b1457b0df48"
          },
          "size": 8
        },
        {
          "source": {
            "block": "3f6d4fdf-ad23-40fa-be38-9a158bad2812",
            "port": "bbc72c72-9eec-46c2-aeff-4233b746b9c2"
          },
          "target": {
            "block": "6a5000fe-e784-4016-9ba7-7314718b1b0c",
            "port": "c676f355-af1e-4a85-8ba8-e2727d1720ff"
          },
          "size": 8
        },
        {
          "source": {
            "block": "3f6d4fdf-ad23-40fa-be38-9a158bad2812",
            "port": "bbc72c72-9eec-46c2-aeff-4233b746b9c2"
          },
          "target": {
            "block": "22fafdda-5f09-47b7-9405-b0152e5b525b",
            "port": "c676f355-af1e-4a85-8ba8-e2727d1720ff"
          },
          "size": 8
        },
        {
          "source": {
            "block": "1283a9b3-51a2-4524-813c-277f092f9e76",
            "port": "2401dc10-920b-42dc-bc81-444fe50e83e7"
          },
          "target": {
            "block": "7a045180-91fd-4b6f-a4f7-b0a005daf685",
            "port": "5204a9f1-594b-4216-b993-03b46bef9e6e"
          },
          "size": 32
        },
        {
          "source": {
            "block": "1283a9b3-51a2-4524-813c-277f092f9e76",
            "port": "c7f78996-1d60-4939-84f3-2721dc9559f6"
          },
          "target": {
            "block": "3f6d4fdf-ad23-40fa-be38-9a158bad2812",
            "port": "5204a9f1-594b-4216-b993-03b46bef9e6e"
          },
          "size": 32
        },
        {
          "source": {
            "block": "6a5000fe-e784-4016-9ba7-7314718b1b0c",
            "port": "ecda3b69-2a1e-4c30-860d-fbf7956c6a92"
          },
          "target": {
            "block": "65ce1a31-68a4-4e88-8dca-28cf2e200e0e",
            "port": "bc9bb106-79cc-4820-b5e7-5a0d6d84a7d8"
          },
          "size": 8
        },
        {
          "source": {
            "block": "6a5000fe-e784-4016-9ba7-7314718b1b0c",
            "port": "2ef723c1-f341-44db-b142-27e7eccead9a"
          },
          "target": {
            "block": "59decd0b-30eb-43f2-9465-554b749883ce",
            "port": "bc9bb106-79cc-4820-b5e7-5a0d6d84a7d8"
          },
          "size": 8
        },
        {
          "source": {
            "block": "6a5000fe-e784-4016-9ba7-7314718b1b0c",
            "port": "3e35f48e-ba9a-4c58-aff1-3fb682315bbb"
          },
          "target": {
            "block": "64d03bcb-d352-47f2-a73f-5b00d61e61c7",
            "port": "bc9bb106-79cc-4820-b5e7-5a0d6d84a7d8"
          },
          "size": 8
        },
        {
          "source": {
            "block": "22fafdda-5f09-47b7-9405-b0152e5b525b",
            "port": "ecda3b69-2a1e-4c30-860d-fbf7956c6a92"
          },
          "target": {
            "block": "65ce1a31-68a4-4e88-8dca-28cf2e200e0e",
            "port": "1de9cd2a-f78e-4b28-b04f-89dcd47e7fa9"
          },
          "size": 8
        },
        {
          "source": {
            "block": "22fafdda-5f09-47b7-9405-b0152e5b525b",
            "port": "2ef723c1-f341-44db-b142-27e7eccead9a"
          },
          "target": {
            "block": "59decd0b-30eb-43f2-9465-554b749883ce",
            "port": "1de9cd2a-f78e-4b28-b04f-89dcd47e7fa9"
          },
          "size": 8
        },
        {
          "source": {
            "block": "22fafdda-5f09-47b7-9405-b0152e5b525b",
            "port": "3e35f48e-ba9a-4c58-aff1-3fb682315bbb"
          },
          "target": {
            "block": "64d03bcb-d352-47f2-a73f-5b00d61e61c7",
            "port": "1de9cd2a-f78e-4b28-b04f-89dcd47e7fa9"
          },
          "size": 8
        },
        {
          "source": {
            "block": "65ce1a31-68a4-4e88-8dca-28cf2e200e0e",
            "port": "8a24aeef-481c-4ec8-b048-1072e72b1442"
          },
          "target": {
            "block": "9aac8ef8-22cf-4c0f-88db-49b9e322709a",
            "port": "e7c8938c-bdb2-4e25-bc3a-dcbd79dc4b79"
          },
          "size": 8
        },
        {
          "source": {
            "block": "59decd0b-30eb-43f2-9465-554b749883ce",
            "port": "8a24aeef-481c-4ec8-b048-1072e72b1442"
          },
          "target": {
            "block": "9aac8ef8-22cf-4c0f-88db-49b9e322709a",
            "port": "324806d5-bed3-48cf-820f-b87a8a6fec6f"
          },
          "size": 8
        },
        {
          "source": {
            "block": "64d03bcb-d352-47f2-a73f-5b00d61e61c7",
            "port": "8a24aeef-481c-4ec8-b048-1072e72b1442"
          },
          "target": {
            "block": "9aac8ef8-22cf-4c0f-88db-49b9e322709a",
            "port": "bea7ab17-8b8e-4f14-a18a-594e56ab1388"
          },
          "size": 8
        },
        {
          "source": {
            "block": "1e39d59c-df43-416c-91f7-e1cd6d8144a8",
            "port": "3390e433-dee2-4285-9829-32797df01bae"
          },
          "target": {
            "block": "71b372aa-cafc-42dd-b107-0c44e806048a",
            "port": "264d6977-d201-4485-816f-c3dfdaf95cc6"
          }
        },
        {
          "source": {
            "block": "71b372aa-cafc-42dd-b107-0c44e806048a",
            "port": "272b8b87-6a69-4649-8391-79c70e95365c"
          },
          "target": {
            "block": "65ce1a31-68a4-4e88-8dca-28cf2e200e0e",
            "port": "8177371e-8059-44a3-b01c-975ae8b6aae9"
          }
        },
        {
          "source": {
            "block": "71b372aa-cafc-42dd-b107-0c44e806048a",
            "port": "272b8b87-6a69-4649-8391-79c70e95365c"
          },
          "target": {
            "block": "59decd0b-30eb-43f2-9465-554b749883ce",
            "port": "8177371e-8059-44a3-b01c-975ae8b6aae9"
          }
        },
        {
          "source": {
            "block": "71b372aa-cafc-42dd-b107-0c44e806048a",
            "port": "272b8b87-6a69-4649-8391-79c70e95365c"
          },
          "target": {
            "block": "64d03bcb-d352-47f2-a73f-5b00d61e61c7",
            "port": "8177371e-8059-44a3-b01c-975ae8b6aae9"
          }
        },
        {
          "source": {
            "block": "c08482a3-0a04-4daa-926b-423427124e13",
            "port": "8c3c4314-f452-4c8b-a879-b49afaa5cba0"
          },
          "target": {
            "block": "f2b30bb0-a227-457f-9128-37f25a8e9cc0",
            "port": "63a4ce61-b607-40bd-86f2-e20a1b374caa"
          },
          "size": 32
        },
        {
          "source": {
            "block": "c08482a3-0a04-4daa-926b-423427124e13",
            "port": "42d5f71a-16fc-4a11-bd88-3f307deb86dc"
          },
          "target": {
            "block": "f2b30bb0-a227-457f-9128-37f25a8e9cc0",
            "port": "e0020276-1e65-47ef-9d93-ef139d794158"
          },
          "vertices": [
            {
              "x": 328,
              "y": 192
            }
          ]
        },
        {
          "source": {
            "block": "11aaa571-fde6-4c16-981f-44e3266e8d19",
            "port": "out"
          },
          "target": {
            "block": "f2b30bb0-a227-457f-9128-37f25a8e9cc0",
            "port": "217b056b-2046-47ed-adf5-1f29bd35093c"
          }
        },
        {
          "source": {
            "block": "f2b30bb0-a227-457f-9128-37f25a8e9cc0",
            "port": "2a16efdb-dbf0-4759-99a3-c4df7acdf174"
          },
          "target": {
            "block": "c08482a3-0a04-4daa-926b-423427124e13",
            "port": "8dc5caa2-bc69-41b4-b28a-8264c594a329"
          },
          "size": 32
        },
        {
          "source": {
            "block": "1283a9b3-51a2-4524-813c-277f092f9e76",
            "port": "c7f78996-1d60-4939-84f3-2721dc9559f6"
          },
          "target": {
            "block": "6680c207-dc19-4853-b109-8b3527cc3645",
            "port": "8415be3c-848e-47d5-a19d-ac6df0458e41"
          },
          "size": 32
        },
        {
          "source": {
            "block": "6680c207-dc19-4853-b109-8b3527cc3645",
            "port": "c17a46f6-0a86-4998-be4e-76d85b088d63"
          },
          "target": {
            "block": "c86e5323-dd97-48db-a770-88bd37e3b7b3",
            "port": "09a5c0ab-659a-423a-9821-1838dd95aa78"
          },
          "size": 32
        },
        {
          "source": {
            "block": "c08482a3-0a04-4daa-926b-423427124e13",
            "port": "0111a5d0-3969-4745-b13f-444597bd3a64"
          },
          "target": {
            "block": "6680c207-dc19-4853-b109-8b3527cc3645",
            "port": "baa70f70-8b40-4f3f-8c5d-63a1f1ab01b0"
          },
          "size": 32
        },
        {
          "source": {
            "block": "4c37744e-1831-48c0-977c-6b55cc31f85c",
            "port": "c17a46f6-0a86-4998-be4e-76d85b088d63"
          },
          "target": {
            "block": "c86e5323-dd97-48db-a770-88bd37e3b7b3",
            "port": "7c4e0bed-7824-438e-99bd-b4a819a86b0c"
          },
          "size": 32
        },
        {
          "source": {
            "block": "4086489a-7985-451f-9f2e-74450b600a7d",
            "port": "3c8913e5-5a81-4a5c-acbd-04b16f3c180d"
          },
          "target": {
            "block": "4c37744e-1831-48c0-977c-6b55cc31f85c",
            "port": "baa70f70-8b40-4f3f-8c5d-63a1f1ab01b0"
          },
          "size": 32
        },
        {
          "source": {
            "block": "c08482a3-0a04-4daa-926b-423427124e13",
            "port": "8c3c4314-f452-4c8b-a879-b49afaa5cba0"
          },
          "target": {
            "block": "4c37744e-1831-48c0-977c-6b55cc31f85c",
            "port": "8415be3c-848e-47d5-a19d-ac6df0458e41"
          },
          "size": 32
        }
      ]
    }
  },
  "dependencies": {
    "6dd3642b688588e5816855b80fcdbfb94b02f7cd": {
      "package": {
        "name": "CPU",
        "version": "",
        "description": "",
        "author": "",
        "image": ""
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "6e1ba584-c79b-4406-af86-e3b5d1a120d7",
              "type": "basic.input",
              "data": {
                "name": "RAMDaten",
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
                "x": 984,
                "y": 360
              }
            },
            {
              "id": "ff9dbe4c-e0ae-4070-8558-efcd79b0bb0c",
              "type": "basic.output",
              "data": {
                "name": "BefehlAdresse",
                "virtual": true,
                "range": "[25:0]",
                "pins": [
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
                ]
              },
              "position": {
                "x": 1776,
                "y": 360
              }
            },
            {
              "id": "f58bbf14-1a59-4ab5-b089-adc50d20fbca",
              "type": "basic.input",
              "data": {
                "name": "Befehl",
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
                "x": 1096,
                "y": 392
              }
            },
            {
              "id": "2401dc10-920b-42dc-bc81-444fe50e83e7",
              "type": "basic.output",
              "data": {
                "name": "Adresse",
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
                ]
              },
              "position": {
                "x": 1880,
                "y": 400
              }
            },
            {
              "id": "edefb09b-c29e-4a69-b85f-a2f4fbc72210",
              "type": "basic.input",
              "data": {
                "name": "BefehlGeladen",
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
                "x": 984,
                "y": 424
              }
            },
            {
              "id": "c7f78996-1d60-4939-84f3-2721dc9559f6",
              "type": "basic.output",
              "data": {
                "name": "StoreDaten",
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
                ]
              },
              "position": {
                "x": 1784,
                "y": 440
              }
            },
            {
              "id": "4e26d5a2-2872-4cc7-9bab-669e80d69aaa",
              "type": "basic.input",
              "data": {
                "name": "DatenGeladen",
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
                "x": 1096,
                "y": 456
              }
            },
            {
              "id": "89259631-8cbe-496f-b598-578ddca5dda0",
              "type": "basic.output",
              "data": {
                "name": "LoadBefehlSignal",
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
                "x": 1880,
                "y": 472
              }
            },
            {
              "id": "401121b3-49d8-4643-92be-ae050ce654e6",
              "type": "basic.input",
              "data": {
                "name": "DatenGespeichert",
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
                "x": 984,
                "y": 488
              }
            },
            {
              "id": "76f311bf-1e0c-4bcf-8f5f-1f0477d32577",
              "type": "basic.output",
              "data": {
                "name": "LoadDatenSignal",
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
                "x": 1784,
                "y": 512
              }
            },
            {
              "id": "c58f9db8-dc00-43ff-ac6b-3669cb7357e5",
              "type": "basic.input",
              "data": {
                "name": "Reset",
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
                "x": 1096,
                "y": 520
              }
            },
            {
              "id": "768309c3-31a1-46f2-8036-2d878503ed03",
              "type": "basic.input",
              "data": {
                "name": "Clk",
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
                "x": 984,
                "y": 552
              }
            },
            {
              "id": "192aecbd-966b-4285-81f4-2ead68dd3815",
              "type": "basic.output",
              "data": {
                "name": "StoreDatenSignal",
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
                "x": 1872,
                "y": 552
              }
            },
            {
              "id": "8c9a3738-f2c1-45ad-aabe-79268bddc2d4",
              "type": "b3bf395dd20d607ccbc9d6e3f93b905f852a3b89",
              "position": {
                "x": 1408,
                "y": 376
              },
              "size": {
                "width": 96,
                "height": 224
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "6e1ba584-c79b-4406-af86-e3b5d1a120d7",
                "port": "out"
              },
              "target": {
                "block": "8c9a3738-f2c1-45ad-aabe-79268bddc2d4",
                "port": "71d09b68-1b29-4e2f-91bf-f6eea1192c3d"
              },
              "vertices": [],
              "size": 32
            },
            {
              "source": {
                "block": "f58bbf14-1a59-4ab5-b089-adc50d20fbca",
                "port": "out"
              },
              "target": {
                "block": "8c9a3738-f2c1-45ad-aabe-79268bddc2d4",
                "port": "0718d553-0078-4ab9-a38a-e2f1ed4bed96"
              },
              "size": 32
            },
            {
              "source": {
                "block": "edefb09b-c29e-4a69-b85f-a2f4fbc72210",
                "port": "out"
              },
              "target": {
                "block": "8c9a3738-f2c1-45ad-aabe-79268bddc2d4",
                "port": "0d06c239-ce5a-442f-8287-23f5c43cd1a0"
              }
            },
            {
              "source": {
                "block": "4e26d5a2-2872-4cc7-9bab-669e80d69aaa",
                "port": "out"
              },
              "target": {
                "block": "8c9a3738-f2c1-45ad-aabe-79268bddc2d4",
                "port": "9a871f07-953b-40dd-be01-aafff0c87853"
              }
            },
            {
              "source": {
                "block": "401121b3-49d8-4643-92be-ae050ce654e6",
                "port": "out"
              },
              "target": {
                "block": "8c9a3738-f2c1-45ad-aabe-79268bddc2d4",
                "port": "04ab5db4-493b-4ecc-a743-534ec5a17ce6"
              }
            },
            {
              "source": {
                "block": "8c9a3738-f2c1-45ad-aabe-79268bddc2d4",
                "port": "a6178528-cf3a-4491-ab88-b77746082b7d"
              },
              "target": {
                "block": "ff9dbe4c-e0ae-4070-8558-efcd79b0bb0c",
                "port": "in"
              },
              "size": 26
            },
            {
              "source": {
                "block": "8c9a3738-f2c1-45ad-aabe-79268bddc2d4",
                "port": "30d56940-a6fb-482d-91f3-ac06f90d7ecb"
              },
              "target": {
                "block": "2401dc10-920b-42dc-bc81-444fe50e83e7",
                "port": "in"
              },
              "size": 32
            },
            {
              "source": {
                "block": "8c9a3738-f2c1-45ad-aabe-79268bddc2d4",
                "port": "adfda51a-2a0c-4bf4-9fa6-94f72e266410"
              },
              "target": {
                "block": "c7f78996-1d60-4939-84f3-2721dc9559f6",
                "port": "in"
              },
              "size": 32
            },
            {
              "source": {
                "block": "8c9a3738-f2c1-45ad-aabe-79268bddc2d4",
                "port": "cf671e1c-92b9-4400-b9d7-d5e0b48e3281"
              },
              "target": {
                "block": "89259631-8cbe-496f-b598-578ddca5dda0",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "8c9a3738-f2c1-45ad-aabe-79268bddc2d4",
                "port": "cebe3cbc-cc8a-4c79-b698-47134e3e498a"
              },
              "target": {
                "block": "76f311bf-1e0c-4bcf-8f5f-1f0477d32577",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "8c9a3738-f2c1-45ad-aabe-79268bddc2d4",
                "port": "7dc1a9eb-86ef-4cb1-934d-9863b51aa76f"
              },
              "target": {
                "block": "192aecbd-966b-4285-81f4-2ead68dd3815",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "768309c3-31a1-46f2-8036-2d878503ed03",
                "port": "out"
              },
              "target": {
                "block": "8c9a3738-f2c1-45ad-aabe-79268bddc2d4",
                "port": "71b662da-e46a-4b1f-afec-69635940ab36"
              }
            },
            {
              "source": {
                "block": "c58f9db8-dc00-43ff-ac6b-3669cb7357e5",
                "port": "out"
              },
              "target": {
                "block": "8c9a3738-f2c1-45ad-aabe-79268bddc2d4",
                "port": "569a6706-5b60-4c6e-9bf4-0ea02220056f"
              }
            }
          ]
        }
      }
    },
    "b3bf395dd20d607ccbc9d6e3f93b905f852a3b89": {
      "package": {
        "name": "",
        "version": "",
        "description": "",
        "author": "",
        "image": ""
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "71d09b68-1b29-4e2f-91bf-f6eea1192c3d",
              "type": "basic.input",
              "data": {
                "name": "RAMDaten",
                "range": "[31:0]",
                "clock": false,
                "size": 32
              },
              "position": {
                "x": 64,
                "y": -32
              }
            },
            {
              "id": "0718d553-0078-4ab9-a38a-e2f1ed4bed96",
              "type": "basic.input",
              "data": {
                "name": "Befehl",
                "range": "[31:0]",
                "clock": false,
                "size": 32
              },
              "position": {
                "x": -184,
                "y": 328
              }
            },
            {
              "id": "a6178528-cf3a-4491-ab88-b77746082b7d",
              "type": "basic.output",
              "data": {
                "name": "BefehlAdresse",
                "range": "[25:0]",
                "size": 26
              },
              "position": {
                "x": 2024,
                "y": 336
              }
            },
            {
              "id": "30d56940-a6fb-482d-91f3-ac06f90d7ecb",
              "type": "basic.output",
              "data": {
                "name": "Adresse",
                "range": "[31:0]",
                "size": 32
              },
              "position": {
                "x": 2024,
                "y": 376
              }
            },
            {
              "id": "adfda51a-2a0c-4bf4-9fa6-94f72e266410",
              "type": "basic.output",
              "data": {
                "name": "StoreDaten",
                "range": "[31:0]",
                "size": 32
              },
              "position": {
                "x": 2024,
                "y": 416
              }
            },
            {
              "id": "cf671e1c-92b9-4400-b9d7-d5e0b48e3281",
              "type": "basic.output",
              "data": {
                "name": "LoadBefehlSignal"
              },
              "position": {
                "x": 2024,
                "y": 456
              }
            },
            {
              "id": "cebe3cbc-cc8a-4c79-b698-47134e3e498a",
              "type": "basic.output",
              "data": {
                "name": "LoadDatenSignal"
              },
              "position": {
                "x": 2024,
                "y": 496
              }
            },
            {
              "id": "7dc1a9eb-86ef-4cb1-934d-9863b51aa76f",
              "type": "basic.output",
              "data": {
                "name": "StoreDatenSignal"
              },
              "position": {
                "x": 2024,
                "y": 536
              }
            },
            {
              "id": "0d06c239-ce5a-442f-8287-23f5c43cd1a0",
              "type": "basic.input",
              "data": {
                "name": "BefehlGeladen",
                "clock": false
              },
              "position": {
                "x": 464,
                "y": 840
              }
            },
            {
              "id": "9a871f07-953b-40dd-be01-aafff0c87853",
              "type": "basic.input",
              "data": {
                "name": "DatenGeladen",
                "clock": false
              },
              "position": {
                "x": 464,
                "y": 888
              }
            },
            {
              "id": "04ab5db4-493b-4ecc-a743-534ec5a17ce6",
              "type": "basic.input",
              "data": {
                "name": "DatenGespeichert",
                "clock": false
              },
              "position": {
                "x": 464,
                "y": 936
              }
            },
            {
              "id": "569a6706-5b60-4c6e-9bf4-0ea02220056f",
              "type": "basic.input",
              "data": {
                "name": "Reset",
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
                "x": -104,
                "y": 1168
              }
            },
            {
              "id": "71b662da-e46a-4b1f-afec-69635940ab36",
              "type": "basic.input",
              "data": {
                "name": "Clock",
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
                "x": 536,
                "y": 1224
              }
            },
            {
              "id": "395f69bf-12c6-469c-908e-cfc077391919",
              "type": "07c3e9937e380a4a69b76ed9acb607d974440968",
              "position": {
                "x": 40,
                "y": 120
              },
              "size": {
                "width": 96,
                "height": 448
              }
            },
            {
              "id": "6a191ea9-892f-4c41-bd1d-ce710d24ea47",
              "type": "0980595208e1182fd423fea62d5bf8166a29b47c",
              "position": {
                "x": 1584,
                "y": 672
              },
              "size": {
                "width": 96,
                "height": 128
              }
            },
            {
              "id": "12c8688c-4aca-440a-8f1d-39a524ccd960",
              "type": "d073daebe985cc6e840580d5c126e4b9b741fafd",
              "position": {
                "x": 792,
                "y": 432
              },
              "size": {
                "width": 96,
                "height": 416
              }
            },
            {
              "id": "c431a9e4-bfbe-4d83-a71d-b8b0f07c90a0",
              "type": "51b9cf88c750a154b49353272857414fafc78c5e",
              "position": {
                "x": 824,
                "y": -16
              },
              "size": {
                "width": 96,
                "height": 224
              }
            },
            {
              "id": "31990c40-3215-480c-a1f5-e77be6861b41",
              "type": "625d79635c0735eb022174bd3b756bc09c6d1186",
              "position": {
                "x": 1632,
                "y": 168
              },
              "size": {
                "width": 96,
                "height": 192
              }
            },
            {
              "id": "ad9ef40d-c49b-42a8-a7fa-5e7eea2266c2",
              "type": "aa9caf8ebcb7b0229e1a641e9bda55962d23528d",
              "position": {
                "x": 576,
                "y": -80
              },
              "size": {
                "width": 96,
                "height": 160
              }
            },
            {
              "id": "84143171-b5b0-438e-a4a0-fe844c0fbc38",
              "type": "1215e7c917c45969312f4d1b2e4c239094400d4c",
              "position": {
                "x": 352,
                "y": 624
              },
              "size": {
                "width": 96,
                "height": 64
              }
            },
            {
              "id": "95cc4275-7076-432b-85e0-a4f6402318ea",
              "type": "ef4843571745ee7cf39510612ba7bd08ba00fb02",
              "position": {
                "x": 1312,
                "y": 184
              },
              "size": {
                "width": 96,
                "height": 96
              }
            },
            {
              "id": "976035e9-d75d-477a-b245-cc03c7cc6329",
              "type": "433ce5316c1247a4e0a16f5007c3b5cf1c56a0e3",
              "position": {
                "x": 1368,
                "y": 584
              },
              "size": {
                "width": 96,
                "height": 96
              }
            },
            {
              "id": "0560a46c-d0ab-428a-bf30-0167bed59c70",
              "type": "26af9a43487ae90923261d1771fd552a03494500",
              "position": {
                "x": 1416,
                "y": 56
              },
              "size": {
                "width": 96,
                "height": 96
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "395f69bf-12c6-469c-908e-cfc077391919",
                "port": "e2915c0c-a75c-49dc-8624-776b13331de7"
              },
              "target": {
                "block": "12c8688c-4aca-440a-8f1d-39a524ccd960",
                "port": "03069b59-0bc1-4662-96b6-a9dfc7c22b0f"
              },
              "vertices": [
                {
                  "x": 384,
                  "y": 488
                }
              ]
            },
            {
              "source": {
                "block": "395f69bf-12c6-469c-908e-cfc077391919",
                "port": "1d97c60c-7bc2-4439-b9c5-35fcecda8278"
              },
              "target": {
                "block": "12c8688c-4aca-440a-8f1d-39a524ccd960",
                "port": "1f7015d3-8902-465c-881e-593942403cdf"
              },
              "vertices": [
                {
                  "x": 288,
                  "y": 552
                }
              ]
            },
            {
              "source": {
                "block": "395f69bf-12c6-469c-908e-cfc077391919",
                "port": "a8512379-fdf6-4ba5-a4c4-573450c25069"
              },
              "target": {
                "block": "12c8688c-4aca-440a-8f1d-39a524ccd960",
                "port": "8967c841-23d3-4222-8105-c75fc5a893c8"
              },
              "vertices": [
                {
                  "x": 272,
                  "y": 592
                }
              ]
            },
            {
              "source": {
                "block": "12c8688c-4aca-440a-8f1d-39a524ccd960",
                "port": "5235af3b-edc5-46bf-8f5f-30990f32da81"
              },
              "target": {
                "block": "6a191ea9-892f-4c41-bd1d-ce710d24ea47",
                "port": "ef8e04d2-5d14-4cdb-8c52-beef5541c4c4"
              },
              "vertices": []
            },
            {
              "source": {
                "block": "395f69bf-12c6-469c-908e-cfc077391919",
                "port": "c9c248e9-c9d1-45c9-b678-09aa7d4d5a5f"
              },
              "target": {
                "block": "31990c40-3215-480c-a1f5-e77be6861b41",
                "port": "cd22b151-94d3-4fb2-8e7f-cbccdf809bf4"
              },
              "vertices": [
                {
                  "x": 1520,
                  "y": 296
                }
              ],
              "size": 6
            },
            {
              "source": {
                "block": "395f69bf-12c6-469c-908e-cfc077391919",
                "port": "c614052d-8b0e-49f3-97db-f1dc82997efe"
              },
              "target": {
                "block": "c431a9e4-bfbe-4d83-a71d-b8b0f07c90a0",
                "port": "a1b808fc-82af-4985-ad41-55f4d95b7a66"
              },
              "vertices": [
                {
                  "x": 688,
                  "y": 96
                }
              ],
              "size": 6
            },
            {
              "source": {
                "block": "395f69bf-12c6-469c-908e-cfc077391919",
                "port": "044b0036-8e8b-47c8-a1a9-6c62209dc87b"
              },
              "target": {
                "block": "c431a9e4-bfbe-4d83-a71d-b8b0f07c90a0",
                "port": "892206be-caea-4813-b605-445dcd779427"
              },
              "vertices": [
                {
                  "x": 712,
                  "y": 72
                }
              ],
              "size": 6
            },
            {
              "source": {
                "block": "395f69bf-12c6-469c-908e-cfc077391919",
                "port": "317354c3-5b79-4f8e-a5ca-64033ae5e585"
              },
              "target": {
                "block": "c431a9e4-bfbe-4d83-a71d-b8b0f07c90a0",
                "port": "37f93bb3-455b-44e4-bd70-a8a59802a415"
              },
              "vertices": [
                {
                  "x": 736,
                  "y": 160
                }
              ],
              "size": 6
            },
            {
              "source": {
                "block": "395f69bf-12c6-469c-908e-cfc077391919",
                "port": "a7924039-31ca-45c6-8a7b-a4434c8bd6d1"
              },
              "target": {
                "block": "ad9ef40d-c49b-42a8-a7fa-5e7eea2266c2",
                "port": "6d9a9010-9997-45ca-9724-9b5b4fc74839"
              },
              "vertices": [
                {
                  "x": 384,
                  "y": 112
                }
              ]
            },
            {
              "source": {
                "block": "71d09b68-1b29-4e2f-91bf-f6eea1192c3d",
                "port": "out"
              },
              "target": {
                "block": "ad9ef40d-c49b-42a8-a7fa-5e7eea2266c2",
                "port": "95777557-33b9-4fae-8324-55ca8d0ea6c8"
              },
              "size": 32
            },
            {
              "source": {
                "block": "31990c40-3215-480c-a1f5-e77be6861b41",
                "port": "0450dc41-6526-407d-bce5-a63817a776ed"
              },
              "target": {
                "block": "ad9ef40d-c49b-42a8-a7fa-5e7eea2266c2",
                "port": "6c5c6aaa-2fb6-40f4-910c-fa001a1cf5fd"
              },
              "vertices": [
                {
                  "x": 1600,
                  "y": -136
                },
                {
                  "x": 392,
                  "y": -128
                }
              ],
              "size": 32
            },
            {
              "source": {
                "block": "ad9ef40d-c49b-42a8-a7fa-5e7eea2266c2",
                "port": "b7f8b7e9-59b8-4991-a6c1-51593d688b58"
              },
              "target": {
                "block": "c431a9e4-bfbe-4d83-a71d-b8b0f07c90a0",
                "port": "d3449a5c-f0dc-4952-9612-04e5eb031b42"
              },
              "size": 32
            },
            {
              "source": {
                "block": "c431a9e4-bfbe-4d83-a71d-b8b0f07c90a0",
                "port": "b8f0d093-53fa-4444-9246-8351c4234bbf"
              },
              "target": {
                "block": "84143171-b5b0-438e-a4a0-fe844c0fbc38",
                "port": "0fe5550a-6ffd-4cc7-8fcc-3a62a6c8c2c4"
              },
              "vertices": [
                {
                  "x": 1072,
                  "y": 32
                },
                {
                  "x": 440,
                  "y": -112
                }
              ],
              "size": 32
            },
            {
              "source": {
                "block": "84143171-b5b0-438e-a4a0-fe844c0fbc38",
                "port": "b0cef370-f1b8-40aa-9372-37c6e08dc3dd"
              },
              "target": {
                "block": "12c8688c-4aca-440a-8f1d-39a524ccd960",
                "port": "3773f6b8-a9b2-407e-a459-f27a07b3d59f"
              },
              "vertices": [
                {
                  "x": 616,
                  "y": 648
                }
              ]
            },
            {
              "source": {
                "block": "95cc4275-7076-432b-85e0-a4f6402318ea",
                "port": "7aa4c854-00a8-436d-9729-901eeb493bb7"
              },
              "target": {
                "block": "31990c40-3215-480c-a1f5-e77be6861b41",
                "port": "7a0ad72d-1e1f-4a7d-a98f-8af8dedb49e3"
              },
              "size": 32
            },
            {
              "source": {
                "block": "0718d553-0078-4ab9-a38a-e2f1ed4bed96",
                "port": "out"
              },
              "target": {
                "block": "395f69bf-12c6-469c-908e-cfc077391919",
                "port": "83123e85-a9ee-4fa5-bcbc-2c841ab7e832"
              },
              "size": 32
            },
            {
              "source": {
                "block": "12c8688c-4aca-440a-8f1d-39a524ccd960",
                "port": "9da12b58-a282-43a7-ac77-bc3d2490d94b"
              },
              "target": {
                "block": "cf671e1c-92b9-4400-b9d7-d5e0b48e3281",
                "port": "in"
              },
              "vertices": [
                {
                  "x": 1096,
                  "y": 520
                }
              ]
            },
            {
              "source": {
                "block": "12c8688c-4aca-440a-8f1d-39a524ccd960",
                "port": "6427d2c6-40cd-4423-8195-684d285df381"
              },
              "target": {
                "block": "cebe3cbc-cc8a-4c79-b698-47134e3e498a",
                "port": "in"
              },
              "vertices": [
                {
                  "x": 1120,
                  "y": 544
                }
              ]
            },
            {
              "source": {
                "block": "12c8688c-4aca-440a-8f1d-39a524ccd960",
                "port": "c1276045-a74b-455d-908a-edc85242ba90"
              },
              "target": {
                "block": "7dc1a9eb-86ef-4cb1-934d-9863b51aa76f",
                "port": "in"
              },
              "vertices": [
                {
                  "x": 1144,
                  "y": 592
                }
              ]
            },
            {
              "source": {
                "block": "976035e9-d75d-477a-b245-cc03c7cc6329",
                "port": "a68c98f1-ec9c-4375-ad28-160635fda5c8"
              },
              "target": {
                "block": "6a191ea9-892f-4c41-bd1d-ce710d24ea47",
                "port": "1ff29fca-25ea-4fc8-a224-f4fe10a518bd"
              },
              "size": 26
            },
            {
              "source": {
                "block": "31990c40-3215-480c-a1f5-e77be6861b41",
                "port": "0450dc41-6526-407d-bce5-a63817a776ed"
              },
              "target": {
                "block": "976035e9-d75d-477a-b245-cc03c7cc6329",
                "port": "a77b057e-811a-485a-b162-fd25b67e44b2"
              },
              "vertices": [
                {
                  "x": 1232,
                  "y": 416
                }
              ],
              "size": 32
            },
            {
              "source": {
                "block": "c431a9e4-bfbe-4d83-a71d-b8b0f07c90a0",
                "port": "b8f0d093-53fa-4444-9246-8351c4234bbf"
              },
              "target": {
                "block": "976035e9-d75d-477a-b245-cc03c7cc6329",
                "port": "32347a79-d57f-4d2c-9522-ea070c5126cd"
              },
              "vertices": [
                {
                  "x": 1072,
                  "y": 392
                }
              ],
              "size": 32
            },
            {
              "source": {
                "block": "395f69bf-12c6-469c-908e-cfc077391919",
                "port": "51d1842d-e9d7-426f-b46f-45adefc55b91"
              },
              "target": {
                "block": "976035e9-d75d-477a-b245-cc03c7cc6329",
                "port": "994bee7c-b7fa-4989-a1a2-e6d7f1e16e5c"
              },
              "vertices": [
                {
                  "x": 232,
                  "y": 1008
                }
              ]
            },
            {
              "source": {
                "block": "31990c40-3215-480c-a1f5-e77be6861b41",
                "port": "0450dc41-6526-407d-bce5-a63817a776ed"
              },
              "target": {
                "block": "30d56940-a6fb-482d-91f3-ac06f90d7ecb",
                "port": "in"
              },
              "size": 32
            },
            {
              "source": {
                "block": "c431a9e4-bfbe-4d83-a71d-b8b0f07c90a0",
                "port": "8bfa2dd1-de46-4329-99d9-ac064d57ce94"
              },
              "target": {
                "block": "adfda51a-2a0c-4bf4-9fa6-94f72e266410",
                "port": "in"
              },
              "vertices": [
                {
                  "x": 1136,
                  "y": 200
                }
              ],
              "size": 32
            },
            {
              "source": {
                "block": "c431a9e4-bfbe-4d83-a71d-b8b0f07c90a0",
                "port": "b8f0d093-53fa-4444-9246-8351c4234bbf"
              },
              "target": {
                "block": "0560a46c-d0ab-428a-bf30-0167bed59c70",
                "port": "d6c04894-ff4c-4827-b35d-7dbd31a34e4f"
              },
              "vertices": [
                {
                  "x": 1248,
                  "y": 72
                }
              ],
              "size": 32
            },
            {
              "source": {
                "block": "395f69bf-12c6-469c-908e-cfc077391919",
                "port": "c39adb98-1725-4957-b5ab-b04dac737ffb"
              },
              "target": {
                "block": "0560a46c-d0ab-428a-bf30-0167bed59c70",
                "port": "7461aa4d-447c-46cc-92b2-f437b6fb7557"
              },
              "vertices": [
                {
                  "x": 1120,
                  "y": 208
                }
              ]
            },
            {
              "source": {
                "block": "12c8688c-4aca-440a-8f1d-39a524ccd960",
                "port": "8a617e6e-3f08-4591-9c64-7dccb0cdfca0"
              },
              "target": {
                "block": "395f69bf-12c6-469c-908e-cfc077391919",
                "port": "a25f91cb-5ceb-473c-a646-15ee0036da29"
              },
              "vertices": [
                {
                  "x": -24,
                  "y": 1032
                }
              ]
            },
            {
              "source": {
                "block": "395f69bf-12c6-469c-908e-cfc077391919",
                "port": "a7924039-31ca-45c6-8a7b-a4434c8bd6d1"
              },
              "target": {
                "block": "12c8688c-4aca-440a-8f1d-39a524ccd960",
                "port": "80701733-2c21-4dd6-96ff-ede745745459"
              },
              "vertices": [
                {
                  "x": 360,
                  "y": 456
                }
              ]
            },
            {
              "source": {
                "block": "c431a9e4-bfbe-4d83-a71d-b8b0f07c90a0",
                "port": "8bfa2dd1-de46-4329-99d9-ac064d57ce94"
              },
              "target": {
                "block": "95cc4275-7076-432b-85e0-a4f6402318ea",
                "port": "3128ddd7-9d74-4768-aa0e-fc956aa0734d"
              },
              "vertices": [
                {
                  "x": 1136,
                  "y": 200
                }
              ],
              "size": 32
            },
            {
              "source": {
                "block": "12c8688c-4aca-440a-8f1d-39a524ccd960",
                "port": "1db36b48-c321-4849-bde1-e28f61fec522"
              },
              "target": {
                "block": "c431a9e4-bfbe-4d83-a71d-b8b0f07c90a0",
                "port": "a81bee85-0811-40bf-82a9-dbd224184b4c"
              },
              "vertices": [
                {
                  "x": 904,
                  "y": 392
                }
              ]
            },
            {
              "source": {
                "block": "9a871f07-953b-40dd-be01-aafff0c87853",
                "port": "out"
              },
              "target": {
                "block": "12c8688c-4aca-440a-8f1d-39a524ccd960",
                "port": "9ceb3b45-bdb4-4b49-97b8-2219d8485575"
              }
            },
            {
              "source": {
                "block": "04ab5db4-493b-4ecc-a743-534ec5a17ce6",
                "port": "out"
              },
              "target": {
                "block": "12c8688c-4aca-440a-8f1d-39a524ccd960",
                "port": "9a1a51a2-fa03-413f-8d49-5b9f7ab59e2e"
              },
              "vertices": [
                {
                  "x": 712,
                  "y": 880
                }
              ]
            },
            {
              "source": {
                "block": "12c8688c-4aca-440a-8f1d-39a524ccd960",
                "port": "8cf34f50-cd18-4b79-b85e-acbb3bfc9078"
              },
              "target": {
                "block": "6a191ea9-892f-4c41-bd1d-ce710d24ea47",
                "port": "17e637ef-d097-4a89-9612-670103f94aa3"
              },
              "vertices": []
            },
            {
              "source": {
                "block": "12c8688c-4aca-440a-8f1d-39a524ccd960",
                "port": "0ab4bde9-8c23-4f45-8e04-653d9400b648"
              },
              "target": {
                "block": "31990c40-3215-480c-a1f5-e77be6861b41",
                "port": "821416e3-f3d9-4ed9-8ad7-9f923ca5158a"
              },
              "vertices": [
                {
                  "x": 1048,
                  "y": 448
                },
                {
                  "x": 1240,
                  "y": 384
                }
              ]
            },
            {
              "source": {
                "block": "0d06c239-ce5a-442f-8287-23f5c43cd1a0",
                "port": "out"
              },
              "target": {
                "block": "12c8688c-4aca-440a-8f1d-39a524ccd960",
                "port": "3dd214ec-0e77-4f70-9c95-7061ee49399f"
              },
              "vertices": [
                {
                  "x": 648,
                  "y": 712
                }
              ]
            },
            {
              "source": {
                "block": "395f69bf-12c6-469c-908e-cfc077391919",
                "port": "c9c248e9-c9d1-45c9-b678-09aa7d4d5a5f"
              },
              "target": {
                "block": "12c8688c-4aca-440a-8f1d-39a524ccd960",
                "port": "528cacb6-c1be-45d7-adcf-916e31acc1d4"
              },
              "vertices": [
                {
                  "x": 664,
                  "y": 384
                }
              ],
              "size": 6
            },
            {
              "source": {
                "block": "395f69bf-12c6-469c-908e-cfc077391919",
                "port": "1b124991-cac3-4201-974f-691e1cc59c16"
              },
              "target": {
                "block": "ad9ef40d-c49b-42a8-a7fa-5e7eea2266c2",
                "port": "66cf6051-c4f5-490a-9570-8d4da9276ef3"
              },
              "vertices": [
                {
                  "x": 408,
                  "y": 120
                }
              ]
            },
            {
              "source": {
                "block": "395f69bf-12c6-469c-908e-cfc077391919",
                "port": "1b124991-cac3-4201-974f-691e1cc59c16"
              },
              "target": {
                "block": "12c8688c-4aca-440a-8f1d-39a524ccd960",
                "port": "0b4a4a02-3ff6-44c3-b26e-703f1667aae9"
              },
              "vertices": [
                {
                  "x": 408,
                  "y": 456
                }
              ]
            },
            {
              "source": {
                "block": "6a191ea9-892f-4c41-bd1d-ce710d24ea47",
                "port": "43b6acdf-97bc-41a1-93d0-21bc0f4c487c"
              },
              "target": {
                "block": "ad9ef40d-c49b-42a8-a7fa-5e7eea2266c2",
                "port": "d91193b7-11e3-48ac-b2f5-08dd974d73e2"
              },
              "vertices": [
                {
                  "x": 1920,
                  "y": -160
                },
                {
                  "x": 368,
                  "y": -136
                }
              ],
              "size": 26
            },
            {
              "source": {
                "block": "31990c40-3215-480c-a1f5-e77be6861b41",
                "port": "fafd4392-05f5-4020-8989-c06d7e1bdcb3"
              },
              "target": {
                "block": "12c8688c-4aca-440a-8f1d-39a524ccd960",
                "port": "7d325103-3431-4882-90f4-8d4afc400876"
              },
              "vertices": [
                {
                  "x": 616,
                  "y": 1056
                }
              ]
            },
            {
              "source": {
                "block": "6a191ea9-892f-4c41-bd1d-ce710d24ea47",
                "port": "43b6acdf-97bc-41a1-93d0-21bc0f4c487c"
              },
              "target": {
                "block": "a6178528-cf3a-4491-ab88-b77746082b7d",
                "port": "in"
              },
              "vertices": [
                {
                  "x": 1920,
                  "y": 376
                },
                {
                  "x": 1920,
                  "y": 376
                }
              ],
              "size": 26
            },
            {
              "source": {
                "block": "6a191ea9-892f-4c41-bd1d-ce710d24ea47",
                "port": "43b6acdf-97bc-41a1-93d0-21bc0f4c487c"
              },
              "target": {
                "block": "0560a46c-d0ab-428a-bf30-0167bed59c70",
                "port": "49cdeb8d-fdde-46cb-8b43-67fc607de353"
              },
              "vertices": [
                {
                  "x": 1920,
                  "y": 728
                },
                {
                  "x": 1672,
                  "y": 8
                }
              ],
              "size": 26
            },
            {
              "source": {
                "block": "395f69bf-12c6-469c-908e-cfc077391919",
                "port": "a2dfbeb0-95a5-406a-ac66-cfa499d71c1d"
              },
              "target": {
                "block": "84143171-b5b0-438e-a4a0-fe844c0fbc38",
                "port": "da29e25a-f215-4ae3-a9a6-7ef8aa9b30bb"
              }
            },
            {
              "source": {
                "block": "395f69bf-12c6-469c-908e-cfc077391919",
                "port": "dfa86c66-e8f8-4c43-b5b9-fa54c88e5589"
              },
              "target": {
                "block": "95cc4275-7076-432b-85e0-a4f6402318ea",
                "port": "081e5dbe-2409-4488-9430-fc8ae8d66ee3"
              }
            },
            {
              "source": {
                "block": "395f69bf-12c6-469c-908e-cfc077391919",
                "port": "4c08410d-f8e7-4a6c-879f-35ba08185c5e"
              },
              "target": {
                "block": "95cc4275-7076-432b-85e0-a4f6402318ea",
                "port": "d7d5b5c0-0edd-452c-a3cb-dd61710939c1"
              },
              "size": 32
            },
            {
              "source": {
                "block": "569a6706-5b60-4c6e-9bf4-0ea02220056f",
                "port": "out"
              },
              "target": {
                "block": "395f69bf-12c6-469c-908e-cfc077391919",
                "port": "8893ddf5-a3ac-43ba-87b5-0d01dbdcd8cd"
              }
            },
            {
              "source": {
                "block": "569a6706-5b60-4c6e-9bf4-0ea02220056f",
                "port": "out"
              },
              "target": {
                "block": "c431a9e4-bfbe-4d83-a71d-b8b0f07c90a0",
                "port": "7f3a3db0-b1ee-4f1d-8463-ff80051a3d7d"
              }
            },
            {
              "source": {
                "block": "569a6706-5b60-4c6e-9bf4-0ea02220056f",
                "port": "out"
              },
              "target": {
                "block": "12c8688c-4aca-440a-8f1d-39a524ccd960",
                "port": "b39cb169-c796-417c-9c48-7900b82b7065"
              }
            },
            {
              "source": {
                "block": "569a6706-5b60-4c6e-9bf4-0ea02220056f",
                "port": "out"
              },
              "target": {
                "block": "6a191ea9-892f-4c41-bd1d-ce710d24ea47",
                "port": "e3a5e03f-9d03-4db2-94fb-e74ec080c510"
              }
            },
            {
              "source": {
                "block": "569a6706-5b60-4c6e-9bf4-0ea02220056f",
                "port": "out"
              },
              "target": {
                "block": "31990c40-3215-480c-a1f5-e77be6861b41",
                "port": "cacc8401-cf85-4130-8ab4-f199bdec6f35"
              }
            },
            {
              "source": {
                "block": "71b662da-e46a-4b1f-afec-69635940ab36",
                "port": "out"
              },
              "target": {
                "block": "12c8688c-4aca-440a-8f1d-39a524ccd960",
                "port": "151db1f8-9820-4afd-955f-90dbb16de40b"
              }
            },
            {
              "source": {
                "block": "31990c40-3215-480c-a1f5-e77be6861b41",
                "port": "71842a6b-f88f-4e17-ad89-bcb5bbd0d523"
              },
              "target": {
                "block": "c431a9e4-bfbe-4d83-a71d-b8b0f07c90a0",
                "port": "439ae457-6bcb-4622-94d9-81bc05834d33"
              }
            }
          ]
        }
      }
    },
    "07c3e9937e380a4a69b76ed9acb607d974440968": {
      "package": {
        "name": "Instruktionsdekodierer",
        "version": "0.1",
        "description": "",
        "author": "Moritz, Yannik, Timo",
        "image": ""
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "c614052d-8b0e-49f3-97db-f1dc82997efe",
              "type": "basic.output",
              "data": {
                "name": "QuellReg1",
                "range": "[5:0]",
                "size": 6
              },
              "position": {
                "x": 720,
                "y": 72
              }
            },
            {
              "id": "044b0036-8e8b-47c8-a1a9-6c62209dc87b",
              "type": "basic.output",
              "data": {
                "name": "QuellReg2",
                "range": "[5:0]",
                "size": 6
              },
              "position": {
                "x": 704,
                "y": 176
              }
            },
            {
              "id": "83123e85-a9ee-4fa5-bcbc-2c841ab7e832",
              "type": "basic.input",
              "data": {
                "name": "Instruktion",
                "range": "[31:0]",
                "clock": false,
                "size": 32
              },
              "position": {
                "x": -1000,
                "y": 264
              }
            },
            {
              "id": "317354c3-5b79-4f8e-a5ca-64033ae5e585",
              "type": "basic.output",
              "data": {
                "name": "ZielReg1",
                "range": "[5:0]",
                "size": 6
              },
              "position": {
                "x": 720,
                "y": 280
              }
            },
            {
              "id": "4c08410d-f8e7-4a6c-879f-35ba08185c5e",
              "type": "basic.output",
              "data": {
                "name": "IDaten",
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
                ]
              },
              "position": {
                "x": 704,
                "y": 384
              }
            },
            {
              "id": "dfa86c66-e8f8-4c43-b5b9-fa54c88e5589",
              "type": "basic.output",
              "data": {
                "name": "ImmediateAktiv",
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
                "x": 720,
                "y": 488
              }
            },
            {
              "id": "c9c248e9-c9d1-45c9-b678-09aa7d4d5a5f",
              "type": "basic.output",
              "data": {
                "name": "FunktionsCode",
                "virtual": true,
                "range": "[5:0]",
                "pins": [
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
                "x": 712,
                "y": 592
              }
            },
            {
              "id": "a7924039-31ca-45c6-8a7b-a4434c8bd6d1",
              "type": "basic.output",
              "data": {
                "name": "JALBefehl",
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
                "x": 720,
                "y": 696
              }
            },
            {
              "id": "a25f91cb-5ceb-473c-a646-15ee0036da29",
              "type": "basic.input",
              "data": {
                "name": "DekodierSignal",
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
                "x": -1032,
                "y": 752
              }
            },
            {
              "id": "c39adb98-1725-4957-b5ab-b04dac737ffb",
              "type": "basic.output",
              "data": {
                "name": "RelativerSprung",
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
                "x": 720,
                "y": 800
              }
            },
            {
              "id": "1b124991-cac3-4201-974f-691e1cc59c16",
              "type": "basic.output",
              "data": {
                "name": "LoadBefehl"
              },
              "position": {
                "x": 728,
                "y": 904
              }
            },
            {
              "id": "e2915c0c-a75c-49dc-8624-776b13331de7",
              "type": "basic.output",
              "data": {
                "name": "StoreBefehl"
              },
              "position": {
                "x": 728,
                "y": 1008
              }
            },
            {
              "id": "1d97c60c-7bc2-4439-b9c5-35fcecda8278",
              "type": "basic.output",
              "data": {
                "name": "UnbedingterSprungBefehl"
              },
              "position": {
                "x": 752,
                "y": 1112
              }
            },
            {
              "id": "a8512379-fdf6-4ba5-a4c4-573450c25069",
              "type": "basic.output",
              "data": {
                "name": "BedingterSprung"
              },
              "position": {
                "x": 744,
                "y": 1216
              }
            },
            {
              "id": "8893ddf5-a3ac-43ba-87b5-0d01dbdcd8cd",
              "type": "basic.input",
              "data": {
                "name": "Reset",
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
                "x": -1192,
                "y": 1232
              }
            },
            {
              "id": "51d1842d-e9d7-426f-b46f-45adefc55b91",
              "type": "basic.output",
              "data": {
                "name": "AbsoluterSprung",
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
                "x": 752,
                "y": 1320
              }
            },
            {
              "id": "a2dfbeb0-95a5-406a-ac66-cfa499d71c1d",
              "type": "basic.output",
              "data": {
                "name": "Sprungbedingung",
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
                "x": 744,
                "y": 1424
              }
            },
            {
              "id": "85dde437-ef30-4e91-a8d9-80ec330ab957",
              "type": "basic.code",
              "data": {
                "ports": {
                  "in": [
                    {
                      "name": "Instruktion",
                      "range": "[31:0]",
                      "size": 32
                    },
                    {
                      "name": "DekodierSignal"
                    },
                    {
                      "name": "Reset"
                    }
                  ],
                  "out": [
                    {
                      "name": "QuellRegister1",
                      "range": "[5:0]",
                      "size": 6
                    },
                    {
                      "name": "QuellRegister2",
                      "range": "[5:0]",
                      "size": 6
                    },
                    {
                      "name": "ZielRegister",
                      "range": "[5:0]",
                      "size": 6
                    },
                    {
                      "name": "IDaten",
                      "range": "[31:0]",
                      "size": 32
                    },
                    {
                      "name": "ImmediateAktiv"
                    },
                    {
                      "name": "FunktionsCode",
                      "range": "[5:0]",
                      "size": 6
                    },
                    {
                      "name": "JALBefehl"
                    },
                    {
                      "name": "RelativerSprung"
                    },
                    {
                      "name": "LoadBefehl"
                    },
                    {
                      "name": "StoreBefehl"
                    },
                    {
                      "name": "UnbedingterSprungBefehl"
                    },
                    {
                      "name": "BedingterSprungBefehl"
                    },
                    {
                      "name": "AbsoluterSprung"
                    },
                    {
                      "name": "Sprungbedingung"
                    }
                  ]
                },
                "params": [],
                "code": "\n//Aktuell gespeicherte Befehl\nreg [31:0] AktuellerBefehl;\n\n//Wires für Lesbaren Code\nwire[5:0] Opcode;\nwire[1:0] Format;\nwire[1:0] Kategorie;\nwire[4:0] ZRegister;\nwire[4:0] Q1Register;\nwire[4:0] Q2Register;\nwire[5:0] Funktion;\nwire[5:0] FunktionAnfang;\nwire[15:0] KleinerImmediate;\nwire[25:0] GrosserImmediate;\nwire[3:0] GleitkommaBefehl;\n\nassign Opcode = AktuellerBefehl[31:26];\nassign Format = AktuellerBefehl[31:30];\nassign Kategorie = AktuellerBefehl[5:4];\nassign ZRegister = AktuellerBefehl[25:21];\nassign Q1Register = AktuellerBefehl[20:16];\nassign Q2Register = AktuellerBefehl[15:11];\nassign Funktion = AktuellerBefehl[5:0];\nassign FunktionAnfang = AktuellerBefehl[30:26];\nassign KleinerImmediate = AktuellerBefehl[15:0];\nassign GrosserImmediate = AktuellerBefehl[25:0];\nassign GleitkommaBefehl = AktuellerBefehl[3:0];\n\n//wichtige Befehle die einzeln behandelt werden muessen\nlocalparam[5:0] LoadCode   = 6'b111000;\nlocalparam[5:0] LoadSCode  = 6'b111001;\nlocalparam[5:0] StoreCode  = 6'b111010;\nlocalparam[5:0] StoreSCode = 6'b111011;\nlocalparam[5:0] JregCode   = 6'b111100;\nlocalparam[5:0] BezCode    = 6'b111101;\nlocalparam[5:0] BNezCode   = 6'b111110;\nlocalparam[5:0] JALCode    = 6'b111111;\nlocalparam[5:0] JmpCode    = 6'b010000;\nlocalparam[5:0] AddisCode  = 6'b110000;\n\n//wichtige Formate die behandelt werden muessen\nlocalparam[1:0] RegisterFormat = 2'b00;\nlocalparam[1:0] JumpFormat = 2'b01;\nlocalparam ImmediateFormat = 1'b1;\nlocalparam FloatVergleich = 1'b1;\nlocalparam[1:0] Arithmetik = 2'b00;\nlocalparam[1:0] Vergleich = 2'b01;\nlocalparam[1:0] Gleitkomma = 2'b10;\nlocalparam[1:0] Vektor = 2'b11;\n\n//START LOGIK\n\nalways @(posedge Reset or posedge DekodierSignal) begin\n    if(Reset)\n        AktuellerBefehl <= 32'b00000000000000000000000000000000;\n    else begin\n        AktuellerBefehl <= Instruktion;\n    end\nend\n\nassign QuellRegister1 =         {((Format == RegisterFormat && Kategorie == Gleitkomma) ? 1'b1 : 1'b0), Q1Register};\n\nassign QuellRegister2 =         (Opcode == StoreCode) ? {1'b0, ZRegister}:\n                                (Opcode == StoreSCode) ? {1'b1, ZRegister}:\n                                {((Format == RegisterFormat && Kategorie == Gleitkomma) ? 1'b1 : 1'b0), Q2Register};\n\nassign ZielRegister =           (Opcode==LoadSCode || Opcode == StoreSCode || ((Format == RegisterFormat && Kategorie == Gleitkomma && GleitkommaBefehl < 8)) ? {1'b1, ZRegister}:\n                                (((Format == RegisterFormat) || (Format[1] == ImmediateFormat)) ? {1'b0, ZRegister}:\n                                6'b0));\n\nassign IDaten =                 (Format == JumpFormat) ? {6'b0, GrosserImmediate} :\n                                (Opcode == AddisCode) ? {KleinerImmediate, 16'b0} : \n                                (Format[1] == ImmediateFormat && Opcode > AddisCode && Opcode < LoadCode) ? {16'b0, KleinerImmediate} :\n                                (Format[1] == ImmediateFormat) ? {{16{KleinerImmediate[15]}}, KleinerImmediate} :\n                                32'b0;\n\nassign ImmediateAktiv =         (Format == JumpFormat || Format[1] == ImmediateFormat);\n                            \nassign FunktionsCode =          (Format == RegisterFormat) ? Funktion :\n                                ((Opcode == AddisCode || Format == JumpFormat||(Opcode >= LoadCode && Opcode <= JALCode)) ? 6'b0:\n                                {1'b0,FunktionAnfang});\n\nassign JALBefehl =              (Opcode == JALCode);\n\nassign RelativerSprung =        (Opcode == JALCode || Opcode == JmpCode || Opcode == BezCode || Opcode == BNezCode);\n\nassign AbsoluterSprung =        (Opcode == JregCode);                               \n\nassign LoadBefehl =             (Opcode == LoadCode || Opcode == LoadSCode);\n\nassign StoreBefehl =            (Opcode == StoreCode || Opcode == StoreSCode);\n\nassign UnbedingterSprungBefehl =(Opcode == JregCode || Opcode == JALCode || Opcode == JmpCode);\n\nassign BedingterSprungBefehl =  (Opcode == BezCode || Opcode == BNezCode); \n\nassign Sprungbedingung =           (Opcode == BezCode);"
              },
              "position": {
                "x": -672,
                "y": 56
              },
              "size": {
                "width": 1200,
                "height": 1448
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "83123e85-a9ee-4fa5-bcbc-2c841ab7e832",
                "port": "out"
              },
              "target": {
                "block": "85dde437-ef30-4e91-a8d9-80ec330ab957",
                "port": "Instruktion"
              },
              "size": 32
            },
            {
              "source": {
                "block": "a25f91cb-5ceb-473c-a646-15ee0036da29",
                "port": "out"
              },
              "target": {
                "block": "85dde437-ef30-4e91-a8d9-80ec330ab957",
                "port": "DekodierSignal"
              }
            },
            {
              "source": {
                "block": "8893ddf5-a3ac-43ba-87b5-0d01dbdcd8cd",
                "port": "out"
              },
              "target": {
                "block": "85dde437-ef30-4e91-a8d9-80ec330ab957",
                "port": "Reset"
              }
            },
            {
              "source": {
                "block": "85dde437-ef30-4e91-a8d9-80ec330ab957",
                "port": "FunktionsCode"
              },
              "target": {
                "block": "c9c248e9-c9d1-45c9-b678-09aa7d4d5a5f",
                "port": "in"
              },
              "size": 6
            },
            {
              "source": {
                "block": "85dde437-ef30-4e91-a8d9-80ec330ab957",
                "port": "ImmediateAktiv"
              },
              "target": {
                "block": "dfa86c66-e8f8-4c43-b5b9-fa54c88e5589",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "85dde437-ef30-4e91-a8d9-80ec330ab957",
                "port": "JALBefehl"
              },
              "target": {
                "block": "a7924039-31ca-45c6-8a7b-a4434c8bd6d1",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "85dde437-ef30-4e91-a8d9-80ec330ab957",
                "port": "LoadBefehl"
              },
              "target": {
                "block": "1b124991-cac3-4201-974f-691e1cc59c16",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "85dde437-ef30-4e91-a8d9-80ec330ab957",
                "port": "Sprungbedingung"
              },
              "target": {
                "block": "a2dfbeb0-95a5-406a-ac66-cfa499d71c1d",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "85dde437-ef30-4e91-a8d9-80ec330ab957",
                "port": "AbsoluterSprung"
              },
              "target": {
                "block": "51d1842d-e9d7-426f-b46f-45adefc55b91",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "85dde437-ef30-4e91-a8d9-80ec330ab957",
                "port": "BedingterSprungBefehl"
              },
              "target": {
                "block": "a8512379-fdf6-4ba5-a4c4-573450c25069",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "85dde437-ef30-4e91-a8d9-80ec330ab957",
                "port": "UnbedingterSprungBefehl"
              },
              "target": {
                "block": "1d97c60c-7bc2-4439-b9c5-35fcecda8278",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "85dde437-ef30-4e91-a8d9-80ec330ab957",
                "port": "StoreBefehl"
              },
              "target": {
                "block": "e2915c0c-a75c-49dc-8624-776b13331de7",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "85dde437-ef30-4e91-a8d9-80ec330ab957",
                "port": "RelativerSprung"
              },
              "target": {
                "block": "c39adb98-1725-4957-b5ab-b04dac737ffb",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "85dde437-ef30-4e91-a8d9-80ec330ab957",
                "port": "IDaten"
              },
              "target": {
                "block": "4c08410d-f8e7-4a6c-879f-35ba08185c5e",
                "port": "in"
              },
              "size": 32
            },
            {
              "source": {
                "block": "85dde437-ef30-4e91-a8d9-80ec330ab957",
                "port": "ZielRegister"
              },
              "target": {
                "block": "317354c3-5b79-4f8e-a5ca-64033ae5e585",
                "port": "in"
              },
              "size": 6
            },
            {
              "source": {
                "block": "85dde437-ef30-4e91-a8d9-80ec330ab957",
                "port": "QuellRegister2"
              },
              "target": {
                "block": "044b0036-8e8b-47c8-a1a9-6c62209dc87b",
                "port": "in"
              },
              "size": 6
            },
            {
              "source": {
                "block": "85dde437-ef30-4e91-a8d9-80ec330ab957",
                "port": "QuellRegister1"
              },
              "target": {
                "block": "c614052d-8b0e-49f3-97db-f1dc82997efe",
                "port": "in"
              },
              "size": 6
            }
          ]
        }
      }
    },
    "0980595208e1182fd423fea62d5bf8166a29b47c": {
      "package": {
        "name": "Programmzähler",
        "version": "",
        "description": "",
        "author": "",
        "image": ""
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "43b6acdf-97bc-41a1-93d0-21bc0f4c487c",
              "type": "basic.output",
              "data": {
                "name": "AktuellerPC ",
                "range": "[25:0]",
                "size": 26
              },
              "position": {
                "x": 1408,
                "y": 272
              }
            },
            {
              "id": "1ff29fca-25ea-4fc8-a224-f4fe10a518bd",
              "type": "basic.input",
              "data": {
                "name": "NeuerPC ",
                "range": "[25:0]",
                "clock": false,
                "size": 26
              },
              "position": {
                "x": 616,
                "y": 440
              }
            },
            {
              "id": "ef8e04d2-5d14-4cdb-8c52-beef5541c4c4",
              "type": "basic.input",
              "data": {
                "name": "SchreibSignal",
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
                "x": 616,
                "y": 528
              }
            },
            {
              "id": "17e637ef-d097-4a89-9612-670103f94aa3",
              "type": "basic.input",
              "data": {
                "name": "TaktSignal",
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
                "x": 616,
                "y": 592
              }
            },
            {
              "id": "e3a5e03f-9d03-4db2-94fb-e74ec080c510",
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
                "x": 616,
                "y": 664
              }
            }
          ],
          "wires": []
        }
      }
    },
    "d073daebe985cc6e840580d5c126e4b9b741fafd": {
      "package": {
        "name": "Steuerung",
        "version": "",
        "description": "",
        "author": "",
        "image": ""
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "528cacb6-c1be-45d7-adcf-916e31acc1d4",
              "type": "basic.input",
              "data": {
                "name": "Funktionscode",
                "virtual": true,
                "range": "[5:0]",
                "pins": [
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
                "x": 696,
                "y": -16
              }
            },
            {
              "id": "1db36b48-c321-4849-bde1-e28f61fec522",
              "type": "basic.output",
              "data": {
                "name": "RegisterSchreibSignal",
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
                "x": 1008,
                "y": 112
              }
            },
            {
              "id": "0ab4bde9-8c23-4f45-8e04-653d9400b648",
              "type": "basic.output",
              "data": {
                "name": "ALUStartSignal",
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
                "x": 1008,
                "y": 176
              }
            },
            {
              "id": "0b4a4a02-3ff6-44c3-b26e-703f1667aae9",
              "type": "basic.input",
              "data": {
                "name": "LoadBefehl",
                "clock": false
              },
              "position": {
                "x": 688,
                "y": 208
              }
            },
            {
              "id": "03069b59-0bc1-4662-96b6-a9dfc7c22b0f",
              "type": "basic.input",
              "data": {
                "name": "StoreBefehl",
                "clock": false
              },
              "position": {
                "x": 696,
                "y": 280
              }
            },
            {
              "id": "9da12b58-a282-43a7-ac77-bc3d2490d94b",
              "type": "basic.output",
              "data": {
                "name": "LoadBefehlSignal"
              },
              "position": {
                "x": 1008,
                "y": 288
              }
            },
            {
              "id": "80701733-2c21-4dd6-96ff-ede745745459",
              "type": "basic.input",
              "data": {
                "name": "JALBefehl",
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
                "x": 696,
                "y": 344
              }
            },
            {
              "id": "6427d2c6-40cd-4423-8195-684d285df381",
              "type": "basic.output",
              "data": {
                "name": "LoadDatenSignal"
              },
              "position": {
                "x": 1008,
                "y": 344
              }
            },
            {
              "id": "1f7015d3-8902-465c-881e-593942403cdf",
              "type": "basic.input",
              "data": {
                "name": "UnbedingterSprungBefehl",
                "clock": false
              },
              "position": {
                "x": 688,
                "y": 400
              }
            },
            {
              "id": "c1276045-a74b-455d-908a-edc85242ba90",
              "type": "basic.output",
              "data": {
                "name": "StoreDatenSignal"
              },
              "position": {
                "x": 1016,
                "y": 448
              }
            },
            {
              "id": "8967c841-23d3-4222-8105-c75fc5a893c8",
              "type": "basic.input",
              "data": {
                "name": "BedingterSprungBefehl",
                "clock": false
              },
              "position": {
                "x": 688,
                "y": 456
              }
            },
            {
              "id": "3773f6b8-a9b2-407e-a459-f27a07b3d59f",
              "type": "basic.input",
              "data": {
                "name": "Bedingung",
                "clock": false
              },
              "position": {
                "x": 688,
                "y": 512
              }
            },
            {
              "id": "5235af3b-edc5-46bf-8f5f-30990f32da81",
              "type": "basic.output",
              "data": {
                "name": "PCSprungSignal",
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
                "x": 1016,
                "y": 520
              }
            },
            {
              "id": "7d325103-3431-4882-90f4-8d4afc400876",
              "type": "basic.input",
              "data": {
                "name": "ALUFertig",
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
                "x": 688,
                "y": 552
              }
            },
            {
              "id": "8cf34f50-cd18-4b79-b85e-acbb3bfc9078",
              "type": "basic.output",
              "data": {
                "name": "PCSignal",
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
                "x": 1016,
                "y": 584
              }
            },
            {
              "id": "3dd214ec-0e77-4f70-9c95-7061ee49399f",
              "type": "basic.input",
              "data": {
                "name": "BefehlGeladen",
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
                "x": 688,
                "y": 592
              }
            },
            {
              "id": "8a617e6e-3f08-4591-9c64-7dccb0cdfca0",
              "type": "basic.output",
              "data": {
                "name": "DekodierSignal",
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
                "x": 1016,
                "y": 648
              }
            },
            {
              "id": "9ceb3b45-bdb4-4b49-97b8-2219d8485575",
              "type": "basic.input",
              "data": {
                "name": "DatenGeladen",
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
                "x": 688,
                "y": 648
              }
            },
            {
              "id": "9a1a51a2-fa03-413f-8d49-5b9f7ab59e2e",
              "type": "basic.input",
              "data": {
                "name": "DatenGespeichert",
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
                "x": 688,
                "y": 712
              }
            },
            {
              "id": "151db1f8-9820-4afd-955f-90dbb16de40b",
              "type": "basic.input",
              "data": {
                "name": "clock",
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
                "x": 688,
                "y": 768
              }
            },
            {
              "id": "b39cb169-c796-417c-9c48-7900b82b7065",
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
                "x": 688,
                "y": 824
              }
            }
          ],
          "wires": []
        }
      }
    },
    "51b9cf88c750a154b49353272857414fafc78c5e": {
      "package": {
        "name": "Register",
        "version": "",
        "description": "",
        "author": "",
        "image": ""
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "a1b808fc-82af-4985-ad41-55f4d95b7a66",
              "type": "basic.input",
              "data": {
                "name": "QuellReg1",
                "range": "[5:0]",
                "clock": false,
                "size": 6
              },
              "position": {
                "x": 456,
                "y": 224
              }
            },
            {
              "id": "892206be-caea-4813-b605-445dcd779427",
              "type": "basic.input",
              "data": {
                "name": "QuellReg2",
                "range": "[5:0]",
                "clock": false,
                "size": 6
              },
              "position": {
                "x": 448,
                "y": 288
              }
            },
            {
              "id": "b8f0d093-53fa-4444-9246-8351c4234bbf",
              "type": "basic.output",
              "data": {
                "name": "QuellDaten1",
                "range": "[31:0]",
                "size": 32
              },
              "position": {
                "x": 1528,
                "y": 304
              }
            },
            {
              "id": "d3449a5c-f0dc-4952-9612-04e5eb031b42",
              "type": "basic.input",
              "data": {
                "name": "ZielDaten",
                "range": "[31:0]",
                "clock": false,
                "size": 32
              },
              "position": {
                "x": 440,
                "y": 352
              }
            },
            {
              "id": "37f93bb3-455b-44e4-bd70-a8a59802a415",
              "type": "basic.input",
              "data": {
                "name": "ZielReg",
                "range": "[5:0]",
                "clock": false,
                "size": 6
              },
              "position": {
                "x": 440,
                "y": 424
              }
            },
            {
              "id": "a81bee85-0811-40bf-82a9-dbd224184b4c",
              "type": "basic.input",
              "data": {
                "name": "SchreibSignal",
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
                "x": 448,
                "y": 488
              }
            },
            {
              "id": "8bfa2dd1-de46-4329-99d9-ac064d57ce94",
              "type": "basic.output",
              "data": {
                "name": "QuellDaten2",
                "range": "[31:0]",
                "size": 32
              },
              "position": {
                "x": 1536,
                "y": 536
              }
            },
            {
              "id": "7f3a3db0-b1ee-4f1d-8463-ff80051a3d7d",
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
                "x": 440,
                "y": 552
              }
            },
            {
              "id": "439ae457-6bcb-4622-94d9-81bc05834d33",
              "type": "basic.input",
              "data": {
                "name": "clock",
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
                "x": 440,
                "y": 616
              }
            },
            {
              "id": "88c33056-b79a-46ac-8c31-d6790886eed6",
              "type": "basic.code",
              "data": {
                "ports": {
                  "in": [
                    {
                      "name": "QuellRegister1",
                      "range": "[5:0]",
                      "size": 6
                    },
                    {
                      "name": "QuellRegister2",
                      "range": "[5:0]",
                      "size": 6
                    },
                    {
                      "name": "ZielDaten",
                      "range": "[31:0]",
                      "size": 32
                    },
                    {
                      "name": "ZielRegister",
                      "range": "[5:0]",
                      "size": 6
                    },
                    {
                      "name": "Schreibsignal"
                    },
                    {
                      "name": "Reset"
                    },
                    {
                      "name": "Clock"
                    }
                  ],
                  "out": [
                    {
                      "name": "QuellDaten1",
                      "range": "[31:0]",
                      "size": 32
                    },
                    {
                      "name": "QuellDaten2",
                      "range": "[31:0]",
                      "size": 32
                    }
                  ]
                },
                "params": [],
                "code": "reg [31:0] registers [63:0];\n\nassign QuellDaten1 = registers[QuellRegister1];\nassign QuellDaten2 = registers[QuellRegister2];\ninteger i;\n\nalways @(posedge Clock) begin\n    if(Reset) begin\n        for (i = 0; i < 64; i = i + 1) begin\n            registers[i] <= 32'b00000000000000000000000000000000; \n        end\n    end\n    else if(Schreibsignal) begin \n        if(ZielRegister != 0)\n            registers[ZielRegister] <= ZielDaten;\n    end\nend"
              },
              "position": {
                "x": 736,
                "y": 224
              },
              "size": {
                "width": 648,
                "height": 456
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "88c33056-b79a-46ac-8c31-d6790886eed6",
                "port": "QuellDaten2"
              },
              "target": {
                "block": "8bfa2dd1-de46-4329-99d9-ac064d57ce94",
                "port": "in"
              },
              "size": 32
            },
            {
              "source": {
                "block": "88c33056-b79a-46ac-8c31-d6790886eed6",
                "port": "QuellDaten1"
              },
              "target": {
                "block": "b8f0d093-53fa-4444-9246-8351c4234bbf",
                "port": "in"
              },
              "size": 32
            },
            {
              "source": {
                "block": "a1b808fc-82af-4985-ad41-55f4d95b7a66",
                "port": "out"
              },
              "target": {
                "block": "88c33056-b79a-46ac-8c31-d6790886eed6",
                "port": "QuellRegister1"
              },
              "size": 6
            },
            {
              "source": {
                "block": "892206be-caea-4813-b605-445dcd779427",
                "port": "out"
              },
              "target": {
                "block": "88c33056-b79a-46ac-8c31-d6790886eed6",
                "port": "QuellRegister2"
              },
              "size": 6
            },
            {
              "source": {
                "block": "d3449a5c-f0dc-4952-9612-04e5eb031b42",
                "port": "out"
              },
              "target": {
                "block": "88c33056-b79a-46ac-8c31-d6790886eed6",
                "port": "ZielDaten"
              },
              "size": 32
            },
            {
              "source": {
                "block": "37f93bb3-455b-44e4-bd70-a8a59802a415",
                "port": "out"
              },
              "target": {
                "block": "88c33056-b79a-46ac-8c31-d6790886eed6",
                "port": "ZielRegister"
              },
              "size": 6
            },
            {
              "source": {
                "block": "a81bee85-0811-40bf-82a9-dbd224184b4c",
                "port": "out"
              },
              "target": {
                "block": "88c33056-b79a-46ac-8c31-d6790886eed6",
                "port": "Schreibsignal"
              }
            },
            {
              "source": {
                "block": "7f3a3db0-b1ee-4f1d-8463-ff80051a3d7d",
                "port": "out"
              },
              "target": {
                "block": "88c33056-b79a-46ac-8c31-d6790886eed6",
                "port": "Reset"
              }
            },
            {
              "source": {
                "block": "439ae457-6bcb-4622-94d9-81bc05834d33",
                "port": "out"
              },
              "target": {
                "block": "88c33056-b79a-46ac-8c31-d6790886eed6",
                "port": "Clock"
              }
            }
          ]
        }
      }
    },
    "625d79635c0735eb022174bd3b756bc09c6d1186": {
      "package": {
        "name": "ALU",
        "version": "",
        "description": "",
        "author": "",
        "image": ""
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "a44f2dd4-1ea9-4743-b632-e6da11a4ab30",
              "type": "basic.input",
              "data": {
                "name": "Daten1",
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
                "x": 552,
                "y": -736
              }
            },
            {
              "id": "7a0ad72d-1e1f-4a7d-a98f-8af8dedb49e3",
              "type": "basic.input",
              "data": {
                "name": "Daten2",
                "range": "[31:0]",
                "clock": false,
                "size": 32
              },
              "position": {
                "x": 584,
                "y": -200
              }
            },
            {
              "id": "fafd4392-05f5-4020-8989-c06d7e1bdcb3",
              "type": "basic.output",
              "data": {
                "name": "HatFertigGerechnet",
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
                "x": 2856,
                "y": -200
              }
            },
            {
              "id": "cd22b151-94d3-4fb2-8e7f-cbccdf809bf4",
              "type": "basic.input",
              "data": {
                "name": "Funktionscode",
                "virtual": true,
                "range": "[5:0]",
                "pins": [
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
                "x": 536,
                "y": 336
              }
            },
            {
              "id": "821416e3-f3d9-4ed9-8ad7-9f923ca5158a",
              "type": "basic.input",
              "data": {
                "name": "StartSignal",
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
                "x": 608,
                "y": 880
              }
            },
            {
              "id": "0450dc41-6526-407d-bce5-a63817a776ed",
              "type": "basic.output",
              "data": {
                "name": "Ergebnis",
                "range": "[31:0]",
                "size": 32
              },
              "position": {
                "x": 2848,
                "y": 1416
              }
            },
            {
              "id": "cacc8401-cf85-4130-8ab4-f199bdec6f35",
              "type": "basic.input",
              "data": {
                "name": "Reset",
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
                "x": 640,
                "y": 1416
              }
            },
            {
              "id": "71842a6b-f88f-4e17-ad89-bcb5bbd0d523",
              "type": "basic.input",
              "data": {
                "name": "Clock",
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
                "x": 664,
                "y": 1920
              }
            },
            {
              "id": "8dcfc08d-f1e6-4590-8448-c8bd942f1822",
              "type": "basic.code",
              "data": {
                "ports": {
                  "in": [
                    {
                      "name": "Daten1",
                      "range": "[31:0]",
                      "size": 32
                    },
                    {
                      "name": "Daten2",
                      "range": "[31:0]",
                      "size": 32
                    },
                    {
                      "name": "FunktionsCode",
                      "range": "[5:0]",
                      "size": 6
                    },
                    {
                      "name": "StartSignal"
                    },
                    {
                      "name": "Reset"
                    },
                    {
                      "name": "Clock"
                    }
                  ],
                  "out": [
                    {
                      "name": "HatFertigGerechnet"
                    },
                    {
                      "name": "Ergebnis",
                      "range": "[31:0]",
                      "size": 32
                    }
                  ]
                },
                "params": [],
                "code": "`include \"../Prozessor/ALUModule/Intsqrt.v\"\n`include \"../Prozessor/ALUModule/verilog-math-master_FLOAT_/components/add.v\"\n`include \"../Prozessor/ALUModule/verilog-math-master_FLOAT_/components/mul.v\"\n`include \"../Prozessor/ALUModule/verilog-math-master_FLOAT_/components/sqrt.v\"\n`include \"../Prozessor/ALUModule/verilog-math-master_FLOAT_/components/div.v\"\n`include \"../Prozessor/ALUModule/verilog-math-master_FLOAT_/components/eq.v\"\n`include \"../Prozessor/ALUModule/verilog-math-master_FLOAT_/components/gt.v\"\n`include \"../Prozessor/ALUModule/verilog-math-master_FLOAT_/components/lt.v\"\n`include \"../Prozessor/ALUModule/verilog-math-master_FLOAT_/components/int_to_single.v\"\n`include \"../Prozessor/ALUModule/verilog-math-master_FLOAT_/components/unsigned_int_to_single.v\"\n`include \"../Prozessor/ALUModule/verilog-math-master_FLOAT_/components/single_to_int.v\"\n`include \"../Prozessor/ALUModule/verilog-math-master_FLOAT_/components/single_to_unsigned_int.v\"\n\n\nreg[31:0] Radikand; //Wurzel\nreg[7:0] TakteBisFertig = 0;\nwire[31:0] FloatAdditionDaten2;\nwire[31:0] EinfacheRechnungErgebnis;\nwire[31:0] DivisionErgebnis; //Div und Mod\nwire[31:0] WurzelErgebnis;\nwire[31:0] IntZuFloatErgebnis;\nwire[31:0] UnsignedIntZuFloatErgebnis;\nwire[31:0] AdditionFloatErgebnis;\nwire[31:0] MultiplikationFloatErgebnis;\nwire[31:0] WurzelFloatErgebnis;\nwire[31:0] DivisionFloatErgebnis;\nwire[31:0] FloatZuIntErgebnis;\nwire[31:0] FloatZuUnsignedIntErgebnis;\nwire FloatGleichheitErgebnis;\nwire FloatGroesserErgebnis;\nwire FloatKleinerErgebnis;\nwire WurzelFertig;\nwire DivisionFertig;\nwire DivisionInArbeit;\nwire IntWurzelReset;\n\n//Int Arithmetik\nlocalparam IntAddition =        6'b000000;\nlocalparam IntSubtraktion =     6'b000001;\nlocalparam IntMultiplikation =  6'b000010;\nlocalparam IntQuadratwurzel =   6'b000011;\nlocalparam IntDivision =        6'b000100;\nlocalparam IntModulo =          6'b000101;\nlocalparam LinksSchiebenArithm =6'b000110;\nlocalparam RechtsSchiebenArithm=6'b000111;\nlocalparam Gleichheit =         6'b001000;\nlocalparam Ungleichheit =       6'b001001;\nlocalparam Groesser =           6'b001010;\nlocalparam Kleiner =            6'b001011;\nlocalparam GroesserUnsigned =   6'b001100;\nlocalparam KleinerUnsigned =    6'b001101;\nlocalparam IntZuFloat =         6'b001110;\nlocalparam UnsignedIntZuFloat = 6'b001111;\n\n//Logik\nlocalparam Verneinung =         6'b010000;\nlocalparam Und =                6'b010001;\nlocalparam Oder =               6'b010010;\nlocalparam Ungleich =           6'b010011;\nlocalparam Gleich =             6'b010100;\nlocalparam LinksSchiebenLogik = 6'b010110;\nlocalparam RechtsSchiebenLogik =6'b010111;\n\n//Float Arithmetik\nlocalparam FloatAddition =        6'b100000;\nlocalparam FloatSubtraktion =     6'b100001;\nlocalparam FloatMultiplikation =  6'b100010;\nlocalparam FloatQuadratwurzel =   6'b100011;\nlocalparam FloatDivision =        6'b100100;\nlocalparam FloatGleichheit =      6'b101000;\nlocalparam FloatUngleichheit =    6'b101001;\nlocalparam FloatGroesser =        6'b101010;\nlocalparam FloatKleiner =         6'b101011;\nlocalparam FloatZuInt =           6'b101110;\nlocalparam FloatZuUnsignedInt =   6'b101111;\n\nIntsqrt QuadratModul(\n    .Clock(Clock),\n    .Reset(IntWurzelReset),\n    .Num_in(Radikand),\n    .Done(WurzelFertig),\n    .Sq_root(WurzelErgebnis)\n);\n\nint_to_single IntZuFloatMacher(\n    .clk(Clock),\n    .int_to_single_a(Daten1),\n    .int_to_single_z(IntZuFloatErgebnis)\n);\n\nunsigned_int_to_single UnsignedIntZuFloatMacher(\n    .clk(Clock),\n    .unsigned_int_to_single_a(Daten1),\n    .unsigned_int_to_single_z(UnsignedIntZuFloatErgebnis)\n);\n\nadd FloatAddierer(\n    .clk(Clock),\n    .add_a(Daten1),\n    .add_b(FloatAdditionDaten2),\n    .add_z(AdditionFloatErgebnis)\n);\n\nmul FloatMultiplizierer(\n    .clk(Clock),\n    .mul_a(Daten1),\n    .mul_b(Daten2),\n    .mul_z(MultiplikationFloatErgebnis)\n);\n\nsqrt FloatWurzeler(\n    .clk(Clock),\n    .sqrt_a(Daten1),\n    .sqrt_z(WurzelFloatErgebnis)\n);\n\ndiv FloatDividierer(\n    .clk(Clock),\n    .div_a(Daten1),\n    .div_b(Daten2),\n    .div_z(DivisionFloatErgebnis)\n);\n\neq FloatVergleicherGleich(\n    .clk(Clock),\n    .eq_a(Daten1),\n    .eq_b(Daten2),\n    .eq_z(FloatGleichheitErgebnis)\n);\n\ngt FloatVergleicherGroesser(\n    .clk(Clock),\n    .gt_a(Daten1),\n    .gt_b(Daten2),\n    .gt_z(FloatGroesserErgebnis)\n);\n\nlt FloatVergleicherKleiner(\n    .clk(Clock),\n    .lt_a(Daten1),\n    .lt_b(Daten2),\n    .lt_z(FloatKleinerErgebnis)\n);\n\nsingle_to_int FloatZuIntMacher(\n    .clk(Clock),\n    .single_to_int_a(Daten1),\n    .single_to_int_z(FloatZuIntErgebnis)\n);\n\nsingle_to_unsigned_int FloatZuUnsignedIntMacher(\n    .clk(Clock),\n    .single_to_unsigned_int_a(Daten1),\n    .single_to_unsigned_int_z(FloatZuUnsignedIntErgebnis)\n);\n\nassign EinfacheRechnungErgebnis =   FunktionsCode[5:0] == IntAddition           ? $signed(Daten1) + $signed(Daten2) :\n                                    FunktionsCode[5:0] == IntSubtraktion        ? $signed(Daten1) - $signed(Daten2) :\n                                    FunktionsCode[5:0] == IntMultiplikation     ? $signed(Daten1) * $signed(Daten2) :\n                                    FunktionsCode[5:0] == IntDivision           ? $signed(Daten1) / $signed(Daten2) :\n                                    FunktionsCode[5:0] == IntModulo             ? $signed(Daten1) % $signed(Daten2) :\n                                    FunktionsCode[5:0] == LinksSchiebenArithm   ? $signed(Daten1) <<< $signed(Daten2) :\n                                    FunktionsCode[5:0] == RechtsSchiebenArithm  ? $signed(Daten1) >>> $signed(Daten2) :\n                                    FunktionsCode[5:0] == Gleichheit            ? $signed({31'b0, Daten1 == Daten2})  : \n                                    FunktionsCode[5:0] == Ungleichheit          ? $signed({31'b0, Daten1 != Daten2})  :\n                                    FunktionsCode[5:0] == Groesser              ? $signed({31'b0, $signed(Daten1) > $signed(Daten2)})  :     \n                                    FunktionsCode[5:0] == Kleiner               ? $signed({31'b0, $signed(Daten1) < $signed(Daten2)})  :\n                                    FunktionsCode[5:0] == GroesserUnsigned      ? $signed({31'b0, Daten1 > Daten2}) : \n                                    FunktionsCode[5:0] == KleinerUnsigned       ? $signed({31'b0, Daten1 < Daten2}) : \n                                    FunktionsCode[5:0] == Verneinung            ? $signed(~Daten1) : \n                                    FunktionsCode[5:0] == Und                   ? $signed(Daten1 & Daten2) :        \n                                    FunktionsCode[5:0] == Oder                  ? $signed(Daten1 | Daten2) :       \n                                    FunktionsCode[5:0] == Ungleich              ? $signed(Daten1 ^ Daten2) :   \n                                    FunktionsCode[5:0] == Gleich                ? $signed(Daten1 ~^ Daten2) :\n                                    FunktionsCode[5:0] == LinksSchiebenLogik    ? $signed(Daten1 << $signed(Daten2)) :\n                                    FunktionsCode[5:0] == RechtsSchiebenLogik   ? $signed(Daten1 >> $signed(Daten2)) : $signed(0);\n\nassign Ergebnis =   FunktionsCode[5:0] == IntQuadratwurzel ? WurzelErgebnis :\n                    FunktionsCode[5:0] == IntZuFloat ? IntZuFloatErgebnis :\n                    FunktionsCode[5:0] == UnsignedIntZuFloat ? UnsignedIntZuFloatErgebnis :\n                    FunktionsCode[5:0] == FloatAddition ? AdditionFloatErgebnis :\n                    FunktionsCode[5:0] == FloatSubtraktion ? AdditionFloatErgebnis :\n                    FunktionsCode[5:0] == FloatMultiplikation ? MultiplikationFloatErgebnis :\n                    FunktionsCode[5:0] == FloatQuadratwurzel ? WurzelFloatErgebnis :\n                    FunktionsCode[5:0] == FloatDivision ? DivisionFloatErgebnis :\n                    FunktionsCode[5:0] == FloatGleichheit ? {31'b0, FloatGleichheitErgebnis} :\n                    FunktionsCode[5:0] == FloatUngleichheit ? {31'b0, ~FloatGleichheitErgebnis} :\n                    FunktionsCode[5:0] == FloatGroesser ? {31'b0, FloatGroesserErgebnis} :\n                    FunktionsCode[5:0] == FloatKleiner ? {31'b0, FloatKleinerErgebnis} :\n                    FunktionsCode[5:0] == FloatZuInt ? {31'b0, FloatZuIntErgebnis} :\n                    FunktionsCode[5:0] == FloatZuUnsignedInt ? {31'b0, FloatZuUnsignedIntErgebnis} :\n                    EinfacheRechnungErgebnis;\n\nassign HatFertigGerechnet =     (FunktionsCode[5:0]==IntQuadratwurzel)?(WurzelFertig):(TakteBisFertig == 0);\n\nassign IntWurzelReset =         ((FunktionsCode[5:0] == IntQuadratwurzel & StartSignal) || FunktionsCode[5:0] != IntQuadratwurzel) | Reset;\n\nassign FloatAdditionDaten2 =    {(FunktionsCode[5:0] != FloatAddition),Daten2[30:0]};\n\n\nalways @(posedge Reset or posedge Clock) begin\n    if(Reset) begin\n        Radikand <= 0;\n        TakteBisFertig <= 0;\n    end else if(TakteBisFertig != 0) begin\n        TakteBisFertig <= TakteBisFertig - 1;\n    end\n    else if (StartSignal) begin\n        Radikand <= Daten1;\n        case (FunktionsCode[5:0])\n            IntZuFloat : begin\n                TakteBisFertig <= 4;\n            end\n            UnsignedIntZuFloat : begin\n                TakteBisFertig <= 4;\n            end\n            //Float Arithmetik\n            //Add.s\n            6'b100000: begin\n                TakteBisFertig <= 6;\n            end\n            //Sub.s \n            6'b100001: begin \n                TakteBisFertig <= 6;\n            end\n            //Mul.s\n            6'b100010    : begin \n                TakteBisFertig <= 8;\n            end\n            //Sqrt.s\n            6'b100011    : begin \n                TakteBisFertig <= 9;\n            end\n            //Div.s\n            6'b100100    : begin \n                TakteBisFertig <= 31;\n            end\n            //Cg.s\n            6'b101010\t: begin\n                TakteBisFertig <= 6;\n            end\n            //Cl.s\n            6'b101011\t: begin\n                TakteBisFertig <= 6;\n            end\n            FloatZuInt : begin\n                TakteBisFertig <= 1;\n            end\n            default : begin\n                TakteBisFertig <= 0;\n            end\n        endcase\n    end  "
              },
              "position": {
                "x": 872,
                "y": -976
              },
              "size": {
                "width": 1696,
                "height": 3232
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "cacc8401-cf85-4130-8ab4-f199bdec6f35",
                "port": "out"
              },
              "target": {
                "block": "8dcfc08d-f1e6-4590-8448-c8bd942f1822",
                "port": "Reset"
              }
            },
            {
              "source": {
                "block": "71842a6b-f88f-4e17-ad89-bcb5bbd0d523",
                "port": "out"
              },
              "target": {
                "block": "8dcfc08d-f1e6-4590-8448-c8bd942f1822",
                "port": "Clock"
              }
            },
            {
              "source": {
                "block": "8dcfc08d-f1e6-4590-8448-c8bd942f1822",
                "port": "HatFertigGerechnet"
              },
              "target": {
                "block": "fafd4392-05f5-4020-8989-c06d7e1bdcb3",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "7a0ad72d-1e1f-4a7d-a98f-8af8dedb49e3",
                "port": "out"
              },
              "target": {
                "block": "8dcfc08d-f1e6-4590-8448-c8bd942f1822",
                "port": "Daten2"
              },
              "size": 32
            },
            {
              "source": {
                "block": "cd22b151-94d3-4fb2-8e7f-cbccdf809bf4",
                "port": "out"
              },
              "target": {
                "block": "8dcfc08d-f1e6-4590-8448-c8bd942f1822",
                "port": "FunktionsCode"
              },
              "size": 6
            },
            {
              "source": {
                "block": "821416e3-f3d9-4ed9-8ad7-9f923ca5158a",
                "port": "out"
              },
              "target": {
                "block": "8dcfc08d-f1e6-4590-8448-c8bd942f1822",
                "port": "StartSignal"
              }
            },
            {
              "source": {
                "block": "8dcfc08d-f1e6-4590-8448-c8bd942f1822",
                "port": "Ergebnis"
              },
              "target": {
                "block": "0450dc41-6526-407d-bce5-a63817a776ed",
                "port": "in"
              },
              "size": 32
            },
            {
              "source": {
                "block": "a44f2dd4-1ea9-4743-b632-e6da11a4ab30",
                "port": "out"
              },
              "target": {
                "block": "8dcfc08d-f1e6-4590-8448-c8bd942f1822",
                "port": "Daten1"
              },
              "size": 32
            }
          ]
        }
      }
    },
    "aa9caf8ebcb7b0229e1a641e9bda55962d23528d": {
      "package": {
        "name": "MultiplexerZielDaten",
        "version": "",
        "description": "Multiplext Datan von der ALU, vom RAM und vom Immediate Operand",
        "author": "",
        "image": ""
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "6c5c6aaa-2fb6-40f4-910c-fa001a1cf5fd",
              "type": "basic.input",
              "data": {
                "name": "ALUErgebnis",
                "range": "[31:0]",
                "clock": false,
                "size": 32
              },
              "position": {
                "x": 728,
                "y": 536
              }
            },
            {
              "id": "d91193b7-11e3-48ac-b2f5-08dd974d73e2",
              "type": "basic.input",
              "data": {
                "name": "AktuellePC",
                "virtual": true,
                "range": "[25:0]",
                "pins": [
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
                "x": 720,
                "y": 584
              }
            },
            {
              "id": "b7f8b7e9-59b8-4991-a6c1-51593d688b58",
              "type": "basic.output",
              "data": {
                "name": "ZielDaten",
                "range": "[31:0]",
                "size": 32
              },
              "position": {
                "x": 1656,
                "y": 640
              }
            },
            {
              "id": "95777557-33b9-4fae-8324-55ca8d0ea6c8",
              "type": "basic.input",
              "data": {
                "name": "LoadErgebnis",
                "range": "[31:0]",
                "clock": false,
                "size": 32
              },
              "position": {
                "x": 720,
                "y": 640
              }
            },
            {
              "id": "6d9a9010-9997-45ca-9724-9b5b4fc74839",
              "type": "basic.input",
              "data": {
                "name": "JALBefehl",
                "clock": false
              },
              "position": {
                "x": 720,
                "y": 688
              }
            },
            {
              "id": "66cf6051-c4f5-490a-9570-8d4da9276ef3",
              "type": "basic.input",
              "data": {
                "name": "LoadBefehl",
                "clock": false
              },
              "position": {
                "x": 728,
                "y": 736
              }
            },
            {
              "id": "19838716-171d-40bc-bc44-06e0f2a2bc8e",
              "type": "basic.code",
              "data": {
                "ports": {
                  "in": [
                    {
                      "name": "ALUErgebnis",
                      "range": "[31:0]",
                      "size": 32
                    },
                    {
                      "name": "AktuellerPC",
                      "range": "[25:0]",
                      "size": 26
                    },
                    {
                      "name": "LoadErgebnis",
                      "range": "[31:0]",
                      "size": 32
                    },
                    {
                      "name": "JALBefehl"
                    },
                    {
                      "name": "LoadBefehl"
                    }
                  ],
                  "out": [
                    {
                      "name": "ZielDaten",
                      "range": "[31:0]",
                      "size": 32
                    }
                  ]
                },
                "params": [],
                "code": " assign ZielDaten = (JALBefehl==1'b1)? {6'b0,AktuellerPC}:\n                    ((LoadBefehl==1'b1)? LoadErgebnis:\n                    ALUErgebnis);\n"
              },
              "position": {
                "x": 976,
                "y": 544
              },
              "size": {
                "width": 528,
                "height": 248
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "19838716-171d-40bc-bc44-06e0f2a2bc8e",
                "port": "ZielDaten"
              },
              "target": {
                "block": "b7f8b7e9-59b8-4991-a6c1-51593d688b58",
                "port": "in"
              },
              "size": 32
            },
            {
              "source": {
                "block": "6c5c6aaa-2fb6-40f4-910c-fa001a1cf5fd",
                "port": "out"
              },
              "target": {
                "block": "19838716-171d-40bc-bc44-06e0f2a2bc8e",
                "port": "ALUErgebnis"
              },
              "size": 32
            },
            {
              "source": {
                "block": "d91193b7-11e3-48ac-b2f5-08dd974d73e2",
                "port": "out"
              },
              "target": {
                "block": "19838716-171d-40bc-bc44-06e0f2a2bc8e",
                "port": "AktuellerPC"
              },
              "size": 26
            },
            {
              "source": {
                "block": "95777557-33b9-4fae-8324-55ca8d0ea6c8",
                "port": "out"
              },
              "target": {
                "block": "19838716-171d-40bc-bc44-06e0f2a2bc8e",
                "port": "LoadErgebnis"
              },
              "size": 32
            },
            {
              "source": {
                "block": "6d9a9010-9997-45ca-9724-9b5b4fc74839",
                "port": "out"
              },
              "target": {
                "block": "19838716-171d-40bc-bc44-06e0f2a2bc8e",
                "port": "JALBefehl"
              }
            },
            {
              "source": {
                "block": "66cf6051-c4f5-490a-9570-8d4da9276ef3",
                "port": "out"
              },
              "target": {
                "block": "19838716-171d-40bc-bc44-06e0f2a2bc8e",
                "port": "LoadBefehl"
              }
            }
          ]
        }
      }
    },
    "1215e7c917c45969312f4d1b2e4c239094400d4c": {
      "package": {
        "name": "Bedingungsprüfer",
        "version": "",
        "description": "Vornort alle Bits und gibt das Ergebnis aus",
        "author": "",
        "image": ""
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "0fe5550a-6ffd-4cc7-8fcc-3a62a6c8c2c4",
              "type": "basic.input",
              "data": {
                "name": "Eingang",
                "range": "[31:0]",
                "clock": false,
                "size": 32
              },
              "position": {
                "x": 616,
                "y": 104
              }
            },
            {
              "id": "b0cef370-f1b8-40aa-9372-37c6e08dc3dd",
              "type": "basic.output",
              "data": {
                "name": "Ergebnis",
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
                "x": 1168,
                "y": 304
              }
            },
            {
              "id": "da29e25a-f215-4ae3-a9a6-7ef8aa9b30bb",
              "type": "basic.input",
              "data": {
                "name": "GleichNullPrüfen",
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
                "x": 616,
                "y": 312
              }
            }
          ],
          "wires": []
        }
      }
    },
    "ef4843571745ee7cf39510612ba7bd08ba00fb02": {
      "package": {
        "name": "MultiplexerAluDaten",
        "version": "",
        "description": "Multiplext die möglichen ALU Eingänge (Register, kleiner und großer Immediate)",
        "author": "",
        "image": ""
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "3128ddd7-9d74-4768-aa0e-fc956aa0734d",
              "type": "basic.input",
              "data": {
                "name": "RegisterDaten2",
                "range": "[31:0]",
                "clock": false,
                "size": 32
              },
              "position": {
                "x": 568,
                "y": 1440
              }
            },
            {
              "id": "d7d5b5c0-0edd-452c-a3cb-dd61710939c1",
              "type": "basic.input",
              "data": {
                "name": "Immediate",
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
                "x": 568,
                "y": 1496
              }
            },
            {
              "id": "7aa4c854-00a8-436d-9729-901eeb493bb7",
              "type": "basic.output",
              "data": {
                "name": "Daten2",
                "range": "[31:0]",
                "size": 32
              },
              "position": {
                "x": 1664,
                "y": 1496
              }
            },
            {
              "id": "081e5dbe-2409-4488-9430-fc8ae8d66ee3",
              "type": "basic.input",
              "data": {
                "name": "ImmediateAktiv",
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
                "x": 568,
                "y": 1552
              }
            },
            {
              "id": "817cd645-9e8f-4b33-8eda-25f848d3b33f",
              "type": "basic.code",
              "data": {
                "ports": {
                  "in": [
                    {
                      "name": "RegisterDaten2",
                      "range": "[31:0]",
                      "size": 32
                    },
                    {
                      "name": "Immediate",
                      "range": "[31:0]",
                      "size": 32
                    },
                    {
                      "name": "ImmediateAktiv"
                    }
                  ],
                  "out": [
                    {
                      "name": "Daten2",
                      "range": "[31:0]",
                      "size": 32
                    }
                  ]
                },
                "params": [],
                "code": " assign Daten2 = (ImmediateAktiv==1'b1)? Immediate:\n                    RegisterDaten2;\n"
              },
              "position": {
                "x": 872,
                "y": 1448
              },
              "size": {
                "width": 624,
                "height": 160
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "817cd645-9e8f-4b33-8eda-25f848d3b33f",
                "port": "Daten2"
              },
              "target": {
                "block": "7aa4c854-00a8-436d-9729-901eeb493bb7",
                "port": "in"
              },
              "size": 32
            },
            {
              "source": {
                "block": "3128ddd7-9d74-4768-aa0e-fc956aa0734d",
                "port": "out"
              },
              "target": {
                "block": "817cd645-9e8f-4b33-8eda-25f848d3b33f",
                "port": "RegisterDaten2"
              },
              "size": 32
            },
            {
              "source": {
                "block": "d7d5b5c0-0edd-452c-a3cb-dd61710939c1",
                "port": "out"
              },
              "target": {
                "block": "817cd645-9e8f-4b33-8eda-25f848d3b33f",
                "port": "Immediate"
              },
              "size": 32
            },
            {
              "source": {
                "block": "081e5dbe-2409-4488-9430-fc8ae8d66ee3",
                "port": "out"
              },
              "target": {
                "block": "817cd645-9e8f-4b33-8eda-25f848d3b33f",
                "port": "ImmediateAktiv"
              }
            }
          ]
        }
      }
    },
    "433ce5316c1247a4e0a16f5007c3b5cf1c56a0e3": {
      "package": {
        "name": "MultiplexerNeuerPc",
        "version": "",
        "description": "Multiplext relative und absolute neue PCs. Die Bits 31 bis 26 werden ignoriert",
        "author": "",
        "image": ""
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "a77b057e-811a-485a-b162-fd25b67e44b2",
              "type": "basic.input",
              "data": {
                "name": "RelativerPC",
                "range": "[31:0]",
                "clock": false,
                "size": 32
              },
              "position": {
                "x": 504,
                "y": -16
              }
            },
            {
              "id": "a68c98f1-ec9c-4375-ad28-160635fda5c8",
              "type": "basic.output",
              "data": {
                "name": "NeuerPC",
                "range": "[25:0]",
                "size": 26
              },
              "position": {
                "x": 1472,
                "y": 680
              }
            },
            {
              "id": "32347a79-d57f-4d2c-9522-ea070c5126cd",
              "type": "basic.input",
              "data": {
                "name": "AbsoluterPC",
                "range": "[31:0]",
                "clock": false,
                "size": 32
              },
              "position": {
                "x": 504,
                "y": 1088
              }
            },
            {
              "id": "994bee7c-b7fa-4989-a1a2-e6d7f1e16e5c",
              "type": "basic.input",
              "data": {
                "name": "IstAbsolut",
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
                "x": 504,
                "y": 2216
              }
            }
          ],
          "wires": []
        }
      }
    },
    "26af9a43487ae90923261d1771fd552a03494500": {
      "package": {
        "name": "MultiplexerAluDaten2",
        "version": "",
        "description": "Multiplext den aktuellen PC mit den Quelldaten2",
        "author": "",
        "image": ""
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "49cdeb8d-fdde-46cb-8b43-67fc607de353",
              "type": "basic.input",
              "data": {
                "name": "AktuellerPC",
                "range": "[25:0]",
                "clock": false,
                "size": 26
              },
              "position": {
                "x": 480,
                "y": 312
              }
            },
            {
              "id": "fee8ac0d-c6f4-48ce-a75d-2a904ebd1296",
              "type": "basic.output",
              "data": {
                "name": "Daten1",
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
                ]
              },
              "position": {
                "x": 1520,
                "y": 368
              }
            },
            {
              "id": "d6c04894-ff4c-4827-b35d-7dbd31a34e4f",
              "type": "basic.input",
              "data": {
                "name": "QuellDaten1",
                "range": "[31:0]",
                "clock": false,
                "size": 32
              },
              "position": {
                "x": 488,
                "y": 368
              }
            },
            {
              "id": "7461aa4d-447c-46cc-92b2-f437b6fb7557",
              "type": "basic.input",
              "data": {
                "name": "RelativerSprungBefehl",
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
                "x": 424,
                "y": 424
              }
            },
            {
              "id": "27468064-edc5-49e1-887d-f31db8030d87",
              "type": "basic.code",
              "data": {
                "ports": {
                  "in": [
                    {
                      "name": "AktuellerPC",
                      "range": "[25:0]",
                      "size": 26
                    },
                    {
                      "name": "QuellDaten1",
                      "range": "[31:0]",
                      "size": 32
                    },
                    {
                      "name": "RelativerSprungBefehl"
                    }
                  ],
                  "out": [
                    {
                      "name": "Daten1",
                      "range": "[31:0]",
                      "size": 32
                    }
                  ]
                },
                "params": [],
                "code": " assign Daten1 = (RelativerSprungBefehl==1'b1)? {6'b0,AktuellerPC}:\n                    QuellDaten1;\n"
              },
              "position": {
                "x": 712,
                "y": 320
              },
              "size": {
                "width": 640,
                "height": 160
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "49cdeb8d-fdde-46cb-8b43-67fc607de353",
                "port": "out"
              },
              "target": {
                "block": "27468064-edc5-49e1-887d-f31db8030d87",
                "port": "AktuellerPC"
              },
              "size": 26
            },
            {
              "source": {
                "block": "d6c04894-ff4c-4827-b35d-7dbd31a34e4f",
                "port": "out"
              },
              "target": {
                "block": "27468064-edc5-49e1-887d-f31db8030d87",
                "port": "QuellDaten1"
              },
              "size": 32
            },
            {
              "source": {
                "block": "7461aa4d-447c-46cc-92b2-f437b6fb7557",
                "port": "out"
              },
              "target": {
                "block": "27468064-edc5-49e1-887d-f31db8030d87",
                "port": "RelativerSprungBefehl"
              }
            },
            {
              "source": {
                "block": "27468064-edc5-49e1-887d-f31db8030d87",
                "port": "Daten1"
              },
              "target": {
                "block": "fee8ac0d-c6f4-48ce-a75d-2a904ebd1296",
                "port": "in"
              },
              "size": 32
            }
          ]
        }
      }
    },
    "01f8f2c1fde6577d48cde920614264880126d824": {
      "package": {
        "name": "SDKartenLeser",
        "version": "",
        "description": "",
        "author": "",
        "image": ""
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "2a16efdb-dbf0-4759-99a3-c4df7acdf174",
              "type": "basic.output",
              "data": {
                "name": "Daten",
                "range": "[31:0]",
                "size": 32
              },
              "position": {
                "x": 1288,
                "y": 1024
              }
            },
            {
              "id": "ee6f7fb6-9ed5-41c3-ba4f-5377420e9069",
              "type": "basic.input",
              "data": {
                "name": "Reset",
                "clock": false
              },
              "position": {
                "x": -944,
                "y": 1176
              }
            },
            {
              "id": "6f91f091-edad-4b87-a54f-6a2feb25a3bd",
              "type": "basic.output",
              "data": {
                "name": "Fertig"
              },
              "position": {
                "x": 1280,
                "y": 1272
              }
            },
            {
              "id": "63a4ce61-b607-40bd-86f2-e20a1b374caa",
              "type": "basic.input",
              "data": {
                "name": "Adresse",
                "range": "[31:0]",
                "clock": false,
                "size": 32
              },
              "position": {
                "x": -456,
                "y": 1368
              }
            },
            {
              "id": "ac40a621-56b2-4a76-b143-ff307cf87475",
              "type": "basic.output",
              "data": {
                "name": "Busy"
              },
              "position": {
                "x": 1304,
                "y": 1528
              }
            },
            {
              "id": "e0020276-1e65-47ef-9d93-ef139d794158",
              "type": "basic.input",
              "data": {
                "name": "Lesen",
                "clock": false
              },
              "position": {
                "x": -440,
                "y": 1560
              }
            },
            {
              "id": "feb64e99-40ce-42dd-be64-902af731b2e2",
              "type": "basic.output",
              "data": {
                "name": "zustand",
                "range": "[2:0]",
                "size": 3
              },
              "position": {
                "x": 1304,
                "y": 1776
              }
            },
            {
              "id": "217b056b-2046-47ed-adf5-1f29bd35093c",
              "type": "basic.input",
              "data": {
                "name": "miso",
                "clock": false
              },
              "position": {
                "x": -80,
                "y": 2664
              }
            },
            {
              "id": "1610f71c-80ad-4265-88d1-c57be0e5951b",
              "type": "basic.output",
              "data": {
                "name": "cs"
              },
              "position": {
                "x": 664,
                "y": 2664
              }
            },
            {
              "id": "1a2c2fd1-a3cc-4407-91de-8bd0f7453c88",
              "type": "basic.output",
              "data": {
                "name": "mosi"
              },
              "position": {
                "x": 568,
                "y": 2696
              }
            },
            {
              "id": "8e752b41-3cc1-404b-9178-0897a60f8dae",
              "type": "basic.output",
              "data": {
                "name": "sclk"
              },
              "position": {
                "x": 664,
                "y": 2728
              }
            },
            {
              "id": "e85fe67c-e3f9-4346-8ad3-3031acc0ec82",
              "type": "basic.input",
              "data": {
                "name": "Clock",
                "clock": false
              },
              "position": {
                "x": -1176,
                "y": 2888
              }
            },
            {
              "id": "07fb7850-bd51-4008-9054-ff794e6f5160",
              "type": "basic.output",
              "data": {
                "name": "debug",
                "range": "[4:0]",
                "size": 5
              },
              "position": {
                "x": 1016,
                "y": 2888
              }
            },
            {
              "id": "f8ffbc64-4ed1-461c-b27b-15c0d9852f10",
              "type": "1b8ab98e773cb563b465d56ba7db890d25c1a504",
              "position": {
                "x": 376,
                "y": 2680
              },
              "size": {
                "width": 96,
                "height": 256
              }
            },
            {
              "id": "c41b053d-dce6-4ccb-b941-c20aab20eff3",
              "type": "c4dd08263a85a91ba53e2ae2b38de344c5efcb52",
              "position": {
                "x": -96,
                "y": 2736
              },
              "size": {
                "width": 96,
                "height": 64
              }
            },
            {
              "id": "13a1c4e0-6ee6-4fb9-9d93-89109c324a10",
              "type": "basic.code",
              "data": {
                "ports": {
                  "in": [],
                  "out": [
                    {
                      "name": "din",
                      "range": "[7:0]",
                      "size": 8
                    }
                  ]
                },
                "params": [],
                "code": "reg din = 8'b0;"
              },
              "position": {
                "x": -688,
                "y": 2776
              },
              "size": {
                "width": 192,
                "height": 64
              }
            },
            {
              "id": "e267ddb2-9395-44eb-b46c-c6a93b3d137b",
              "type": "basic.code",
              "data": {
                "ports": {
                  "in": [
                    {
                      "name": "Clock"
                    },
                    {
                      "name": "Reset"
                    },
                    {
                      "name": "Adresse",
                      "range": "[31:0]",
                      "size": 32
                    },
                    {
                      "name": "Lesen"
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
                      "name": "ready"
                    },
                    {
                      "name": "egal"
                    }
                  ],
                  "out": [
                    {
                      "name": "Daten",
                      "range": "[31:0]",
                      "size": 32
                    },
                    {
                      "name": "Fertig"
                    },
                    {
                      "name": "Busy"
                    },
                    {
                      "name": "zustand",
                      "range": "[2:0]",
                      "size": 3
                    },
                    {
                      "name": "rd"
                    },
                    {
                      "name": "sektorAdresse",
                      "range": "[31:0]",
                      "size": 32
                    }
                  ]
                },
                "params": [],
                "code": "reg [31:0] Daten; //Gelesene Daten. Ist erst gültig, wenn [Fertig] oben ist\nreg Fertig; //Daten an [Daten] sind gültig\nreg Busy; //Wenn oben, können Leseanfragen über [Lesen] gesendet werden\n\n\n    // Zustandsdefinitionen für den SD-Controller\n    localparam INITIALISIEREN = 3'd0;\n    localparam IDLE = 3'd1;\n    localparam BYTE1 = 3'd2;\n    localparam BYTE2 = 3'd3;\n    localparam BYTE3 = 3'd4;\n    localparam BYTE4 = 3'd5;\n    localparam SEKTORFERTIGLESEN = 3'd6;\n\n    // SD CARD INPUTS/OUTPUTS\n    reg rd = 0; // Read signal for SD card\n    wire [31:0] sektorAdresse;\n    reg [2:0] state = IDLE;\n    reg [8:0] byteZaehler = 0;\n\n    assign zustand = state;\n    assign sektorAdresse = {Adresse[29:6], 8'b0}; \n    //Adresse wird von 8-Bit auf 32-Bit Bytes konvertiert, für Sektoradresse werden die ersten 9 Bits ignoriert\n\n\n    always @(posedge Clock or posedge Reset) begin\n        if(Reset)\n            byteZaehler <= 0;\n        else begin\n            if((state != IDLE) && byte_available)\n                byteZaehler <= byteZaehler + 1;\n            else if (state == IDLE) begin\n                byteZaehler <= 0;\n            end\n        end\n\n    end\n\n    // Zustandsautomat für den SD-Controller\n    always @(posedge Clock) begin\n        if (Reset) begin\n            Daten <= 0;\n            Fertig <= 0;\n            state <= INITIALISIEREN;\n            rd <= 0;\n            Busy <= 1;\n        end else begin\n            case (state)\n                INITIALISIEREN:begin\n                    Busy <= 1;\n                    if(ready) begin\n                        state = IDLE;\n                    end\n                end\n                IDLE: begin\n                    Busy <= 0;\n                    if (Lesen && ready) begin\n                        state <= BYTE1;\n                        Busy <= 1;\n                        rd <= 1;\n                    end\n                end\n                BYTE1: begin\n                    Busy <= 1;\n                    if (byteZaehler == (Adresse[6:0] << 2) && byte_available) begin\n                        Daten[31:24] <= dout;\n                        state <= BYTE2;\n                    end\n                end\n                BYTE2: begin\n                    Busy <= 1;\n                    if (byte_available) begin\n                        Daten[23:16] <= dout;\n                        state <= BYTE3;\n                    end\n                end\n                BYTE3: begin\n                    Busy <= 1;\n                    if (byte_available) begin\n                        Daten[15:8] <= dout;\n                        state <= BYTE4;\n                    end\n                end\n                BYTE4: begin\n                    Busy <= 1;\n                    if (byte_available) begin\n                        Daten[7:0] <= dout;\n                        rd <= 0;\n                        Fertig <= 1;\n                        state <= SEKTORFERTIGLESEN;\n                    end\n                end\n                SEKTORFERTIGLESEN: begin\n                    if(byteZaehler == 9'd0) begin\n                        Busy <= 0;\n                        state <= IDLE;\n                        rd <= 0;\n                        Fertig <= 0;\n                    end\n                end\n                default: state <= IDLE;\n            endcase\n        end\n    end\n"
              },
              "position": {
                "x": -192,
                "y": 928
              },
              "size": {
                "width": 1264,
                "height": 1512
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "e85fe67c-e3f9-4346-8ad3-3031acc0ec82",
                "port": "out"
              },
              "target": {
                "block": "f8ffbc64-4ed1-461c-b27b-15c0d9852f10",
                "port": "bb27476c-abb7-4884-9cfa-5381e449cb52"
              }
            },
            {
              "source": {
                "block": "217b056b-2046-47ed-adf5-1f29bd35093c",
                "port": "out"
              },
              "target": {
                "block": "f8ffbc64-4ed1-461c-b27b-15c0d9852f10",
                "port": "23b86167-3a0d-4b51-9d45-ca62ab6ac1a0"
              }
            },
            {
              "source": {
                "block": "e85fe67c-e3f9-4346-8ad3-3031acc0ec82",
                "port": "out"
              },
              "target": {
                "block": "e267ddb2-9395-44eb-b46c-c6a93b3d137b",
                "port": "Clock"
              },
              "vertices": [
                {
                  "x": -1056,
                  "y": 1072
                }
              ]
            },
            {
              "source": {
                "block": "e267ddb2-9395-44eb-b46c-c6a93b3d137b",
                "port": "Daten"
              },
              "target": {
                "block": "2a16efdb-dbf0-4759-99a3-c4df7acdf174",
                "port": "in"
              },
              "size": 32
            },
            {
              "source": {
                "block": "e267ddb2-9395-44eb-b46c-c6a93b3d137b",
                "port": "zustand"
              },
              "target": {
                "block": "feb64e99-40ce-42dd-be64-902af731b2e2",
                "port": "in"
              },
              "size": 3
            },
            {
              "source": {
                "block": "63a4ce61-b607-40bd-86f2-e20a1b374caa",
                "port": "out"
              },
              "target": {
                "block": "e267ddb2-9395-44eb-b46c-c6a93b3d137b",
                "port": "Adresse"
              },
              "size": 32
            },
            {
              "source": {
                "block": "e0020276-1e65-47ef-9d93-ef139d794158",
                "port": "out"
              },
              "target": {
                "block": "e267ddb2-9395-44eb-b46c-c6a93b3d137b",
                "port": "Lesen"
              }
            },
            {
              "source": {
                "block": "f8ffbc64-4ed1-461c-b27b-15c0d9852f10",
                "port": "ecb52961-de12-4f83-a3ab-143af0b4fcf3"
              },
              "target": {
                "block": "8e752b41-3cc1-404b-9178-0897a60f8dae",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "f8ffbc64-4ed1-461c-b27b-15c0d9852f10",
                "port": "650885e3-b045-4075-aa54-a54a42daf0b1"
              },
              "target": {
                "block": "1610f71c-80ad-4265-88d1-c57be0e5951b",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "f8ffbc64-4ed1-461c-b27b-15c0d9852f10",
                "port": "5caeb442-d040-49d1-bc4e-aeaa38d1bee2"
              },
              "target": {
                "block": "1a2c2fd1-a3cc-4407-91de-8bd0f7453c88",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "f8ffbc64-4ed1-461c-b27b-15c0d9852f10",
                "port": "e0cf6e2f-e29b-4618-85ca-8a19eaccfa9f"
              },
              "target": {
                "block": "e267ddb2-9395-44eb-b46c-c6a93b3d137b",
                "port": "dout"
              },
              "vertices": [
                {
                  "x": 776,
                  "y": 2784
                },
                {
                  "x": -568,
                  "y": 2648
                }
              ],
              "size": 8
            },
            {
              "source": {
                "block": "f8ffbc64-4ed1-461c-b27b-15c0d9852f10",
                "port": "cb26b0e4-8683-4386-9d88-84d7d914f4a0"
              },
              "target": {
                "block": "e267ddb2-9395-44eb-b46c-c6a93b3d137b",
                "port": "byte_available"
              },
              "vertices": [
                {
                  "x": 824,
                  "y": 2616
                },
                {
                  "x": -520,
                  "y": 2608
                }
              ]
            },
            {
              "source": {
                "block": "f8ffbc64-4ed1-461c-b27b-15c0d9852f10",
                "port": "1a353482-939c-49fc-bd2f-0aca9eb93485"
              },
              "target": {
                "block": "e267ddb2-9395-44eb-b46c-c6a93b3d137b",
                "port": "egal"
              },
              "vertices": [
                {
                  "x": 880,
                  "y": 2848
                },
                {
                  "x": 848,
                  "y": 2568
                },
                {
                  "x": -464,
                  "y": 2568
                }
              ]
            },
            {
              "source": {
                "block": "f8ffbc64-4ed1-461c-b27b-15c0d9852f10",
                "port": "92369b9b-8d33-42c0-bcd4-5f53410c533c"
              },
              "target": {
                "block": "e267ddb2-9395-44eb-b46c-c6a93b3d137b",
                "port": "ready"
              },
              "vertices": [
                {
                  "x": 960,
                  "y": 2872
                },
                {
                  "x": -408,
                  "y": 2520
                }
              ]
            },
            {
              "source": {
                "block": "e267ddb2-9395-44eb-b46c-c6a93b3d137b",
                "port": "Busy"
              },
              "target": {
                "block": "ac40a621-56b2-4a76-b143-ff307cf87475",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "e267ddb2-9395-44eb-b46c-c6a93b3d137b",
                "port": "Fertig"
              },
              "target": {
                "block": "6f91f091-edad-4b87-a54f-6a2feb25a3bd",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "e267ddb2-9395-44eb-b46c-c6a93b3d137b",
                "port": "rd"
              },
              "target": {
                "block": "f8ffbc64-4ed1-461c-b27b-15c0d9852f10",
                "port": "45d136b4-6412-43d8-90ab-955a596aaf02"
              },
              "vertices": [
                {
                  "x": 1232,
                  "y": 2480
                },
                {
                  "x": 144,
                  "y": 2480
                }
              ]
            },
            {
              "source": {
                "block": "c41b053d-dce6-4ccb-b941-c20aab20eff3",
                "port": "19c8f68d-5022-487f-9ab0-f0a3cd58bead"
              },
              "target": {
                "block": "f8ffbc64-4ed1-461c-b27b-15c0d9852f10",
                "port": "8fcccb9b-b215-4058-af9d-c720f3d4719c"
              }
            },
            {
              "source": {
                "block": "13a1c4e0-6ee6-4fb9-9d93-89109c324a10",
                "port": "din"
              },
              "target": {
                "block": "f8ffbc64-4ed1-461c-b27b-15c0d9852f10",
                "port": "0810b100-edf9-4299-bc57-bd79008f75ff"
              },
              "size": 8
            },
            {
              "source": {
                "block": "e267ddb2-9395-44eb-b46c-c6a93b3d137b",
                "port": "sektorAdresse"
              },
              "target": {
                "block": "f8ffbc64-4ed1-461c-b27b-15c0d9852f10",
                "port": "b35f2ca0-96bd-4379-9270-ea46a1f0f58c"
              },
              "vertices": [
                {
                  "x": 1200,
                  "y": 2368
                },
                {
                  "x": 184,
                  "y": 2984
                }
              ],
              "size": 32
            },
            {
              "source": {
                "block": "ee6f7fb6-9ed5-41c3-ba4f-5377420e9069",
                "port": "out"
              },
              "target": {
                "block": "e267ddb2-9395-44eb-b46c-c6a93b3d137b",
                "port": "Reset"
              },
              "vertices": []
            },
            {
              "source": {
                "block": "ee6f7fb6-9ed5-41c3-ba4f-5377420e9069",
                "port": "out"
              },
              "target": {
                "block": "f8ffbc64-4ed1-461c-b27b-15c0d9852f10",
                "port": "9bb254dc-f051-49a5-83bf-970a342fcd3d"
              },
              "vertices": [
                {
                  "x": -832,
                  "y": 2848
                }
              ]
            },
            {
              "source": {
                "block": "f8ffbc64-4ed1-461c-b27b-15c0d9852f10",
                "port": "fbff2319-ad71-4842-98dc-e321f6ab4da6"
              },
              "target": {
                "block": "07fb7850-bd51-4008-9054-ff794e6f5160",
                "port": "in"
              },
              "size": 5
            }
          ]
        }
      }
    },
    "1b8ab98e773cb563b465d56ba7db890d25c1a504": {
      "package": {
        "name": "",
        "version": "",
        "description": "",
        "author": "",
        "image": ""
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "650885e3-b045-4075-aa54-a54a42daf0b1",
              "type": "basic.output",
              "data": {
                "name": "cs"
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
                "name": "mosi"
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
                "name": "sclk"
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
                "range": "[7:0]",
                "size": 8
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
                "range": "[7:0]",
                "clock": false,
                "size": 8
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
                "name": "byte_available"
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
                "name": "ready_for_next_byte"
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
                "range": "[31:0]",
                "clock": false,
                "size": 32
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
                "name": "ready"
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
                "range": "[4:0]",
                "size": 5
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
      }
    },
    "c4dd08263a85a91ba53e2ae2b38de344c5efcb52": {
      "package": {
        "name": "Bit 0",
        "version": "1.0.0",
        "description": "Assign 0 to the output wire",
        "author": "Jesús Arroyo",
        "image": "%3Csvg%20xmlns=%22http://www.w3.org/2000/svg%22%20width=%2247.303%22%20height=%2227.648%22%20viewBox=%220%200%2044.346456%2025.919999%22%3E%3Ctext%20style=%22line-height:125%25%22%20x=%22325.37%22%20y=%22315.373%22%20font-weight=%22400%22%20font-size=%2212.669%22%20font-family=%22sans-serif%22%20letter-spacing=%220%22%20word-spacing=%220%22%20transform=%22translate(-307.01%20-298.51)%22%3E%3Ctspan%20x=%22325.37%22%20y=%22315.373%22%20style=%22-inkscape-font-specification:'Courier%2010%20Pitch'%22%20font-family=%22Courier%2010%20Pitch%22%3E0%3C/tspan%3E%3C/text%3E%3C/svg%3E"
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "19c8f68d-5022-487f-9ab0-f0a3cd58bead",
              "type": "basic.output",
              "data": {
                "name": ""
              },
              "position": {
                "x": 608,
                "y": 192
              }
            },
            {
              "id": "b959fb96-ac67-4aea-90b3-ed35a4c17bf5",
              "type": "basic.code",
              "data": {
                "code": "// Bit 0\n\nassign v = 1'b0;",
                "params": [],
                "ports": {
                  "in": [],
                  "out": [
                    {
                      "name": "v"
                    }
                  ]
                }
              },
              "position": {
                "x": 96,
                "y": 96
              },
              "size": {
                "width": 384,
                "height": 256
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "b959fb96-ac67-4aea-90b3-ed35a4c17bf5",
                "port": "v"
              },
              "target": {
                "block": "19c8f68d-5022-487f-9ab0-f0a3cd58bead",
                "port": "in"
              }
            }
          ]
        }
      }
    },
    "061b6edb3e4d1e61ee050a4224b6905e2244e81f": {
      "package": {
        "name": "RAM",
        "version": "",
        "description": "",
        "author": "",
        "image": ""
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "1e9a6507-3298-4599-99f5-5b2fdd8734f3",
              "type": "basic.input",
              "data": {
                "name": "LesenAn",
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
                "x": 368,
                "y": 208
              }
            },
            {
              "id": "ae1fb74e-5800-404c-bc83-98a5460af38b",
              "type": "basic.input",
              "data": {
                "name": "SchreibenAn",
                "clock": false
              },
              "position": {
                "x": 368,
                "y": 272
              }
            },
            {
              "id": "09a5c0ab-659a-423a-9821-1838dd95aa78",
              "type": "basic.input",
              "data": {
                "name": "DatenRein",
                "range": "[31:0]",
                "clock": false,
                "size": 32
              },
              "position": {
                "x": 352,
                "y": 360
              }
            },
            {
              "id": "b63b3c8b-7212-4d6b-8509-b3f0e03c91a5",
              "type": "basic.output",
              "data": {
                "name": "DatenRaus",
                "range": "[31:0]",
                "size": 32
              },
              "position": {
                "x": 1136,
                "y": 408
              }
            },
            {
              "id": "7c4e0bed-7824-438e-99bd-b4a819a86b0c",
              "type": "basic.input",
              "data": {
                "name": "Adresse",
                "range": "[31:0]",
                "clock": false,
                "size": 32
              },
              "position": {
                "x": 328,
                "y": 448
              }
            },
            {
              "id": "4c5cef1b-6a89-44c3-a27f-765302415d9c",
              "type": "basic.input",
              "data": {
                "name": "Clock",
                "clock": false
              },
              "position": {
                "x": 344,
                "y": 536
              }
            },
            {
              "id": "68116583-4785-4793-919c-64c9f8e9a7f0",
              "type": "basic.code",
              "data": {
                "ports": {
                  "in": [
                    {
                      "name": "SchreibenAn"
                    },
                    {
                      "name": "DatenRein",
                      "range": "[31:0]",
                      "size": 32
                    },
                    {
                      "name": "Adresse",
                      "range": "[31:0]",
                      "size": 32
                    },
                    {
                      "name": "Clock"
                    }
                  ],
                  "out": [
                    {
                      "name": "DatenRaus",
                      "range": "[31:0]",
                      "size": 32
                    }
                  ]
                },
                "params": [
                  {
                    "name": "WORDS"
                  }
                ],
                "code": "reg[31:0] DatenRaus;\nreg[31:0] Daten[WORDS - 1:0];\ninteger idx;\n\ninitial begin\n    //Daten[0] = 32'b10000000001000000000000000000001; //Addi R1, R0, #0\n    //Daten[1] = 32'b10000011111000000000000000000001; //Addi R31, R0, #1\n    //Daten[2] = 32'b10011011111111110000000000011111; //Sli R31, R31, #31\n    \n    //iDaten[3] = 32'b10110000001111110000000000000000; //Store R1, R31, #0\n    //Daten[4] = 32'b10000000001000010000000000000001; //Addi R1, R1, #1\n    //Daten[5] = 32'b01000011111111111111111111111101; //jmp -3\n\n    //for (idx = 6; idx < WORDS; idx = idx + 1) \n    //Daten[idx] = 0;\nend\n\nalways @(posedge Clock) begin\n    if(SchreibenAn)\n    Daten[Adresse] <= DatenRein;\n    else\n    DatenRaus <= Daten[Adresse];\nend"
              },
              "position": {
                "x": 576,
                "y": 256
              },
              "size": {
                "width": 448,
                "height": 360
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "68116583-4785-4793-919c-64c9f8e9a7f0",
                "port": "DatenRaus"
              },
              "target": {
                "block": "b63b3c8b-7212-4d6b-8509-b3f0e03c91a5",
                "port": "in"
              },
              "size": 32
            },
            {
              "source": {
                "block": "ae1fb74e-5800-404c-bc83-98a5460af38b",
                "port": "out"
              },
              "target": {
                "block": "68116583-4785-4793-919c-64c9f8e9a7f0",
                "port": "SchreibenAn"
              }
            },
            {
              "source": {
                "block": "09a5c0ab-659a-423a-9821-1838dd95aa78",
                "port": "out"
              },
              "target": {
                "block": "68116583-4785-4793-919c-64c9f8e9a7f0",
                "port": "DatenRein"
              },
              "size": 32
            },
            {
              "source": {
                "block": "7c4e0bed-7824-438e-99bd-b4a819a86b0c",
                "port": "out"
              },
              "target": {
                "block": "68116583-4785-4793-919c-64c9f8e9a7f0",
                "port": "Adresse"
              },
              "size": 32
            },
            {
              "source": {
                "block": "4c5cef1b-6a89-44c3-a27f-765302415d9c",
                "port": "out"
              },
              "target": {
                "block": "68116583-4785-4793-919c-64c9f8e9a7f0",
                "port": "Clock"
              }
            }
          ]
        }
      }
    },
    "4d6afb1baefb6483d995731210cbaef0ac0611f7": {
      "package": {
        "name": "PLL",
        "version": "",
        "description": "",
        "author": "",
        "image": ""
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "938934d2-3bcd-4aa7-8cd9-714c21de52b7",
              "type": "basic.output",
              "data": {
                "name": "Output_clk0"
              },
              "position": {
                "x": 1280,
                "y": 280
              }
            },
            {
              "id": "9587c369-a387-45b2-b343-3801e918a059",
              "type": "basic.input",
              "data": {
                "name": "input_clk1",
                "clock": false
              },
              "position": {
                "x": 744,
                "y": 320
              }
            },
            {
              "id": "2407b713-045e-43c5-8d22-17768a269f85",
              "type": "basic.output",
              "data": {
                "name": "Output_clk1"
              },
              "position": {
                "x": 1280,
                "y": 344
              }
            },
            {
              "id": "e128ad5d-bf5d-480d-920f-c76d28075181",
              "type": "basic.output",
              "data": {
                "name": "Output_clk2"
              },
              "position": {
                "x": 1280,
                "y": 416
              }
            },
            {
              "id": "90fcd0b6-4267-458d-b976-3bc58f82c3fb",
              "type": "basic.output",
              "data": {
                "name": "Output_clk3"
              },
              "position": {
                "x": 1280,
                "y": 488
              }
            }
          ],
          "wires": []
        }
      }
    },
    "bf62ac3a58701db2485f608b61f6478e64a75825": {
      "package": {
        "name": "Bildpuffer",
        "version": "",
        "description": "",
        "author": "",
        "image": ""
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "ecda3b69-2a1e-4c30-860d-fbf7956c6a92",
              "type": "basic.output",
              "data": {
                "name": "x_out",
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
                "x": 1152,
                "y": 256
              }
            },
            {
              "id": "a5d312e9-8a9e-4a98-82dc-d7162cf43f89",
              "type": "basic.input",
              "data": {
                "name": "Clk",
                "clock": false
              },
              "position": {
                "x": 720,
                "y": 264
              }
            },
            {
              "id": "2ef723c1-f341-44db-b142-27e7eccead9a",
              "type": "basic.output",
              "data": {
                "name": "y_out",
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
                "x": 1152,
                "y": 312
              }
            },
            {
              "id": "14f4884a-7b29-42cd-9968-3711902de5ef",
              "type": "basic.input",
              "data": {
                "name": "x",
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
                "x": 720,
                "y": 336
              }
            },
            {
              "id": "3e35f48e-ba9a-4c58-aff1-3fb682315bbb",
              "type": "basic.output",
              "data": {
                "name": "pixel_data",
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
                "x": 1152,
                "y": 368
              }
            },
            {
              "id": "6e6bd2ed-aaa0-4bdc-89b9-0b1457b0df48",
              "type": "basic.input",
              "data": {
                "name": "y",
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
                "x": 720,
                "y": 392
              }
            },
            {
              "id": "c676f355-af1e-4a85-8ba8-e2727d1720ff",
              "type": "basic.input",
              "data": {
                "name": "color",
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
                "x": 720,
                "y": 456
              }
            },
            {
              "id": "153911c5-0dd5-4a8d-ba3b-f234499a33ba",
              "type": "basic.input",
              "data": {
                "name": "write",
                "clock": false
              },
              "position": {
                "x": 720,
                "y": 512
              }
            }
          ],
          "wires": []
        }
      }
    },
    "2242e9a7e06238ebde879aa159340ce4673f5e54": {
      "package": {
        "name": "DVI_D_Converter",
        "version": "",
        "description": "",
        "author": "",
        "image": ""
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "8a9606d8-fc3a-4842-aa6b-c60f03853d0c",
              "type": "basic.input",
              "data": {
                "name": "Clk",
                "clock": false
              },
              "position": {
                "x": 768,
                "y": 232
              }
            },
            {
              "id": "642804dd-2c55-4fd5-a21b-3be648642513",
              "type": "basic.output",
              "data": {
                "name": "gpdi_dp",
                "virtual": true,
                "range": "[3:0]",
                "pins": [
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
                "x": 1176,
                "y": 256
              }
            },
            {
              "id": "bea7ab17-8b8e-4f14-a18a-594e56ab1388",
              "type": "basic.input",
              "data": {
                "name": "pixel_data",
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
                "x": 768,
                "y": 296
              }
            },
            {
              "id": "e7c8938c-bdb2-4e25-bc3a-dcbd79dc4b79",
              "type": "basic.input",
              "data": {
                "name": "x",
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
                "x": 760,
                "y": 360
              }
            },
            {
              "id": "324806d5-bed3-48cf-820f-b87a8a6fec6f",
              "type": "basic.input",
              "data": {
                "name": "y",
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
                "x": 760,
                "y": 408
              }
            }
          ],
          "wires": []
        }
      }
    },
    "febcfed8636b8ee9a98750b96ed9e53a165dd4a8": {
      "package": {
        "name": "bit-1",
        "version": "0.2",
        "description": "Constant bit 1",
        "author": "Jesus Arroyo",
        "image": "%3Csvg%20xmlns=%22http://www.w3.org/2000/svg%22%20width=%2289.79%22%20height=%22185.093%22%20viewBox=%220%200%2084.179064%20173.52585%22%3E%3Cpath%20d=%22M7.702%2032.42L49.972%200l34.207%207.725-27.333%20116.736-26.607-6.01L51.26%2025.273%2020.023%2044.2z%22%20fill=%22green%22%20fill-rule=%22evenodd%22/%3E%3Cpath%20d=%22M46.13%20117.28l21.355%2028.258-17.91%2021.368%206.198%205.513m-14.033-54.45l-12.4%2028.26-28.242%205.512%202.067%208.959%22%20fill=%22none%22%20stroke=%22green%22%20stroke-width=%222.196%22%20stroke-linecap=%22round%22%20stroke-linejoin=%22round%22/%3E%3C/svg%3E"
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "3d584b0a-29eb-47af-8c43-c0822282ef05",
              "type": "basic.output",
              "data": {
                "name": ""
              },
              "position": {
                "x": 456,
                "y": 120
              }
            },
            {
              "id": "61331ec5-2c56-4cdd-b607-e63b1502fa65",
              "type": "basic.code",
              "data": {
                "code": "//-- Constant bit-1\nassign q = 1'b1;\n\n",
                "params": [],
                "ports": {
                  "in": [],
                  "out": [
                    {
                      "name": "q"
                    }
                  ]
                }
              },
              "position": {
                "x": 168,
                "y": 112
              },
              "size": {
                "width": 248,
                "height": 80
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "61331ec5-2c56-4cdd-b607-e63b1502fa65",
                "port": "q"
              },
              "target": {
                "block": "3d584b0a-29eb-47af-8c43-c0822282ef05",
                "port": "in"
              }
            }
          ]
        }
      }
    },
    "873425949b2a80f1a7f66f320796bcd068a59889": {
      "package": {
        "name": "OR2",
        "version": "1.0.2",
        "description": "OR2: Two bits input OR gate",
        "author": "Jesús Arroyo, Juan González",
        "image": "%3Csvg%20xmlns=%22http://www.w3.org/2000/svg%22%20height=%22192.718%22%20width=%22383.697%22%20version=%221%22%3E%3Cpath%20d=%22M175.56%20188.718H84.527s30.345-42.538%2031.086-94.03c.743-51.49-31.821-90.294-31.821-90.294L176.109%204c46.445%201.948%20103.899%2053.44%20123.047%2093.678-32.601%2067.503-92.158%2089.79-123.596%2091.04z%22%20fill=%22none%22%20stroke=%22#000%22%20stroke-width=%228%22%20stroke-linecap=%22round%22%20stroke-linejoin=%22round%22/%3E%3Cpath%20d=%22M4.057%2047.292h99.605M4.883%20145.168h100.981M298.57%2098.89h81.07%22%20fill=%22none%22%20stroke=%22#000%22%20stroke-width=%228%22%20stroke-linecap=%22round%22/%3E%3Ctext%20style=%22line-height:125%25%22%20font-weight=%22400%22%20font-size=%2266.317%22%20y=%22121.28%22%20x=%22131.572%22%20font-family=%22sans-serif%22%20letter-spacing=%220%22%20word-spacing=%220%22%20fill=%22#00f%22%3E%3Ctspan%20font-weight=%22700%22%20y=%22121.28%22%20x=%22131.572%22%3EOR%3C/tspan%3E%3C/text%3E%3C/svg%3E"
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "18c2ebc7-5152-439c-9b3f-851c59bac834",
              "type": "basic.input",
              "data": {
                "name": ""
              },
              "position": {
                "x": 112,
                "y": 40
              }
            },
            {
              "id": "664caf9e-5f40-4df4-800a-b626af702e62",
              "type": "basic.output",
              "data": {
                "name": ""
              },
              "position": {
                "x": 608,
                "y": 72
              }
            },
            {
              "id": "97b51945-d716-4b6c-9db9-970d08541249",
              "type": "basic.input",
              "data": {
                "name": ""
              },
              "position": {
                "x": 112,
                "y": 96
              }
            },
            {
              "id": "00925b04-5004-4307-a737-fa4e97c8b6ab",
              "type": "basic.code",
              "data": {
                "code": "//-- OR Gate\n//-- Verilog implementation\n\nassign c = a | b;\n\n",
                "params": [],
                "ports": {
                  "in": [
                    {
                      "name": "a"
                    },
                    {
                      "name": "b"
                    }
                  ],
                  "out": [
                    {
                      "name": "c"
                    }
                  ]
                }
              },
              "position": {
                "x": 256,
                "y": 48
              },
              "size": {
                "width": 312,
                "height": 104
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "18c2ebc7-5152-439c-9b3f-851c59bac834",
                "port": "out"
              },
              "target": {
                "block": "00925b04-5004-4307-a737-fa4e97c8b6ab",
                "port": "a"
              }
            },
            {
              "source": {
                "block": "97b51945-d716-4b6c-9db9-970d08541249",
                "port": "out"
              },
              "target": {
                "block": "00925b04-5004-4307-a737-fa4e97c8b6ab",
                "port": "b"
              }
            },
            {
              "source": {
                "block": "00925b04-5004-4307-a737-fa4e97c8b6ab",
                "port": "c"
              },
              "target": {
                "block": "664caf9e-5f40-4df4-800a-b626af702e62",
                "port": "in"
              }
            }
          ]
        }
      }
    },
    "0a3829887879c9ec2512930d44b0e91e93f99aa3": {
      "package": {
        "name": "Mux",
        "version": "",
        "description": "",
        "author": "",
        "image": ""
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "35be441c-33c2-4cc6-af21-cb3b24da4e58",
              "type": "basic.input",
              "data": {
                "name": "in_0",
                "range": "[25:0]",
                "clock": false,
                "size": 26
              },
              "position": {
                "x": 848,
                "y": 296
              }
            },
            {
              "id": "3c8913e5-5a81-4a5c-acbd-04b16f3c180d",
              "type": "basic.output",
              "data": {
                "name": "out",
                "range": "[31:0]",
                "size": 32
              },
              "position": {
                "x": 1176,
                "y": 312
              }
            },
            {
              "id": "f6616a0f-1abf-411a-bdd0-4956655ddf4b",
              "type": "basic.input",
              "data": {
                "name": "in_1",
                "range": "[31:0]",
                "clock": false,
                "size": 32
              },
              "position": {
                "x": 848,
                "y": 368
              }
            },
            {
              "id": "8177371e-8059-44a3-b01c-975ae8b6aae9",
              "type": "basic.input",
              "data": {
                "name": "select",
                "clock": false
              },
              "position": {
                "x": 848,
                "y": 440
              }
            }
          ],
          "wires": []
        }
      }
    },
    "869226df2dcc89387737d5ee549d56fe3cb334a4": {
      "package": {
        "name": "Memory Bus",
        "version": "",
        "description": "",
        "author": "",
        "image": ""
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "118cd74a-87b9-45ac-9a56-3f5a1561b047",
              "type": "basic.input",
              "data": {
                "name": "Address",
                "range": "[31:0]",
                "clock": false,
                "size": 32
              },
              "position": {
                "x": 768,
                "y": 304
              }
            },
            {
              "id": "28874c32-d349-43ad-911d-a90cc1000ca9",
              "type": "basic.output",
              "data": {
                "name": "enable_0"
              },
              "position": {
                "x": 1048,
                "y": 304
              }
            },
            {
              "id": "cb961297-252b-4eb8-b64f-bb3d83b00f2d",
              "type": "basic.output",
              "data": {
                "name": "enable_1"
              },
              "position": {
                "x": 1048,
                "y": 352
              }
            },
            {
              "id": "0472be73-fd4a-4727-9810-a575afbe13f9",
              "type": "basic.output",
              "data": {
                "name": "enable_2"
              },
              "position": {
                "x": 1048,
                "y": 408
              }
            },
            {
              "id": "3390e433-dee2-4285-9829-32797df01bae",
              "type": "basic.output",
              "data": {
                "name": "enable_3",
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
                "x": 1048,
                "y": 464
              }
            },
            {
              "id": "77a13711-5337-4e1d-84e0-8036c77cdff9",
              "type": "basic.output",
              "data": {
                "name": "enable_4",
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
                "x": 1048,
                "y": 520
              }
            }
          ],
          "wires": []
        }
      }
    },
    "ba518ee261a2be13a9739cd3a01cdcebe0ef63c0": {
      "package": {
        "name": "AND2",
        "version": "1.0.2",
        "description": "Two bits input And gate",
        "author": "Jesús Arroyo, Juan González",
        "image": "%3Csvg%20xmlns=%22http://www.w3.org/2000/svg%22%20width=%22336.09%22%20height=%22194.045%22%20version=%221%22%3E%3Cpath%20d=%22M174.656%20190.045H78.304V4h96.352s87.463%208.625%2087.463%2091.94c0%2083.311-87.463%2094.105-87.463%2094.105z%22%20fill=%22none%22%20stroke=%22#000%22%20stroke-width=%228%22%20stroke-linejoin=%22round%22/%3E%3Cpath%20d=%22M4.057%2045.668h74.018M4.057%20144.812h74.018m184.632-50.034h69.326%22%20fill=%22none%22%20stroke=%22#000%22%20stroke-width=%228%22%20stroke-linecap=%22round%22/%3E%3Ctext%20style=%22line-height:125%25%22%20x=%2292.894%22%20y=%22114.587%22%20font-weight=%22400%22%20font-size=%2258.054%22%20font-family=%22sans-serif%22%20letter-spacing=%220%22%20word-spacing=%220%22%20fill=%22#00f%22%3E%3Ctspan%20x=%2292.894%22%20y=%22114.587%22%20style=%22-inkscape-font-specification:'sans-serif%20Bold'%22%20font-weight=%22700%22%3EAND%3C/tspan%3E%3C/text%3E%3C/svg%3E"
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "18c2ebc7-5152-439c-9b3f-851c59bac834",
              "type": "basic.input",
              "data": {
                "name": ""
              },
              "position": {
                "x": 96,
                "y": 56
              }
            },
            {
              "id": "664caf9e-5f40-4df4-800a-b626af702e62",
              "type": "basic.output",
              "data": {
                "name": ""
              },
              "position": {
                "x": 600,
                "y": 96
              }
            },
            {
              "id": "97b51945-d716-4b6c-9db9-970d08541249",
              "type": "basic.input",
              "data": {
                "name": ""
              },
              "position": {
                "x": 96,
                "y": 128
              }
            },
            {
              "id": "00925b04-5004-4307-a737-fa4e97c8b6ab",
              "type": "basic.code",
              "data": {
                "code": "//-- AND gate\n//-- Verilog implementation\n\nassign c = a & b;\n",
                "params": [],
                "ports": {
                  "in": [
                    {
                      "name": "a"
                    },
                    {
                      "name": "b"
                    }
                  ],
                  "out": [
                    {
                      "name": "c"
                    }
                  ]
                }
              },
              "position": {
                "x": 256,
                "y": 48
              },
              "size": {
                "width": 304,
                "height": 152
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "18c2ebc7-5152-439c-9b3f-851c59bac834",
                "port": "out"
              },
              "target": {
                "block": "00925b04-5004-4307-a737-fa4e97c8b6ab",
                "port": "a"
              }
            },
            {
              "source": {
                "block": "97b51945-d716-4b6c-9db9-970d08541249",
                "port": "out"
              },
              "target": {
                "block": "00925b04-5004-4307-a737-fa4e97c8b6ab",
                "port": "b"
              }
            },
            {
              "source": {
                "block": "00925b04-5004-4307-a737-fa4e97c8b6ab",
                "port": "c"
              },
              "target": {
                "block": "664caf9e-5f40-4df4-800a-b626af702e62",
                "port": "in"
              }
            }
          ]
        }
      }
    },
    "468a0568931bf0e98f0069778cf0f1b58849922a": {
      "package": {
        "name": "Bus32-Split-quarter",
        "version": "0.1",
        "description": "Bus32-Split-quarter: Split the 32-bits bus into four buses of 8 wires",
        "author": "Juan González-Gómez (Obijuan)",
        "image": "%3Csvg%20xmlns=%22http://www.w3.org/2000/svg%22%20width=%22354.768%22%20height=%22241.058%22%20viewBox=%220%200%20332.59497%20225.99201%22%3E%3Cpath%20d=%22M168.377%2077.643l61.147-60.938C240.21%206.25%20254.56.461%20269.484.5h62.611v26.186l-61.698.046c-8.012-.043-15.705%203.133-21.47%208.81L187.48%2096.857a57.292%2057.292%200%200%201-39.993%2016.139%2057.292%2057.292%200%200%201%2039.993%2016.14l61.448%2061.314c5.765%205.677%2013.458%208.853%2021.47%208.81l61.698.046v26.186h-62.612c-14.924.039-29.463-5.9-40.204-16.28l-60.902-60.863a29.857%2029.857%200%200%200-21.347-8.81L.5%20139.427V86.457h146.524a29.884%2029.884%200%200%200%2021.353-8.814z%22%20fill=%22green%22%20stroke=%22#000%22%20stroke-linecap=%22round%22%20stroke-linejoin=%22round%22/%3E%3C/svg%3E"
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "cd24bb12-b3ea-4587-845c-24eb04db0e7d",
              "type": "basic.output",
              "data": {
                "name": "3",
                "range": "[7:0]",
                "size": 8
              },
              "position": {
                "x": 640,
                "y": 96
              }
            },
            {
              "id": "9854725b-1481-43d8-88b9-7f4e3e46e935",
              "type": "basic.output",
              "data": {
                "name": "2",
                "range": "[7:0]",
                "size": 8
              },
              "position": {
                "x": 680,
                "y": 184
              }
            },
            {
              "id": "5204a9f1-594b-4216-b993-03b46bef9e6e",
              "type": "basic.input",
              "data": {
                "name": "",
                "range": "[31:0]",
                "clock": false,
                "size": 32
              },
              "position": {
                "x": 64,
                "y": 248
              }
            },
            {
              "id": "ab69e2b6-41cb-4145-883c-ff7d66e29c69",
              "type": "basic.output",
              "data": {
                "name": "1",
                "range": "[7:0]",
                "size": 8
              },
              "position": {
                "x": 672,
                "y": 272
              }
            },
            {
              "id": "bbc72c72-9eec-46c2-aeff-4233b746b9c2",
              "type": "basic.output",
              "data": {
                "name": "0",
                "range": "[7:0]",
                "size": 8
              },
              "position": {
                "x": 640,
                "y": 400
              }
            },
            {
              "id": "16e78204-213e-4833-9096-89d735307ec2",
              "type": "basic.code",
              "data": {
                "code": "assign o3 = i[32:24];\nassign o2 = i[23:16];\nassign o1 = i[15:8];\nassign o0 = i[7:0];",
                "params": [],
                "ports": {
                  "in": [
                    {
                      "name": "i",
                      "range": "[31:0]",
                      "size": 32
                    }
                  ],
                  "out": [
                    {
                      "name": "o3",
                      "range": "[7:0]",
                      "size": 8
                    },
                    {
                      "name": "o2",
                      "range": "[7:0]",
                      "size": 8
                    },
                    {
                      "name": "o1",
                      "range": "[7:0]",
                      "size": 8
                    },
                    {
                      "name": "o0",
                      "range": "[7:0]",
                      "size": 8
                    }
                  ]
                }
              },
              "position": {
                "x": 272,
                "y": 176
              },
              "size": {
                "width": 240,
                "height": 200
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "5204a9f1-594b-4216-b993-03b46bef9e6e",
                "port": "out"
              },
              "target": {
                "block": "16e78204-213e-4833-9096-89d735307ec2",
                "port": "i"
              },
              "size": 32
            },
            {
              "source": {
                "block": "16e78204-213e-4833-9096-89d735307ec2",
                "port": "o0"
              },
              "target": {
                "block": "bbc72c72-9eec-46c2-aeff-4233b746b9c2",
                "port": "in"
              },
              "vertices": [],
              "size": 8
            },
            {
              "source": {
                "block": "16e78204-213e-4833-9096-89d735307ec2",
                "port": "o1"
              },
              "target": {
                "block": "ab69e2b6-41cb-4145-883c-ff7d66e29c69",
                "port": "in"
              },
              "size": 8
            },
            {
              "source": {
                "block": "16e78204-213e-4833-9096-89d735307ec2",
                "port": "o2"
              },
              "target": {
                "block": "9854725b-1481-43d8-88b9-7f4e3e46e935",
                "port": "in"
              },
              "size": 8
            },
            {
              "source": {
                "block": "16e78204-213e-4833-9096-89d735307ec2",
                "port": "o3"
              },
              "target": {
                "block": "cd24bb12-b3ea-4587-845c-24eb04db0e7d",
                "port": "in"
              },
              "size": 8
            }
          ]
        }
      }
    },
    "93126406b5693ec7613b2330def84048b59b4816": {
      "package": {
        "name": "Mux",
        "version": "",
        "description": "",
        "author": "",
        "image": ""
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "bc9bb106-79cc-4820-b5e7-5a0d6d84a7d8",
              "type": "basic.input",
              "data": {
                "name": "in_0",
                "range": "[7:0]",
                "clock": false,
                "size": 8
              },
              "position": {
                "x": 848,
                "y": 296
              }
            },
            {
              "id": "8a24aeef-481c-4ec8-b048-1072e72b1442",
              "type": "basic.output",
              "data": {
                "name": "out",
                "range": "[7:0]",
                "size": 8
              },
              "position": {
                "x": 1176,
                "y": 312
              }
            },
            {
              "id": "1de9cd2a-f78e-4b28-b04f-89dcd47e7fa9",
              "type": "basic.input",
              "data": {
                "name": "in_1",
                "range": "[7:0]",
                "clock": false,
                "size": 8
              },
              "position": {
                "x": 848,
                "y": 368
              }
            },
            {
              "id": "8177371e-8059-44a3-b01c-975ae8b6aae9",
              "type": "basic.input",
              "data": {
                "name": "select",
                "clock": false
              },
              "position": {
                "x": 848,
                "y": 440
              }
            }
          ],
          "wires": []
        }
      }
    },
    "c08fe76a6c29817d0ffc53cf3da575a99ea85fbd": {
      "package": {
        "name": "1-Bit adder",
        "version": "",
        "description": "",
        "author": "",
        "image": ""
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "272b8b87-6a69-4649-8391-79c70e95365c",
              "type": "basic.output",
              "data": {
                "name": "value"
              },
              "position": {
                "x": 1080,
                "y": 312
              }
            },
            {
              "id": "264d6977-d201-4485-816f-c3dfdaf95cc6",
              "type": "basic.input",
              "data": {
                "name": "Clk",
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
                "x": 768,
                "y": 320
              }
            }
          ],
          "wires": []
        }
      }
    },
    "8f83ac156e4ebfce6389d8e2466ea3caf3cd26b9": {
      "package": {
        "name": "Loader",
        "version": "",
        "description": "",
        "author": "",
        "image": ""
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "42d5f71a-16fc-4a11-bd88-3f307deb86dc",
              "type": "basic.output",
              "data": {
                "name": "Lesen",
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
                "x": 1168,
                "y": 112
              }
            },
            {
              "id": "8c3c4314-f452-4c8b-a879-b49afaa5cba0",
              "type": "basic.output",
              "data": {
                "name": "address",
                "range": "[31:0]",
                "size": 32
              },
              "position": {
                "x": 1168,
                "y": 184
              }
            },
            {
              "id": "8dc5caa2-bc69-41b4-b28a-8264c594a329",
              "type": "basic.input",
              "data": {
                "name": "Daten_rein",
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
                "x": 576,
                "y": 184
              }
            },
            {
              "id": "0111a5d0-3969-4745-b13f-444597bd3a64",
              "type": "basic.output",
              "data": {
                "name": "Daten_naus",
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
                ]
              },
              "position": {
                "x": 1168,
                "y": 264
              }
            }
          ],
          "wires": []
        }
      }
    },
    "c8c790949fbd0bc2ef709c514d0561d7f65fe6e8": {
      "package": {
        "name": "Mux",
        "version": "",
        "description": "",
        "author": "",
        "image": ""
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "baa70f70-8b40-4f3f-8c5d-63a1f1ab01b0",
              "type": "basic.input",
              "data": {
                "name": "in_0",
                "range": "[31:0]",
                "clock": false,
                "size": 32
              },
              "position": {
                "x": 848,
                "y": 296
              }
            },
            {
              "id": "c17a46f6-0a86-4998-be4e-76d85b088d63",
              "type": "basic.output",
              "data": {
                "name": "out",
                "range": "[31:0]",
                "size": 32
              },
              "position": {
                "x": 1176,
                "y": 312
              }
            },
            {
              "id": "8415be3c-848e-47d5-a19d-ac6df0458e41",
              "type": "basic.input",
              "data": {
                "name": "in_1",
                "range": "[31:0]",
                "clock": false,
                "size": 32
              },
              "position": {
                "x": 848,
                "y": 368
              }
            },
            {
              "id": "8177371e-8059-44a3-b01c-975ae8b6aae9",
              "type": "basic.input",
              "data": {
                "name": "select",
                "clock": false
              },
              "position": {
                "x": 848,
                "y": 440
              }
            }
          ],
          "wires": []
        }
      }
    }
  }
}