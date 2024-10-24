{
  "version": "1.2",
  "package": {
    "name": "DVI_D_Converter",
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
          "id": "8a9606d8-fc3a-4842-aa6b-c60f03853d0c",
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
            "x": 768,
            "y": 232
          }
        },
        {
          "id": "e32d9c76-aebf-4553-b86b-fa8ca0c6dafa",
          "type": "basic.output",
          "data": {
            "name": "gpdi_dp",
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
            "x": 1176,
            "y": 256
          }
        },
        {
          "id": "131d63fe-1264-4bc9-97b0-159aa32f1740",
          "type": "basic.input",
          "data": {
            "name": "pixel_data",
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
            "x": 768,
            "y": 296
          }
        },
        {
          "id": "b74e6148-cfa6-4988-9b46-8631edd0c531",
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
            "x": 760,
            "y": 360
          }
        },
        {
          "id": "d2643e97-625c-42e3-ab8e-c9831617870d",
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
            "x": 760,
            "y": 408
          }
        }
      ],
      "wires": []
    }
  },
  "dependencies": {}
}