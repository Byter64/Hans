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
          "id": "453de9c4-be14-43a5-bab4-d2236c288798",
          "type": "basic.input",
          "data": {
            "name": "StartTimer",
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
            "x": 240,
            "y": 216
          }
        },
        {
          "id": "245e0ae0-421c-40d1-a267-bf7433c744ba",
          "type": "basic.output",
          "data": {
            "name": "EndTimer",
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
            "x": 520,
            "y": 216
          }
        },
        {
          "id": "76233bbf-59fc-4e82-a9e7-0516fc2678f4",
          "type": "basic.constant",
          "data": {
            "name": "Time",
            "value": "",
            "local": false
          },
          "position": {
            "x": 376,
            "y": 80
          }
        }
      ],
      "wires": []
    }
  },
  "dependencies": {}
}