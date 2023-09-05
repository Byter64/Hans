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
          "id": "9a80c1c5-9f8f-4d77-af8c-8ea1b39f7798",
          "type": "basic.input",
          "data": {
            "name": "UnbedingterSprung",
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
            "x": 256,
            "y": 56
          }
        },
        {
          "id": "1b4f650c-edfe-4e25-950b-ba3cb24626ba",
          "type": "basic.input",
          "data": {
            "name": "Bedingung",
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
            "x": 256,
            "y": 104
          }
        },
        {
          "id": "8a2371ac-c852-4ee7-9298-caf8cb4f02de",
          "type": "basic.output",
          "data": {
            "name": "PCSchreibSignal",
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
            "x": 424,
            "y": 104
          }
        },
        {
          "id": "accb2968-fc72-46a4-bb54-842b147e3a47",
          "type": "basic.input",
          "data": {
            "name": "BedingterSprung",
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
            "x": 256,
            "y": 152
          }
        }
      ],
      "wires": []
    }
  },
  "dependencies": {}
}