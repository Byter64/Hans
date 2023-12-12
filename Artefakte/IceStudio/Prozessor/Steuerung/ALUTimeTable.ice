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
          "id": "6a039e67-04c1-410b-b986-34898652d1df",
          "type": "basic.input",
          "data": {
            "name": "Funktionscode",
            "range": "[5:0]",
            "clock": false,
            "size": 6
          },
          "position": {
            "x": 160,
            "y": 256
          }
        },
        {
          "id": "8bc9d8bb-b9a2-4002-a1e6-ca5a1e470242",
          "type": "basic.output",
          "data": {
            "name": "EndTimer"
          },
          "position": {
            "x": 424,
            "y": 272
          }
        },
        {
          "id": "3ecda7cd-09b6-42e3-9e51-3fcc9b6d6c94",
          "type": "basic.input",
          "data": {
            "name": "StartTimer",
            "clock": false
          },
          "position": {
            "x": 160,
            "y": 304
          }
        },
        {
          "id": "3161fc6c-6c47-4e48-9b89-d3deca4fa059",
          "type": "basic.memory",
          "data": {
            "name": "ALUTimeTable",
            "list": "",
            "local": true,
            "format": 2
          },
          "position": {
            "x": 256,
            "y": 80
          },
          "size": {
            "width": 160,
            "height": 176
          }
        }
      ],
      "wires": []
    }
  },
  "dependencies": {}
}