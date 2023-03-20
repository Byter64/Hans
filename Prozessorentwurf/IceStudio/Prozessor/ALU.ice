{
  "version": "1.2",
  "package": {
    "name": "ALU",
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
          "id": "c5ef714f-a342-4fd1-a944-e268b875e8d8",
          "type": "basic.input",
          "data": {
            "name": "Daten1",
            "range": "[31:0]",
            "clock": false,
            "size": 32
          },
          "position": {
            "x": 600,
            "y": 96
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
            "x": 1688,
            "y": 552
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
            "x": 608,
            "y": 648
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
            "x": 616,
            "y": 752
          }
        },
        {
          "id": "821416e3-f3d9-4ed9-8ad7-9f923ca5158a",
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
            "x": 608,
            "y": 872
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
            "x": 608,
            "y": 960
          }
        }
      ],
      "wires": []
    }
  },
  "dependencies": {}
}