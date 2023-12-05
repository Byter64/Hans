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
  },
  "dependencies": {}
}