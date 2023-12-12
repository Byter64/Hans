{
  "version": "1.2",
  "package": {
    "name": "Instruktionsdekodierer",
    "version": "0.1",
    "description": "",
    "author": "Moritz, Yannik, Timo",
    "image": ""
  },
  "design": {
    "board": "ulx3s-85f",
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
            "x": 672,
            "y": 32
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
            "x": 304,
            "y": 40
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
            "x": 304,
            "y": 248
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
            "x": 672,
            "y": 272
          }
        },
        {
          "id": "32cd02e6-22e8-4e91-a825-0019f89a7cec",
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
            "x": 296,
            "y": 376
          }
        },
        {
          "id": "2a236e27-5ec9-497d-8f55-9c76ce13e915",
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
            "x": 288,
            "y": 448
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
            "x": 672,
            "y": 504
          }
        },
        {
          "id": "587e1853-46bb-4b98-98ff-16ff7acaf535",
          "type": "basic.output",
          "data": {
            "name": "IDaten",
            "range": "[25:0]",
            "size": 26
          },
          "position": {
            "x": 672,
            "y": 728
          }
        },
        {
          "id": "dfa86c66-e8f8-4c43-b5b9-fa54c88e5589",
          "type": "basic.output",
          "data": {
            "name": "KleinerImmediateAktiv",
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
            "x": 672,
            "y": 1488
          }
        },
        {
          "id": "bcd9eec7-0240-45ca-98a9-db73e4229fae",
          "type": "basic.output",
          "data": {
            "name": "GroßerImmediateAktiv",
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
            "x": 672,
            "y": 1600
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
            "x": 672,
            "y": 1672
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
            "x": 672,
            "y": 1888
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
            "x": 672,
            "y": 1952
          }
        },
        {
          "id": "d0cf2d6f-6452-4308-8e29-0e365f5d5fd6",
          "type": "basic.output",
          "data": {
            "name": "FloatBefehl"
          },
          "position": {
            "x": 672,
            "y": 2016
          }
        },
        {
          "id": "1b124991-cac3-4201-974f-691e1cc59c16",
          "type": "basic.output",
          "data": {
            "name": "LoadBefehl"
          },
          "position": {
            "x": 672,
            "y": 2088
          }
        },
        {
          "id": "e2915c0c-a75c-49dc-8624-776b13331de7",
          "type": "basic.output",
          "data": {
            "name": "StoreBefehl"
          },
          "position": {
            "x": 672,
            "y": 2160
          }
        },
        {
          "id": "1d97c60c-7bc2-4439-b9c5-35fcecda8278",
          "type": "basic.output",
          "data": {
            "name": "UnbedingterSprungBefehl"
          },
          "position": {
            "x": 672,
            "y": 2224
          }
        },
        {
          "id": "a8512379-fdf6-4ba5-a4c4-573450c25069",
          "type": "basic.output",
          "data": {
            "name": "BedingterSprung"
          },
          "position": {
            "x": 672,
            "y": 2296
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
            "x": 672,
            "y": 2368
          }
        }
      ],
      "wires": []
    }
  },
  "dependencies": {}
}