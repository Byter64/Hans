{
  "version": "1.2",
  "package": {
    "name": "Multiplexer2",
    "version": "",
    "description": "Multiplext die möglichen ALU Eingänge (Register, kleiner und großer Immediate)",
    "author": "",
    "image": ""
  },
  "design": {
    "board": "ulx3s-85f",
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
            "x": 336,
            "y": 1136
          }
        },
        {
          "id": "4affdb8c-60f5-4939-b220-fe675ab6c9f9",
          "type": "basic.input",
          "data": {
            "name": "Immediate",
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
            "x": 304,
            "y": 1712
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
            "x": 1792,
            "y": 1744
          }
        },
        {
          "id": "8fd75eae-10da-4557-b9af-6dad340e913f",
          "type": "basic.input",
          "data": {
            "name": "KleinerImmediateAktiv",
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
            "y": 1816
          }
        },
        {
          "id": "081e5dbe-2409-4488-9430-fc8ae8d66ee3",
          "type": "basic.input",
          "data": {
            "name": "GroßerImmediateAktiv",
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
            "y": 1912
          }
        }
      ],
      "wires": []
    }
  },
  "dependencies": {}
}