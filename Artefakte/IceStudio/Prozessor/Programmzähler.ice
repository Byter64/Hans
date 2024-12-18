{
  "version": "1.2",
  "package": {
    "name": "Programmzähler",
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
          "id": "43b6acdf-97bc-41a1-93d0-21bc0f4c487c",
          "type": "basic.output",
          "data": {
            "name": "AktuellerPC ",
            "range": "[25:0]",
            "size": 26
          },
          "position": {
            "x": 1408,
            "y": -32
          }
        },
        {
          "id": "152891e5-143e-4511-a4bf-ca49b6acb7f0",
          "type": "basic.output",
          "data": {
            "name": "ErhöhterPC",
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
            "x": 1408,
            "y": 224
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
            "name": "Schreibsignal",
            "clock": false
          },
          "position": {
            "x": 616,
            "y": 528
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
            "y": 632
          }
        },
        {
          "id": "17e637ef-d097-4a89-9612-670103f94aa3",
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
            "x": 616,
            "y": 728
          }
        }
      ],
      "wires": []
    }
  },
  "dependencies": {}
}