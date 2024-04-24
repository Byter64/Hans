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
          "id": "3773f6b8-a9b2-407e-a459-f27a07b3d59f",
          "type": "basic.input",
          "data": {
            "name": "Bedingung",
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
            "x": 1592,
            "y": -416
          }
        },
        {
          "id": "1f7015d3-8902-465c-881e-593942403cdf",
          "type": "basic.input",
          "data": {
            "name": "UnbedingterSprungBefehl",
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
            "x": 1592,
            "y": -368
          }
        },
        {
          "id": "5235af3b-edc5-46bf-8f5f-30990f32da81",
          "type": "basic.output",
          "data": {
            "name": "PCSchreibSignal",
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
            "x": 2264,
            "y": -352
          }
        },
        {
          "id": "8967c841-23d3-4222-8105-c75fc5a893c8",
          "type": "basic.input",
          "data": {
            "name": "BedingterSprungBefehl",
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
            "x": 1592,
            "y": -320
          }
        },
        {
          "id": "03069b59-0bc1-4662-96b6-a9dfc7c22b0f",
          "type": "basic.input",
          "data": {
            "name": "StoreBefehl",
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
            "x": 1592,
            "y": -272
          }
        },
        {
          "id": "0b4a4a02-3ff6-44c3-b26e-703f1667aae9",
          "type": "basic.input",
          "data": {
            "name": "LoadBefehl",
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
            "x": 1592,
            "y": -224
          }
        },
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
            "x": 920,
            "y": -208
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
            "x": 920,
            "y": -152
          }
        },
        {
          "id": "c1276045-a74b-455d-908a-edc85242ba90",
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
            "x": 2232,
            "y": -128
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
            "x": 2336,
            "y": -128
          }
        },
        {
          "id": "6427d2c6-40cd-4423-8195-684d285df381",
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
            "x": 2232,
            "y": -72
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
            "x": 2336,
            "y": -72
          }
        },
        {
          "id": "9da12b58-a282-43a7-ac77-bc3d2490d94b",
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
            "x": 3272,
            "y": -48
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
            "x": 624,
            "y": -24
          }
        },
        {
          "id": "0ab4bde9-8c23-4f45-8e04-653d9400b648",
          "type": "basic.output",
          "data": {
            "name": "ALUSignal",
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
            "x": 1192,
            "y": 24
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
            "x": 792,
            "y": 40
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
            "x": 3152,
            "y": 64
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
            "x": 2040,
            "y": 224
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
            "x": 2824,
            "y": 248
          }
        },
        {
          "id": "af709b23-27f1-46e6-b08b-cc418c32532f",
          "type": "basic.constant",
          "data": {
            "name": "DecodeTime",
            "value": "",
            "local": true
          },
          "position": {
            "x": 792,
            "y": -136
          }
        },
        {
          "id": "7f054239-9c31-4e2b-aaef-28fb2aa913ca",
          "type": "basic.constant",
          "data": {
            "name": "RegisterWriteTime",
            "value": "",
            "local": true
          },
          "position": {
            "x": 1408,
            "y": -248
          }
        },
        {
          "id": "a0c3e4a1-f792-4d7e-8ca8-e042f0144911",
          "type": "basic.constant",
          "data": {
            "name": "PCWriteTime",
            "value": "",
            "local": true
          },
          "position": {
            "x": 2040,
            "y": 56
          }
        },
        {
          "id": "4b4067fd-0279-44bf-9f17-928a2a6eb78d",
          "type": "b01398144d8ce66aa06876ff33494c4c6ffdf1a8",
          "position": {
            "x": 792,
            "y": -24
          },
          "size": {
            "width": 96,
            "height": 64
          }
        },
        {
          "id": "7288fac5-d073-4900-986b-a16b6e9f29cf",
          "type": "0fb9cfdc708796ebc2eab3109ec295c67aca4ecf",
          "position": {
            "x": 1192,
            "y": -40
          },
          "size": {
            "width": 96,
            "height": 64
          }
        },
        {
          "id": "ddfb8201-27bc-4e91-aff9-79f28163f0dc",
          "type": "b01398144d8ce66aa06876ff33494c4c6ffdf1a8",
          "position": {
            "x": 1408,
            "y": 88
          },
          "size": {
            "width": 96,
            "height": 64
          }
        },
        {
          "id": "8511a1e9-6a2c-43a1-a854-c69389bdcab9",
          "type": "53af2f188c923f8d4ab024fe3d812d8350ce560d",
          "position": {
            "x": 1192,
            "y": 88
          },
          "size": {
            "width": 96,
            "height": 64
          }
        },
        {
          "id": "73be0e9e-8053-41fe-8f72-d27ec07daec9",
          "type": "a45375f520aaee2b09644cfa3e6988e35bde977c",
          "position": {
            "x": 1648,
            "y": -24
          },
          "size": {
            "width": 96,
            "height": 96
          }
        },
        {
          "id": "9a475345-dc05-43e2-af12-3a2384fd273c",
          "type": "ed4da404df0e56477018b4ce7381d59266ecfcde",
          "position": {
            "x": 2056,
            "y": -368
          },
          "size": {
            "width": 96,
            "height": 96
          }
        },
        {
          "id": "330c6e67-64f8-4b1a-b136-5d50a1ae480f",
          "type": "e32915e54baaf1b40b61f17879ca840bcbd80e4d",
          "position": {
            "x": 2040,
            "y": -120
          },
          "size": {
            "width": 96,
            "height": 160
          }
        },
        {
          "id": "e5d7f42b-9b4e-4bbc-9fab-502b78415bae",
          "type": "b01398144d8ce66aa06876ff33494c4c6ffdf1a8",
          "position": {
            "x": 2040,
            "y": 160
          },
          "size": {
            "width": 96,
            "height": 64
          }
        },
        {
          "id": "8c86608f-994b-495f-8661-6726f5a209e9",
          "type": "b01398144d8ce66aa06876ff33494c4c6ffdf1a8",
          "position": {
            "x": 2680,
            "y": -32
          },
          "size": {
            "width": 96,
            "height": 64
          }
        },
        {
          "id": "30bdc8a2-7863-4808-a5c7-a34bfe91fff5",
          "type": "83c824e89b7791423ed37f4e3d28d9ff58b1179a",
          "position": {
            "x": 2480,
            "y": -32
          },
          "size": {
            "width": 96,
            "height": 64
          }
        },
        {
          "id": "e42cec6a-1c28-4387-82e0-3f9b69e8b6c1",
          "type": "ffdae85b1cdcacbfc9c7d4dae7e6c06b1359e96c",
          "position": {
            "x": 2944,
            "y": -48
          },
          "size": {
            "width": 96,
            "height": 96
          }
        },
        {
          "id": "d1d61e12-b8b4-4ebf-9819-f3ee538ce219",
          "type": "83c824e89b7791423ed37f4e3d28d9ff58b1179a",
          "position": {
            "x": 3128,
            "y": -48
          },
          "size": {
            "width": 96,
            "height": 64
          }
        },
        {
          "id": "0193f634-5071-4ead-b333-7e266725edb0",
          "type": "83c824e89b7791423ed37f4e3d28d9ff58b1179a",
          "position": {
            "x": 2680,
            "y": 248
          },
          "size": {
            "width": 96,
            "height": 64
          }
        }
      ],
      "wires": [
        {
          "source": {
            "block": "3dd214ec-0e77-4f70-9c95-7061ee49399f",
            "port": "out"
          },
          "target": {
            "block": "4b4067fd-0279-44bf-9f17-928a2a6eb78d",
            "port": "453de9c4-be14-43a5-bab4-d2236c288798"
          }
        },
        {
          "source": {
            "block": "3dd214ec-0e77-4f70-9c95-7061ee49399f",
            "port": "out"
          },
          "target": {
            "block": "8a617e6e-3f08-4591-9c64-7dccb0cdfca0",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "af709b23-27f1-46e6-b08b-cc418c32532f",
            "port": "constant-out"
          },
          "target": {
            "block": "4b4067fd-0279-44bf-9f17-928a2a6eb78d",
            "port": "76233bbf-59fc-4e82-a9e7-0516fc2678f4"
          }
        },
        {
          "source": {
            "block": "4b4067fd-0279-44bf-9f17-928a2a6eb78d",
            "port": "245e0ae0-421c-40d1-a267-bf7433c744ba"
          },
          "target": {
            "block": "7288fac5-d073-4900-986b-a16b6e9f29cf",
            "port": "3ecda7cd-09b6-42e3-9e51-3fcc9b6d6c94"
          }
        },
        {
          "source": {
            "block": "528cacb6-c1be-45d7-adcf-916e31acc1d4",
            "port": "out"
          },
          "target": {
            "block": "7288fac5-d073-4900-986b-a16b6e9f29cf",
            "port": "6a039e67-04c1-410b-b986-34898652d1df"
          },
          "size": 6
        },
        {
          "source": {
            "block": "7f054239-9c31-4e2b-aaef-28fb2aa913ca",
            "port": "constant-out"
          },
          "target": {
            "block": "ddfb8201-27bc-4e91-aff9-79f28163f0dc",
            "port": "76233bbf-59fc-4e82-a9e7-0516fc2678f4"
          },
          "vertices": []
        },
        {
          "source": {
            "block": "8511a1e9-6a2c-43a1-a854-c69389bdcab9",
            "port": "635505c5-989a-4a0a-a470-a4e945e75573"
          },
          "target": {
            "block": "0193f634-5071-4ead-b333-7e266725edb0",
            "port": "c7fc1a07-3efc-43c2-9c06-dae41ddf9f91"
          }
        },
        {
          "source": {
            "block": "8511a1e9-6a2c-43a1-a854-c69389bdcab9",
            "port": "635505c5-989a-4a0a-a470-a4e945e75573"
          },
          "target": {
            "block": "ddfb8201-27bc-4e91-aff9-79f28163f0dc",
            "port": "453de9c4-be14-43a5-bab4-d2236c288798"
          }
        },
        {
          "source": {
            "block": "7288fac5-d073-4900-986b-a16b6e9f29cf",
            "port": "8bc9d8bb-b9a2-4002-a1e6-ca5a1e470242"
          },
          "target": {
            "block": "73be0e9e-8053-41fe-8f72-d27ec07daec9",
            "port": "604a125b-ab32-48d3-9789-46efb1fcb0f9"
          }
        },
        {
          "source": {
            "block": "ddfb8201-27bc-4e91-aff9-79f28163f0dc",
            "port": "245e0ae0-421c-40d1-a267-bf7433c744ba"
          },
          "target": {
            "block": "73be0e9e-8053-41fe-8f72-d27ec07daec9",
            "port": "3c53b74a-3b65-42ba-bcdb-14bf19ef17f0"
          }
        },
        {
          "source": {
            "block": "4b4067fd-0279-44bf-9f17-928a2a6eb78d",
            "port": "245e0ae0-421c-40d1-a267-bf7433c744ba"
          },
          "target": {
            "block": "8511a1e9-6a2c-43a1-a854-c69389bdcab9",
            "port": "b3ac97bb-472f-4e6b-971c-5f673f2c5f3e"
          },
          "vertices": [
            {
              "x": 1072,
              "y": 48
            }
          ]
        },
        {
          "source": {
            "block": "80701733-2c21-4dd6-96ff-ede745745459",
            "port": "out"
          },
          "target": {
            "block": "8511a1e9-6a2c-43a1-a854-c69389bdcab9",
            "port": "dd2c5a18-b796-4ecd-89de-8cdf9d9d3f1d"
          },
          "vertices": [
            {
              "x": 1040,
              "y": 48
            }
          ]
        },
        {
          "source": {
            "block": "73be0e9e-8053-41fe-8f72-d27ec07daec9",
            "port": "947d0c96-7bd3-43d5-b549-c4c779628ef3"
          },
          "target": {
            "block": "330c6e67-64f8-4b1a-b136-5d50a1ae480f",
            "port": "b1600279-f0bd-41ac-96ec-76ec9a025042"
          }
        },
        {
          "source": {
            "block": "9a475345-dc05-43e2-af12-3a2384fd273c",
            "port": "8a2371ac-c852-4ee7-9298-caf8cb4f02de"
          },
          "target": {
            "block": "5235af3b-edc5-46bf-8f5f-30990f32da81",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "1f7015d3-8902-465c-881e-593942403cdf",
            "port": "out"
          },
          "target": {
            "block": "9a475345-dc05-43e2-af12-3a2384fd273c",
            "port": "9a80c1c5-9f8f-4d77-af8c-8ea1b39f7798"
          },
          "vertices": [
            {
              "x": 1904,
              "y": -352
            }
          ]
        },
        {
          "source": {
            "block": "8967c841-23d3-4222-8105-c75fc5a893c8",
            "port": "out"
          },
          "target": {
            "block": "9a475345-dc05-43e2-af12-3a2384fd273c",
            "port": "accb2968-fc72-46a4-bb54-842b147e3a47"
          }
        },
        {
          "source": {
            "block": "3773f6b8-a9b2-407e-a459-f27a07b3d59f",
            "port": "out"
          },
          "target": {
            "block": "9a475345-dc05-43e2-af12-3a2384fd273c",
            "port": "1b4f650c-edfe-4e25-950b-ba3cb24626ba"
          }
        },
        {
          "source": {
            "block": "1f7015d3-8902-465c-881e-593942403cdf",
            "port": "out"
          },
          "target": {
            "block": "330c6e67-64f8-4b1a-b136-5d50a1ae480f",
            "port": "167ac2c5-225e-40b0-9b14-2b53ca5f549a"
          },
          "vertices": [
            {
              "x": 1904,
              "y": -152
            }
          ]
        },
        {
          "source": {
            "block": "8967c841-23d3-4222-8105-c75fc5a893c8",
            "port": "out"
          },
          "target": {
            "block": "330c6e67-64f8-4b1a-b136-5d50a1ae480f",
            "port": "5ead3ede-a5d8-4378-ae27-48d4fc57b9f8"
          },
          "vertices": [
            {
              "x": 1872,
              "y": -152
            }
          ]
        },
        {
          "source": {
            "block": "0b4a4a02-3ff6-44c3-b26e-703f1667aae9",
            "port": "out"
          },
          "target": {
            "block": "330c6e67-64f8-4b1a-b136-5d50a1ae480f",
            "port": "e94b3c88-b693-48e5-babc-64093c732f2f"
          },
          "vertices": [
            {
              "x": 1808,
              "y": -40
            }
          ]
        },
        {
          "source": {
            "block": "03069b59-0bc1-4662-96b6-a9dfc7c22b0f",
            "port": "out"
          },
          "target": {
            "block": "330c6e67-64f8-4b1a-b136-5d50a1ae480f",
            "port": "b1ad3d53-fe32-4df1-ad4f-679848b009e5"
          },
          "vertices": [
            {
              "x": 1840,
              "y": -72
            }
          ]
        },
        {
          "source": {
            "block": "a0c3e4a1-f792-4d7e-8ca8-e042f0144911",
            "port": "constant-out"
          },
          "target": {
            "block": "e5d7f42b-9b4e-4bbc-9fab-502b78415bae",
            "port": "76233bbf-59fc-4e82-a9e7-0516fc2678f4"
          }
        },
        {
          "source": {
            "block": "73be0e9e-8053-41fe-8f72-d27ec07daec9",
            "port": "947d0c96-7bd3-43d5-b549-c4c779628ef3"
          },
          "target": {
            "block": "e5d7f42b-9b4e-4bbc-9fab-502b78415bae",
            "port": "453de9c4-be14-43a5-bab4-d2236c288798"
          }
        },
        {
          "source": {
            "block": "73be0e9e-8053-41fe-8f72-d27ec07daec9",
            "port": "947d0c96-7bd3-43d5-b549-c4c779628ef3"
          },
          "target": {
            "block": "8cf34f50-cd18-4b79-b85e-acbb3bfc9078",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "330c6e67-64f8-4b1a-b136-5d50a1ae480f",
            "port": "9f2a9f23-7aa8-4659-b183-b8eff5539364"
          },
          "target": {
            "block": "c1276045-a74b-455d-908a-edc85242ba90",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "330c6e67-64f8-4b1a-b136-5d50a1ae480f",
            "port": "d1355006-bfe5-4a92-ae83-cffc26d432df"
          },
          "target": {
            "block": "6427d2c6-40cd-4423-8195-684d285df381",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "30bdc8a2-7863-4808-a5c7-a34bfe91fff5",
            "port": "394f5f05-f9c7-427d-96ef-1fdfe6217b62"
          },
          "target": {
            "block": "8c86608f-994b-495f-8661-6726f5a209e9",
            "port": "453de9c4-be14-43a5-bab4-d2236c288798"
          }
        },
        {
          "source": {
            "block": "9ceb3b45-bdb4-4b49-97b8-2219d8485575",
            "port": "out"
          },
          "target": {
            "block": "30bdc8a2-7863-4808-a5c7-a34bfe91fff5",
            "port": "933f83bd-67b5-4438-8c42-fb8d0c4e3e44"
          }
        },
        {
          "source": {
            "block": "330c6e67-64f8-4b1a-b136-5d50a1ae480f",
            "port": "3023efad-f646-4c33-bd02-09e6a3e08b56"
          },
          "target": {
            "block": "30bdc8a2-7863-4808-a5c7-a34bfe91fff5",
            "port": "c7fc1a07-3efc-43c2-9c06-dae41ddf9f91"
          }
        },
        {
          "source": {
            "block": "7f054239-9c31-4e2b-aaef-28fb2aa913ca",
            "port": "constant-out"
          },
          "target": {
            "block": "8c86608f-994b-495f-8661-6726f5a209e9",
            "port": "76233bbf-59fc-4e82-a9e7-0516fc2678f4"
          },
          "vertices": [
            {
              "x": 1816,
              "y": -152
            }
          ]
        },
        {
          "source": {
            "block": "8511a1e9-6a2c-43a1-a854-c69389bdcab9",
            "port": "635505c5-989a-4a0a-a470-a4e945e75573"
          },
          "target": {
            "block": "73be0e9e-8053-41fe-8f72-d27ec07daec9",
            "port": "7774e234-6df0-491f-a63e-a254a75808ef"
          },
          "vertices": [
            {
              "x": 1304,
              "y": 168
            }
          ]
        },
        {
          "source": {
            "block": "e5d7f42b-9b4e-4bbc-9fab-502b78415bae",
            "port": "245e0ae0-421c-40d1-a267-bf7433c744ba"
          },
          "target": {
            "block": "e42cec6a-1c28-4387-82e0-3f9b69e8b6c1",
            "port": "604a125b-ab32-48d3-9789-46efb1fcb0f9"
          },
          "vertices": [
            {
              "x": 2848,
              "y": 104
            }
          ]
        },
        {
          "source": {
            "block": "8c86608f-994b-495f-8661-6726f5a209e9",
            "port": "245e0ae0-421c-40d1-a267-bf7433c744ba"
          },
          "target": {
            "block": "e42cec6a-1c28-4387-82e0-3f9b69e8b6c1",
            "port": "3c53b74a-3b65-42ba-bcdb-14bf19ef17f0"
          }
        },
        {
          "source": {
            "block": "30bdc8a2-7863-4808-a5c7-a34bfe91fff5",
            "port": "394f5f05-f9c7-427d-96ef-1fdfe6217b62"
          },
          "target": {
            "block": "e42cec6a-1c28-4387-82e0-3f9b69e8b6c1",
            "port": "7774e234-6df0-491f-a63e-a254a75808ef"
          },
          "vertices": [
            {
              "x": 2752,
              "y": 48
            }
          ]
        },
        {
          "source": {
            "block": "e42cec6a-1c28-4387-82e0-3f9b69e8b6c1",
            "port": "947d0c96-7bd3-43d5-b549-c4c779628ef3"
          },
          "target": {
            "block": "d1d61e12-b8b4-4ebf-9819-f3ee538ce219",
            "port": "c7fc1a07-3efc-43c2-9c06-dae41ddf9f91"
          }
        },
        {
          "source": {
            "block": "9a1a51a2-fa03-413f-8d49-5b9f7ab59e2e",
            "port": "out"
          },
          "target": {
            "block": "d1d61e12-b8b4-4ebf-9819-f3ee538ce219",
            "port": "933f83bd-67b5-4438-8c42-fb8d0c4e3e44"
          }
        },
        {
          "source": {
            "block": "d1d61e12-b8b4-4ebf-9819-f3ee538ce219",
            "port": "394f5f05-f9c7-427d-96ef-1fdfe6217b62"
          },
          "target": {
            "block": "9da12b58-a282-43a7-ac77-bc3d2490d94b",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "30bdc8a2-7863-4808-a5c7-a34bfe91fff5",
            "port": "394f5f05-f9c7-427d-96ef-1fdfe6217b62"
          },
          "target": {
            "block": "0193f634-5071-4ead-b333-7e266725edb0",
            "port": "933f83bd-67b5-4438-8c42-fb8d0c4e3e44"
          }
        },
        {
          "source": {
            "block": "0193f634-5071-4ead-b333-7e266725edb0",
            "port": "394f5f05-f9c7-427d-96ef-1fdfe6217b62"
          },
          "target": {
            "block": "1db36b48-c321-4849-bde1-e28f61fec522",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "4b4067fd-0279-44bf-9f17-928a2a6eb78d",
            "port": "245e0ae0-421c-40d1-a267-bf7433c744ba"
          },
          "target": {
            "block": "0ab4bde9-8c23-4f45-8e04-653d9400b648",
            "port": "in"
          }
        }
      ]
    }
  },
  "dependencies": {
    "b01398144d8ce66aa06876ff33494c4c6ffdf1a8": {
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
              "id": "453de9c4-be14-43a5-bab4-d2236c288798",
              "type": "basic.input",
              "data": {
                "name": "StartTimer",
                "clock": false
              },
              "position": {
                "x": 240,
                "y": 216
              }
            },
            {
              "id": "245e0ae0-421c-40d1-a267-bf7433c744ba",
              "type": "basic.output",
              "data": {
                "name": "EndTimer"
              },
              "position": {
                "x": 520,
                "y": 216
              }
            },
            {
              "id": "76233bbf-59fc-4e82-a9e7-0516fc2678f4",
              "type": "basic.constant",
              "data": {
                "name": "Time",
                "value": "",
                "local": false
              },
              "position": {
                "x": 376,
                "y": 80
              }
            }
          ],
          "wires": []
        }
      }
    },
    "0fb9cfdc708796ebc2eab3109ec295c67aca4ecf": {
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
              "id": "6a039e67-04c1-410b-b986-34898652d1df",
              "type": "basic.input",
              "data": {
                "name": "Funktionscode",
                "range": "[5:0]",
                "clock": false,
                "size": 6
              },
              "position": {
                "x": 160,
                "y": 256
              }
            },
            {
              "id": "8bc9d8bb-b9a2-4002-a1e6-ca5a1e470242",
              "type": "basic.output",
              "data": {
                "name": "EndTimer"
              },
              "position": {
                "x": 424,
                "y": 272
              }
            },
            {
              "id": "3ecda7cd-09b6-42e3-9e51-3fcc9b6d6c94",
              "type": "basic.input",
              "data": {
                "name": "StartTimer",
                "clock": false
              },
              "position": {
                "x": 160,
                "y": 304
              }
            },
            {
              "id": "3161fc6c-6c47-4e48-9b89-d3deca4fa059",
              "type": "basic.memory",
              "data": {
                "name": "ALUTimeTable",
                "list": "",
                "local": true,
                "format": 2
              },
              "position": {
                "x": 256,
                "y": 80
              },
              "size": {
                "width": 160,
                "height": 176
              }
            }
          ],
          "wires": []
        }
      }
    },
    "53af2f188c923f8d4ab024fe3d812d8350ce560d": {
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
              "id": "b3ac97bb-472f-4e6b-971c-5f673f2c5f3e",
              "type": "basic.input",
              "data": {
                "name": "A",
                "clock": false
              },
              "position": {
                "x": 320,
                "y": 184
              }
            },
            {
              "id": "635505c5-989a-4a0a-a470-a4e945e75573",
              "type": "basic.output",
              "data": {
                "name": "AND"
              },
              "position": {
                "x": 480,
                "y": 208
              }
            },
            {
              "id": "dd2c5a18-b796-4ecd-89de-8cdf9d9d3f1d",
              "type": "basic.input",
              "data": {
                "name": "B",
                "clock": false
              },
              "position": {
                "x": 320,
                "y": 240
              }
            }
          ],
          "wires": []
        }
      }
    },
    "a45375f520aaee2b09644cfa3e6988e35bde977c": {
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
              "id": "604a125b-ab32-48d3-9789-46efb1fcb0f9",
              "type": "basic.input",
              "data": {
                "name": "RequiredTimer",
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
                "x": 224,
                "y": 192
              }
            },
            {
              "id": "3c53b74a-3b65-42ba-bcdb-14bf19ef17f0",
              "type": "basic.input",
              "data": {
                "name": "OptionalTimer",
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
                "x": 224,
                "y": 240
              }
            },
            {
              "id": "947d0c96-7bd3-43d5-b549-c4c779628ef3",
              "type": "basic.output",
              "data": {
                "name": "TimerEnd",
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
                "x": 456,
                "y": 240
              }
            },
            {
              "id": "7774e234-6df0-491f-a63e-a254a75808ef",
              "type": "basic.input",
              "data": {
                "name": "Option",
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
                "x": 224,
                "y": 288
              }
            }
          ],
          "wires": []
        }
      }
    },
    "ed4da404df0e56477018b4ce7381d59266ecfcde": {
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
              "id": "9a80c1c5-9f8f-4d77-af8c-8ea1b39f7798",
              "type": "basic.input",
              "data": {
                "name": "UnbedingterSprung",
                "clock": false
              },
              "position": {
                "x": 256,
                "y": 56
              }
            },
            {
              "id": "1b4f650c-edfe-4e25-950b-ba3cb24626ba",
              "type": "basic.input",
              "data": {
                "name": "Bedingung",
                "clock": false
              },
              "position": {
                "x": 256,
                "y": 104
              }
            },
            {
              "id": "8a2371ac-c852-4ee7-9298-caf8cb4f02de",
              "type": "basic.output",
              "data": {
                "name": "PCSchreibSignal"
              },
              "position": {
                "x": 424,
                "y": 104
              }
            },
            {
              "id": "accb2968-fc72-46a4-bb54-842b147e3a47",
              "type": "basic.input",
              "data": {
                "name": "BedingterSprung",
                "clock": false
              },
              "position": {
                "x": 256,
                "y": 152
              }
            }
          ],
          "wires": []
        }
      }
    },
    "e32915e54baaf1b40b61f17879ca840bcbd80e4d": {
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
              "id": "167ac2c5-225e-40b0-9b14-2b53ca5f549a",
              "type": "basic.input",
              "data": {
                "name": "UnbedingterSprung",
                "clock": false
              },
              "position": {
                "x": 248,
                "y": 168
              }
            },
            {
              "id": "5ead3ede-a5d8-4378-ae27-48d4fc57b9f8",
              "type": "basic.input",
              "data": {
                "name": "BedingterSprung",
                "clock": false
              },
              "position": {
                "x": 248,
                "y": 216
              }
            },
            {
              "id": "9f2a9f23-7aa8-4659-b183-b8eff5539364",
              "type": "basic.output",
              "data": {
                "name": "Store"
              },
              "position": {
                "x": 456,
                "y": 216
              }
            },
            {
              "id": "b1ad3d53-fe32-4df1-ad4f-679848b009e5",
              "type": "basic.input",
              "data": {
                "name": "StoreDatenBefehl",
                "clock": false
              },
              "position": {
                "x": 248,
                "y": 264
              }
            },
            {
              "id": "d1355006-bfe5-4a92-ae83-cffc26d432df",
              "type": "basic.output",
              "data": {
                "name": "Load"
              },
              "position": {
                "x": 456,
                "y": 264
              }
            },
            {
              "id": "3023efad-f646-4c33-bd02-09e6a3e08b56",
              "type": "basic.output",
              "data": {
                "name": "Default"
              },
              "position": {
                "x": 456,
                "y": 312
              }
            },
            {
              "id": "e94b3c88-b693-48e5-babc-64093c732f2f",
              "type": "basic.input",
              "data": {
                "name": "LoadDatenBefehl",
                "clock": false
              },
              "position": {
                "x": 248,
                "y": 312
              }
            },
            {
              "id": "b1600279-f0bd-41ac-96ec-76ec9a025042",
              "type": "basic.input",
              "data": {
                "name": "WritebackStart",
                "clock": false
              },
              "position": {
                "x": 248,
                "y": 360
              }
            }
          ],
          "wires": []
        }
      }
    },
    "83c824e89b7791423ed37f4e3d28d9ff58b1179a": {
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
              "id": "933f83bd-67b5-4438-8c42-fb8d0c4e3e44",
              "type": "basic.input",
              "data": {
                "name": "A",
                "clock": false
              },
              "position": {
                "x": 344,
                "y": 192
              }
            },
            {
              "id": "394f5f05-f9c7-427d-96ef-1fdfe6217b62",
              "type": "basic.output",
              "data": {
                "name": "OR"
              },
              "position": {
                "x": 512,
                "y": 216
              }
            },
            {
              "id": "c7fc1a07-3efc-43c2-9c06-dae41ddf9f91",
              "type": "basic.input",
              "data": {
                "name": "B",
                "clock": false
              },
              "position": {
                "x": 344,
                "y": 248
              }
            }
          ],
          "wires": []
        }
      }
    },
    "ffdae85b1cdcacbfc9c7d4dae7e6c06b1359e96c": {
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
              "id": "604a125b-ab32-48d3-9789-46efb1fcb0f9",
              "type": "basic.input",
              "data": {
                "name": "RequiredTimer",
                "clock": false
              },
              "position": {
                "x": 224,
                "y": 192
              }
            },
            {
              "id": "3c53b74a-3b65-42ba-bcdb-14bf19ef17f0",
              "type": "basic.input",
              "data": {
                "name": "OptionalTimer",
                "clock": false
              },
              "position": {
                "x": 224,
                "y": 240
              }
            },
            {
              "id": "947d0c96-7bd3-43d5-b549-c4c779628ef3",
              "type": "basic.output",
              "data": {
                "name": "TimerEnd"
              },
              "position": {
                "x": 456,
                "y": 240
              }
            },
            {
              "id": "7774e234-6df0-491f-a63e-a254a75808ef",
              "type": "basic.input",
              "data": {
                "name": "Option",
                "clock": false
              },
              "position": {
                "x": 224,
                "y": 288
              }
            }
          ],
          "wires": []
        }
      }
    }
  }
}