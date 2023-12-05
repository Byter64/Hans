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
          "id": "9da12b58-a282-43a7-ac77-bc3d2490d94b",
          "type": "basic.output",
          "data": {
            "name": "LoadBefehlSignal"
          },
          "position": {
            "x": 1016,
            "y": 256
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
            "name": "PCSchreibSignal"
          },
          "position": {
            "x": 1016,
            "y": 520
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
            "x": 1032,
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
            "x": 1024,
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
            "y": 768
          }
        }
      ],
      "wires": []
    }
  },
  "dependencies": {}
}