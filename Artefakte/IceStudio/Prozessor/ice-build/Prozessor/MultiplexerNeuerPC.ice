{
  "version": "1.2",
  "package": {
    "name": "Multiplexer3",
    "version": "",
    "description": "Multiplext relative und absolute neue PCs. Die Bits 31 bis 26 werden ignoriert",
    "author": "",
    "image": ""
  },
  "design": {
    "board": "ulx3s-85f",
    "graph": {
      "blocks": [
        {
          "id": "a77b057e-811a-485a-b162-fd25b67e44b2",
          "type": "basic.input",
          "data": {
            "name": "RelativerPC",
            "range": "[31:0]",
            "clock": false,
            "size": 32
          },
          "position": {
            "x": 504,
            "y": -16
          }
        },
        {
          "id": "a68c98f1-ec9c-4375-ad28-160635fda5c8",
          "type": "basic.output",
          "data": {
            "name": "NeuerPC",
            "range": "[25:0]",
            "size": 26
          },
          "position": {
            "x": 1472,
            "y": 680
          }
        },
        {
          "id": "32347a79-d57f-4d2c-9522-ea070c5126cd",
          "type": "basic.input",
          "data": {
            "name": "AbsoluterPC",
            "range": "[31:0]",
            "clock": false,
            "size": 32
          },
          "position": {
            "x": 504,
            "y": 1088
          }
        },
        {
          "id": "994bee7c-b7fa-4989-a1a2-e6d7f1e16e5c",
          "type": "basic.input",
          "data": {
            "name": "IstAbsolut",
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
            "x": 504,
            "y": 2216
          }
        }
      ],
      "wires": []
    }
  },
  "dependencies": {}
}