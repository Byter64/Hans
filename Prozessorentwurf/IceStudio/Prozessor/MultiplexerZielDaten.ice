{
  "version": "1.2",
  "package": {
    "name": "Multiplexer1",
    "version": "",
    "description": "Multiplext Datan von der ALU, vom RAM und vom Immediate Operand",
    "author": "",
    "image": ""
  },
  "design": {
    "board": "ulx3s-85f",
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
            "x": 616,
            "y": 80
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
            "x": 2224,
            "y": 600
          }
        },
        {
          "id": "d91193b7-11e3-48ac-b2f5-08dd974d73e2",
          "type": "basic.input",
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
            ],
            "clock": false
          },
          "position": {
            "x": 600,
            "y": 1080
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
            "x": 616,
            "y": 1240
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
            "x": 624,
            "y": 3312
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
            "x": 616,
            "y": 3448
          }
        }
      ],
      "wires": []
    }
  },
  "dependencies": {}
}