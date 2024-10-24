{
  "version": "1.2",
  "package": {
    "name": "Bildpuffer",
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
          "id": "1292eedc-30aa-4c04-85cd-0dd5d2c4689b",
          "type": "basic.output",
          "data": {
            "name": "x_out",
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
            "x": 1152,
            "y": 256
          }
        },
        {
          "id": "a5d312e9-8a9e-4a98-82dc-d7162cf43f89",
          "type": "basic.input",
          "data": {
            "name": "Clk",
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
            "x": 720,
            "y": 264
          }
        },
        {
          "id": "d6ced990-dafd-41cc-9a46-473a791a8942",
          "type": "basic.output",
          "data": {
            "name": "y_out",
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
            "x": 1152,
            "y": 312
          }
        },
        {
          "id": "f12ebabb-84b9-402c-a465-ccbc52455d1d",
          "type": "basic.input",
          "data": {
            "name": "x",
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
            "x": 720,
            "y": 336
          }
        },
        {
          "id": "81890861-386c-4d60-98f3-87236bbdb6a1",
          "type": "basic.output",
          "data": {
            "name": "pixel_data",
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
            "x": 1152,
            "y": 368
          }
        },
        {
          "id": "2e81fc4f-7e2c-46a5-8c8c-3d94e7928e41",
          "type": "basic.input",
          "data": {
            "name": "y",
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
            "x": 720,
            "y": 392
          }
        },
        {
          "id": "3bf4d81d-fedc-4a14-9489-4f86fabe1cb5",
          "type": "basic.input",
          "data": {
            "name": "color",
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
            "x": 720,
            "y": 456
          }
        },
        {
          "id": "153911c5-0dd5-4a8d-ba3b-f234499a33ba",
          "type": "basic.input",
          "data": {
            "name": "write",
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
            "x": 720,
            "y": 512
          }
        }
      ],
      "wires": []
    }
  },
  "dependencies": {}
}