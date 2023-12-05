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
          "id": "167ac2c5-225e-40b0-9b14-2b53ca5f549a",
          "type": "basic.input",
          "data": {
            "name": "UnbedingterSprung",
            "clock": false
          },
          "position": {
            "x": 248,
            "y": 168
          }
        },
        {
          "id": "5ead3ede-a5d8-4378-ae27-48d4fc57b9f8",
          "type": "basic.input",
          "data": {
            "name": "BedingterSprung",
            "clock": false
          },
          "position": {
            "x": 248,
            "y": 216
          }
        },
        {
          "id": "9f2a9f23-7aa8-4659-b183-b8eff5539364",
          "type": "basic.output",
          "data": {
            "name": "Store"
          },
          "position": {
            "x": 456,
            "y": 216
          }
        },
        {
          "id": "b1ad3d53-fe32-4df1-ad4f-679848b009e5",
          "type": "basic.input",
          "data": {
            "name": "StoreDatenBefehl",
            "clock": false
          },
          "position": {
            "x": 248,
            "y": 264
          }
        },
        {
          "id": "d1355006-bfe5-4a92-ae83-cffc26d432df",
          "type": "basic.output",
          "data": {
            "name": "Load"
          },
          "position": {
            "x": 456,
            "y": 264
          }
        },
        {
          "id": "3023efad-f646-4c33-bd02-09e6a3e08b56",
          "type": "basic.output",
          "data": {
            "name": "Default"
          },
          "position": {
            "x": 456,
            "y": 312
          }
        },
        {
          "id": "e94b3c88-b693-48e5-babc-64093c732f2f",
          "type": "basic.input",
          "data": {
            "name": "LoadDatenBefehl",
            "clock": false
          },
          "position": {
            "x": 248,
            "y": 312
          }
        },
        {
          "id": "b1600279-f0bd-41ac-96ec-76ec9a025042",
          "type": "basic.input",
          "data": {
            "name": "WritebackStart",
            "clock": false
          },
          "position": {
            "x": 248,
            "y": 360
          }
        }
      ],
      "wires": []
    }
  },
  "dependencies": {}
}