{
  "version": "1.2",
  "package": {
    "name": "Register",
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
          "id": "d3449a5c-f0dc-4952-9612-04e5eb031b42",
          "type": "basic.input",
          "data": {
            "name": "ZielDaten",
            "range": "[31:0]",
            "clock": false,
            "size": 32
          },
          "position": {
            "x": 552,
            "y": 112
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
            "x": 1352,
            "y": 200
          }
        },
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
            "x": 544,
            "y": 256
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
            "x": 544,
            "y": 496
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
            "x": 1736,
            "y": 616
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
            "x": 544,
            "y": 752
          }
        },
        {
          "id": "ea81c130-e6a1-45e5-966c-fd21937fdc5b",
          "type": "basic.input",
          "data": {
            "name": "Schreibsignal",
            "clock": false
          },
          "position": {
            "x": 528,
            "y": 1184
          }
        },
        {
          "id": "d765cb7d-0e3c-4ac4-95eb-0a66436723e4",
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
            "x": 520,
            "y": 1320
          }
        },
        {
          "id": "414009fa-6c6e-45e7-a2f6-c4230c024177",
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
            "x": 520,
            "y": 1392
          }
        }
      ],
      "wires": []
    }
  },
  "dependencies": {}
}