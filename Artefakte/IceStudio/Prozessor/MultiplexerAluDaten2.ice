{
  "version": "1.2",
  "package": {
    "name": "Multiplexer4",
    "version": "",
    "description": "Multiplext den aktuellen PC mit den Quelldaten2",
    "author": "",
    "image": ""
  },
  "design": {
    "board": "ulx3s-85f",
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
            "x": 528,
            "y": 272
          }
        },
        {
          "id": "fee8ac0d-c6f4-48ce-a75d-2a904ebd1296",
          "type": "basic.output",
          "data": {
            "name": "Daten2",
            "range": "[31:0]",
            "size": 32
          },
          "position": {
            "x": 1016,
            "y": 320
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
            "x": 528,
            "y": 384
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
            "x": 520,
            "y": 600
          }
        }
      ],
      "wires": []
    }
  },
  "dependencies": {}
}