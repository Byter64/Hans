{
  "version": "1.2",
  "package": {
    "name": "1-Bit adder",
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
          "id": "272b8b87-6a69-4649-8391-79c70e95365c",
          "type": "basic.output",
          "data": {
            "name": "value",
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
            "x": 1080,
            "y": 312
          }
        },
        {
          "id": "264d6977-d201-4485-816f-c3dfdaf95cc6",
          "type": "basic.input",
          "data": {
            "name": "clk",
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
            "y": 320
          }
        }
      ],
      "wires": []
    }
  },
  "dependencies": {}
}