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
          "id": "8c9a3738-f2c1-45ad-aabe-79268bddc2d4",
          "type": "b3bf395dd20d607ccbc9d6e3f93b905f852a3b89",
          "position": {
            "x": 1304,
            "y": 568
          },
          "size": {
            "width": 96,
            "height": 192
          }
        }
      ],
      "wires": []
    }
  },
  "dependencies": {
    "b3bf395dd20d607ccbc9d6e3f93b905f852a3b89": {
      "package": {
        "name": "",
        "version": "",
        "description": "",
        "author": "",
        "image": ""
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "71d09b68-1b29-4e2f-91bf-f6eea1192c3d",
              "type": "basic.input",
              "data": {
                "name": "RAMDaten",
                "range": "[31:0]",
                "clock": false,
                "size": 32
              },
              "position": {
                "x": 64,
                "y": -32
              }
            },
            {
              "id": "0718d553-0078-4ab9-a38a-e2f1ed4bed96",
              "type": "basic.input",
              "data": {
                "name": "Befehl",
                "range": "[31:0]",
                "clock": false,
                "size": 32
              },
              "position": {
                "x": -184,
                "y": 328
              }
            },
            {
              "id": "a6178528-cf3a-4491-ab88-b77746082b7d",
              "type": "basic.output",
              "data": {
                "name": "BefehlAdresse",
                "range": "[25:0]",
                "size": 26
              },
              "position": {
                "x": 2024,
                "y": 336
              }
            },
            {
              "id": "30d56940-a6fb-482d-91f3-ac06f90d7ecb",
              "type": "basic.output",
              "data": {
                "name": "Adresse",
                "range": "[31:0]",
                "size": 32
              },
              "position": {
                "x": 2024,
                "y": 376
              }
            },
            {
              "id": "adfda51a-2a0c-4bf4-9fa6-94f72e266410",
              "type": "basic.output",
              "data": {
                "name": "StoreDaten",
                "range": "[31:0]",
                "size": 32
              },
              "position": {
                "x": 2024,
                "y": 416
              }
            },
            {
              "id": "cf671e1c-92b9-4400-b9d7-d5e0b48e3281",
              "type": "basic.output",
              "data": {
                "name": "LoadBefehlSignal"
              },
              "position": {
                "x": 2024,
                "y": 456
              }
            },
            {
              "id": "cebe3cbc-cc8a-4c79-b698-47134e3e498a",
              "type": "basic.output",
              "data": {
                "name": "LoadDatenSignal"
              },
              "position": {
                "x": 2024,
                "y": 496
              }
            },
            {
              "id": "7dc1a9eb-86ef-4cb1-934d-9863b51aa76f",
              "type": "basic.output",
              "data": {
                "name": "StoreDatenSignal"
              },
              "position": {
                "x": 2024,
                "y": 536
              }
            },
            {
              "id": "0d06c239-ce5a-442f-8287-23f5c43cd1a0",
              "type": "basic.input",
              "data": {
                "name": "BefehlGeladen",
                "clock": false
              },
              "position": {
                "x": 464,
                "y": 840
              }
            },
            {
              "id": "9a871f07-953b-40dd-be01-aafff0c87853",
              "type": "basic.input",
              "data": {
                "name": "DatenGeladen",
                "clock": false
              },
              "position": {
                "x": 464,
                "y": 888
              }
            },
            {
              "id": "04ab5db4-493b-4ecc-a743-534ec5a17ce6",
              "type": "basic.input",
              "data": {
                "name": "DatenGespeichert",
                "clock": false
              },
              "position": {
                "x": 464,
                "y": 936
              }
            },
            {
              "id": "395f69bf-12c6-469c-908e-cfc077391919",
              "type": "07c3e9937e380a4a69b76ed9acb607d974440968",
              "position": {
                "x": 40,
                "y": 120
              },
              "size": {
                "width": 96,
                "height": 448
              }
            },
            {
              "id": "6a191ea9-892f-4c41-bd1d-ce710d24ea47",
              "type": "0980595208e1182fd423fea62d5bf8166a29b47c",
              "position": {
                "x": 1584,
                "y": 672
              },
              "size": {
                "width": 96,
                "height": 128
              }
            },
            {
              "id": "12c8688c-4aca-440a-8f1d-39a524ccd960",
              "type": "d073daebe985cc6e840580d5c126e4b9b741fafd",
              "position": {
                "x": 792,
                "y": 432
              },
              "size": {
                "width": 96,
                "height": 416
              }
            },
            {
              "id": "c431a9e4-bfbe-4d83-a71d-b8b0f07c90a0",
              "type": "51b9cf88c750a154b49353272857414fafc78c5e",
              "position": {
                "x": 824,
                "y": -16
              },
              "size": {
                "width": 96,
                "height": 224
              }
            },
            {
              "id": "31990c40-3215-480c-a1f5-e77be6861b41",
              "type": "625d79635c0735eb022174bd3b756bc09c6d1186",
              "position": {
                "x": 1632,
                "y": 168
              },
              "size": {
                "width": 96,
                "height": 192
              }
            },
            {
              "id": "ad9ef40d-c49b-42a8-a7fa-5e7eea2266c2",
              "type": "aa9caf8ebcb7b0229e1a641e9bda55962d23528d",
              "position": {
                "x": 576,
                "y": -80
              },
              "size": {
                "width": 96,
                "height": 160
              }
            },
            {
              "id": "84143171-b5b0-438e-a4a0-fe844c0fbc38",
              "type": "1215e7c917c45969312f4d1b2e4c239094400d4c",
              "position": {
                "x": 352,
                "y": 624
              },
              "size": {
                "width": 96,
                "height": 64
              }
            },
            {
              "id": "95cc4275-7076-432b-85e0-a4f6402318ea",
              "type": "ef4843571745ee7cf39510612ba7bd08ba00fb02",
              "position": {
                "x": 1312,
                "y": 184
              },
              "size": {
                "width": 96,
                "height": 96
              }
            },
            {
              "id": "976035e9-d75d-477a-b245-cc03c7cc6329",
              "type": "433ce5316c1247a4e0a16f5007c3b5cf1c56a0e3",
              "position": {
                "x": 1368,
                "y": 584
              },
              "size": {
                "width": 96,
                "height": 96
              }
            },
            {
              "id": "0560a46c-d0ab-428a-bf30-0167bed59c70",
              "type": "26af9a43487ae90923261d1771fd552a03494500",
              "position": {
                "x": 1416,
                "y": 56
              },
              "size": {
                "width": 96,
                "height": 96
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "395f69bf-12c6-469c-908e-cfc077391919",
                "port": "e2915c0c-a75c-49dc-8624-776b13331de7"
              },
              "target": {
                "block": "12c8688c-4aca-440a-8f1d-39a524ccd960",
                "port": "03069b59-0bc1-4662-96b6-a9dfc7c22b0f"
              },
              "vertices": [
                {
                  "x": 384,
                  "y": 488
                }
              ]
            },
            {
              "source": {
                "block": "395f69bf-12c6-469c-908e-cfc077391919",
                "port": "1d97c60c-7bc2-4439-b9c5-35fcecda8278"
              },
              "target": {
                "block": "12c8688c-4aca-440a-8f1d-39a524ccd960",
                "port": "1f7015d3-8902-465c-881e-593942403cdf"
              },
              "vertices": [
                {
                  "x": 288,
                  "y": 552
                }
              ]
            },
            {
              "source": {
                "block": "395f69bf-12c6-469c-908e-cfc077391919",
                "port": "a8512379-fdf6-4ba5-a4c4-573450c25069"
              },
              "target": {
                "block": "12c8688c-4aca-440a-8f1d-39a524ccd960",
                "port": "8967c841-23d3-4222-8105-c75fc5a893c8"
              },
              "vertices": [
                {
                  "x": 272,
                  "y": 592
                }
              ]
            },
            {
              "source": {
                "block": "12c8688c-4aca-440a-8f1d-39a524ccd960",
                "port": "5235af3b-edc5-46bf-8f5f-30990f32da81"
              },
              "target": {
                "block": "6a191ea9-892f-4c41-bd1d-ce710d24ea47",
                "port": "ef8e04d2-5d14-4cdb-8c52-beef5541c4c4"
              },
              "vertices": []
            },
            {
              "source": {
                "block": "395f69bf-12c6-469c-908e-cfc077391919",
                "port": "c9c248e9-c9d1-45c9-b678-09aa7d4d5a5f"
              },
              "target": {
                "block": "31990c40-3215-480c-a1f5-e77be6861b41",
                "port": "cd22b151-94d3-4fb2-8e7f-cbccdf809bf4"
              },
              "vertices": [
                {
                  "x": 1520,
                  "y": 296
                }
              ],
              "size": 6
            },
            {
              "source": {
                "block": "395f69bf-12c6-469c-908e-cfc077391919",
                "port": "c614052d-8b0e-49f3-97db-f1dc82997efe"
              },
              "target": {
                "block": "c431a9e4-bfbe-4d83-a71d-b8b0f07c90a0",
                "port": "a1b808fc-82af-4985-ad41-55f4d95b7a66"
              },
              "vertices": [
                {
                  "x": 688,
                  "y": 96
                }
              ],
              "size": 6
            },
            {
              "source": {
                "block": "395f69bf-12c6-469c-908e-cfc077391919",
                "port": "044b0036-8e8b-47c8-a1a9-6c62209dc87b"
              },
              "target": {
                "block": "c431a9e4-bfbe-4d83-a71d-b8b0f07c90a0",
                "port": "892206be-caea-4813-b605-445dcd779427"
              },
              "vertices": [
                {
                  "x": 712,
                  "y": 72
                }
              ],
              "size": 6
            },
            {
              "source": {
                "block": "395f69bf-12c6-469c-908e-cfc077391919",
                "port": "317354c3-5b79-4f8e-a5ca-64033ae5e585"
              },
              "target": {
                "block": "c431a9e4-bfbe-4d83-a71d-b8b0f07c90a0",
                "port": "37f93bb3-455b-44e4-bd70-a8a59802a415"
              },
              "vertices": [
                {
                  "x": 736,
                  "y": 160
                }
              ],
              "size": 6
            },
            {
              "source": {
                "block": "395f69bf-12c6-469c-908e-cfc077391919",
                "port": "a7924039-31ca-45c6-8a7b-a4434c8bd6d1"
              },
              "target": {
                "block": "ad9ef40d-c49b-42a8-a7fa-5e7eea2266c2",
                "port": "6d9a9010-9997-45ca-9724-9b5b4fc74839"
              },
              "vertices": [
                {
                  "x": 384,
                  "y": 112
                }
              ]
            },
            {
              "source": {
                "block": "71d09b68-1b29-4e2f-91bf-f6eea1192c3d",
                "port": "out"
              },
              "target": {
                "block": "ad9ef40d-c49b-42a8-a7fa-5e7eea2266c2",
                "port": "95777557-33b9-4fae-8324-55ca8d0ea6c8"
              },
              "size": 32
            },
            {
              "source": {
                "block": "31990c40-3215-480c-a1f5-e77be6861b41",
                "port": "0450dc41-6526-407d-bce5-a63817a776ed"
              },
              "target": {
                "block": "ad9ef40d-c49b-42a8-a7fa-5e7eea2266c2",
                "port": "6c5c6aaa-2fb6-40f4-910c-fa001a1cf5fd"
              },
              "vertices": [
                {
                  "x": 1600,
                  "y": -136
                },
                {
                  "x": 392,
                  "y": -128
                }
              ],
              "size": 32
            },
            {
              "source": {
                "block": "ad9ef40d-c49b-42a8-a7fa-5e7eea2266c2",
                "port": "b7f8b7e9-59b8-4991-a6c1-51593d688b58"
              },
              "target": {
                "block": "c431a9e4-bfbe-4d83-a71d-b8b0f07c90a0",
                "port": "d3449a5c-f0dc-4952-9612-04e5eb031b42"
              },
              "size": 32
            },
            {
              "source": {
                "block": "c431a9e4-bfbe-4d83-a71d-b8b0f07c90a0",
                "port": "b8f0d093-53fa-4444-9246-8351c4234bbf"
              },
              "target": {
                "block": "84143171-b5b0-438e-a4a0-fe844c0fbc38",
                "port": "0fe5550a-6ffd-4cc7-8fcc-3a62a6c8c2c4"
              },
              "vertices": [
                {
                  "x": 1072,
                  "y": 32
                },
                {
                  "x": 440,
                  "y": -112
                }
              ],
              "size": 32
            },
            {
              "source": {
                "block": "84143171-b5b0-438e-a4a0-fe844c0fbc38",
                "port": "b0cef370-f1b8-40aa-9372-37c6e08dc3dd"
              },
              "target": {
                "block": "12c8688c-4aca-440a-8f1d-39a524ccd960",
                "port": "3773f6b8-a9b2-407e-a459-f27a07b3d59f"
              },
              "vertices": [
                {
                  "x": 616,
                  "y": 648
                }
              ]
            },
            {
              "source": {
                "block": "95cc4275-7076-432b-85e0-a4f6402318ea",
                "port": "7aa4c854-00a8-436d-9729-901eeb493bb7"
              },
              "target": {
                "block": "31990c40-3215-480c-a1f5-e77be6861b41",
                "port": "7a0ad72d-1e1f-4a7d-a98f-8af8dedb49e3"
              },
              "size": 32
            },
            {
              "source": {
                "block": "0718d553-0078-4ab9-a38a-e2f1ed4bed96",
                "port": "out"
              },
              "target": {
                "block": "395f69bf-12c6-469c-908e-cfc077391919",
                "port": "83123e85-a9ee-4fa5-bcbc-2c841ab7e832"
              },
              "size": 32
            },
            {
              "source": {
                "block": "12c8688c-4aca-440a-8f1d-39a524ccd960",
                "port": "9da12b58-a282-43a7-ac77-bc3d2490d94b"
              },
              "target": {
                "block": "cf671e1c-92b9-4400-b9d7-d5e0b48e3281",
                "port": "in"
              },
              "vertices": [
                {
                  "x": 1096,
                  "y": 520
                }
              ]
            },
            {
              "source": {
                "block": "12c8688c-4aca-440a-8f1d-39a524ccd960",
                "port": "6427d2c6-40cd-4423-8195-684d285df381"
              },
              "target": {
                "block": "cebe3cbc-cc8a-4c79-b698-47134e3e498a",
                "port": "in"
              },
              "vertices": [
                {
                  "x": 1120,
                  "y": 544
                }
              ]
            },
            {
              "source": {
                "block": "12c8688c-4aca-440a-8f1d-39a524ccd960",
                "port": "c1276045-a74b-455d-908a-edc85242ba90"
              },
              "target": {
                "block": "7dc1a9eb-86ef-4cb1-934d-9863b51aa76f",
                "port": "in"
              },
              "vertices": [
                {
                  "x": 1144,
                  "y": 592
                }
              ]
            },
            {
              "source": {
                "block": "976035e9-d75d-477a-b245-cc03c7cc6329",
                "port": "a68c98f1-ec9c-4375-ad28-160635fda5c8"
              },
              "target": {
                "block": "6a191ea9-892f-4c41-bd1d-ce710d24ea47",
                "port": "1ff29fca-25ea-4fc8-a224-f4fe10a518bd"
              },
              "size": 26
            },
            {
              "source": {
                "block": "31990c40-3215-480c-a1f5-e77be6861b41",
                "port": "0450dc41-6526-407d-bce5-a63817a776ed"
              },
              "target": {
                "block": "976035e9-d75d-477a-b245-cc03c7cc6329",
                "port": "a77b057e-811a-485a-b162-fd25b67e44b2"
              },
              "vertices": [
                {
                  "x": 1232,
                  "y": 416
                }
              ],
              "size": 32
            },
            {
              "source": {
                "block": "c431a9e4-bfbe-4d83-a71d-b8b0f07c90a0",
                "port": "b8f0d093-53fa-4444-9246-8351c4234bbf"
              },
              "target": {
                "block": "976035e9-d75d-477a-b245-cc03c7cc6329",
                "port": "32347a79-d57f-4d2c-9522-ea070c5126cd"
              },
              "vertices": [
                {
                  "x": 1072,
                  "y": 392
                }
              ],
              "size": 32
            },
            {
              "source": {
                "block": "395f69bf-12c6-469c-908e-cfc077391919",
                "port": "51d1842d-e9d7-426f-b46f-45adefc55b91"
              },
              "target": {
                "block": "976035e9-d75d-477a-b245-cc03c7cc6329",
                "port": "994bee7c-b7fa-4989-a1a2-e6d7f1e16e5c"
              },
              "vertices": [
                {
                  "x": 232,
                  "y": 1008
                }
              ]
            },
            {
              "source": {
                "block": "31990c40-3215-480c-a1f5-e77be6861b41",
                "port": "0450dc41-6526-407d-bce5-a63817a776ed"
              },
              "target": {
                "block": "30d56940-a6fb-482d-91f3-ac06f90d7ecb",
                "port": "in"
              },
              "size": 32
            },
            {
              "source": {
                "block": "c431a9e4-bfbe-4d83-a71d-b8b0f07c90a0",
                "port": "8bfa2dd1-de46-4329-99d9-ac064d57ce94"
              },
              "target": {
                "block": "adfda51a-2a0c-4bf4-9fa6-94f72e266410",
                "port": "in"
              },
              "vertices": [
                {
                  "x": 1136,
                  "y": 200
                }
              ],
              "size": 32
            },
            {
              "source": {
                "block": "c431a9e4-bfbe-4d83-a71d-b8b0f07c90a0",
                "port": "b8f0d093-53fa-4444-9246-8351c4234bbf"
              },
              "target": {
                "block": "0560a46c-d0ab-428a-bf30-0167bed59c70",
                "port": "d6c04894-ff4c-4827-b35d-7dbd31a34e4f"
              },
              "vertices": [
                {
                  "x": 1248,
                  "y": 72
                }
              ],
              "size": 32
            },
            {
              "source": {
                "block": "395f69bf-12c6-469c-908e-cfc077391919",
                "port": "c39adb98-1725-4957-b5ab-b04dac737ffb"
              },
              "target": {
                "block": "0560a46c-d0ab-428a-bf30-0167bed59c70",
                "port": "7461aa4d-447c-46cc-92b2-f437b6fb7557"
              },
              "vertices": [
                {
                  "x": 1120,
                  "y": 208
                }
              ]
            },
            {
              "source": {
                "block": "12c8688c-4aca-440a-8f1d-39a524ccd960",
                "port": "8a617e6e-3f08-4591-9c64-7dccb0cdfca0"
              },
              "target": {
                "block": "395f69bf-12c6-469c-908e-cfc077391919",
                "port": "a25f91cb-5ceb-473c-a646-15ee0036da29"
              },
              "vertices": [
                {
                  "x": -24,
                  "y": 1032
                }
              ]
            },
            {
              "source": {
                "block": "395f69bf-12c6-469c-908e-cfc077391919",
                "port": "a7924039-31ca-45c6-8a7b-a4434c8bd6d1"
              },
              "target": {
                "block": "12c8688c-4aca-440a-8f1d-39a524ccd960",
                "port": "80701733-2c21-4dd6-96ff-ede745745459"
              },
              "vertices": [
                {
                  "x": 360,
                  "y": 456
                }
              ]
            },
            {
              "source": {
                "block": "c431a9e4-bfbe-4d83-a71d-b8b0f07c90a0",
                "port": "8bfa2dd1-de46-4329-99d9-ac064d57ce94"
              },
              "target": {
                "block": "95cc4275-7076-432b-85e0-a4f6402318ea",
                "port": "3128ddd7-9d74-4768-aa0e-fc956aa0734d"
              },
              "vertices": [
                {
                  "x": 1136,
                  "y": 200
                }
              ],
              "size": 32
            },
            {
              "source": {
                "block": "12c8688c-4aca-440a-8f1d-39a524ccd960",
                "port": "1db36b48-c321-4849-bde1-e28f61fec522"
              },
              "target": {
                "block": "c431a9e4-bfbe-4d83-a71d-b8b0f07c90a0",
                "port": "a81bee85-0811-40bf-82a9-dbd224184b4c"
              },
              "vertices": [
                {
                  "x": 904,
                  "y": 392
                }
              ]
            },
            {
              "source": {
                "block": "9a871f07-953b-40dd-be01-aafff0c87853",
                "port": "out"
              },
              "target": {
                "block": "12c8688c-4aca-440a-8f1d-39a524ccd960",
                "port": "9ceb3b45-bdb4-4b49-97b8-2219d8485575"
              }
            },
            {
              "source": {
                "block": "04ab5db4-493b-4ecc-a743-534ec5a17ce6",
                "port": "out"
              },
              "target": {
                "block": "12c8688c-4aca-440a-8f1d-39a524ccd960",
                "port": "9a1a51a2-fa03-413f-8d49-5b9f7ab59e2e"
              },
              "vertices": [
                {
                  "x": 712,
                  "y": 880
                }
              ]
            },
            {
              "source": {
                "block": "12c8688c-4aca-440a-8f1d-39a524ccd960",
                "port": "8cf34f50-cd18-4b79-b85e-acbb3bfc9078"
              },
              "target": {
                "block": "6a191ea9-892f-4c41-bd1d-ce710d24ea47",
                "port": "17e637ef-d097-4a89-9612-670103f94aa3"
              },
              "vertices": []
            },
            {
              "source": {
                "block": "12c8688c-4aca-440a-8f1d-39a524ccd960",
                "port": "0ab4bde9-8c23-4f45-8e04-653d9400b648"
              },
              "target": {
                "block": "31990c40-3215-480c-a1f5-e77be6861b41",
                "port": "821416e3-f3d9-4ed9-8ad7-9f923ca5158a"
              },
              "vertices": [
                {
                  "x": 1048,
                  "y": 448
                },
                {
                  "x": 1240,
                  "y": 384
                }
              ]
            },
            {
              "source": {
                "block": "0d06c239-ce5a-442f-8287-23f5c43cd1a0",
                "port": "out"
              },
              "target": {
                "block": "12c8688c-4aca-440a-8f1d-39a524ccd960",
                "port": "3dd214ec-0e77-4f70-9c95-7061ee49399f"
              },
              "vertices": [
                {
                  "x": 648,
                  "y": 712
                }
              ]
            },
            {
              "source": {
                "block": "395f69bf-12c6-469c-908e-cfc077391919",
                "port": "c9c248e9-c9d1-45c9-b678-09aa7d4d5a5f"
              },
              "target": {
                "block": "12c8688c-4aca-440a-8f1d-39a524ccd960",
                "port": "528cacb6-c1be-45d7-adcf-916e31acc1d4"
              },
              "vertices": [
                {
                  "x": 664,
                  "y": 384
                }
              ],
              "size": 6
            },
            {
              "source": {
                "block": "395f69bf-12c6-469c-908e-cfc077391919",
                "port": "1b124991-cac3-4201-974f-691e1cc59c16"
              },
              "target": {
                "block": "ad9ef40d-c49b-42a8-a7fa-5e7eea2266c2",
                "port": "66cf6051-c4f5-490a-9570-8d4da9276ef3"
              },
              "vertices": [
                {
                  "x": 408,
                  "y": 120
                }
              ]
            },
            {
              "source": {
                "block": "395f69bf-12c6-469c-908e-cfc077391919",
                "port": "1b124991-cac3-4201-974f-691e1cc59c16"
              },
              "target": {
                "block": "12c8688c-4aca-440a-8f1d-39a524ccd960",
                "port": "0b4a4a02-3ff6-44c3-b26e-703f1667aae9"
              },
              "vertices": [
                {
                  "x": 408,
                  "y": 456
                }
              ]
            },
            {
              "source": {
                "block": "6a191ea9-892f-4c41-bd1d-ce710d24ea47",
                "port": "43b6acdf-97bc-41a1-93d0-21bc0f4c487c"
              },
              "target": {
                "block": "ad9ef40d-c49b-42a8-a7fa-5e7eea2266c2",
                "port": "d91193b7-11e3-48ac-b2f5-08dd974d73e2"
              },
              "vertices": [
                {
                  "x": 1920,
                  "y": -160
                },
                {
                  "x": 368,
                  "y": -136
                }
              ],
              "size": 26
            },
            {
              "source": {
                "block": "31990c40-3215-480c-a1f5-e77be6861b41",
                "port": "fafd4392-05f5-4020-8989-c06d7e1bdcb3"
              },
              "target": {
                "block": "12c8688c-4aca-440a-8f1d-39a524ccd960",
                "port": "7d325103-3431-4882-90f4-8d4afc400876"
              },
              "vertices": [
                {
                  "x": 616,
                  "y": 1056
                }
              ]
            },
            {
              "source": {
                "block": "6a191ea9-892f-4c41-bd1d-ce710d24ea47",
                "port": "43b6acdf-97bc-41a1-93d0-21bc0f4c487c"
              },
              "target": {
                "block": "a6178528-cf3a-4491-ab88-b77746082b7d",
                "port": "in"
              },
              "vertices": [
                {
                  "x": 1920,
                  "y": 376
                },
                {
                  "x": 1920,
                  "y": 376
                }
              ],
              "size": 26
            },
            {
              "source": {
                "block": "6a191ea9-892f-4c41-bd1d-ce710d24ea47",
                "port": "43b6acdf-97bc-41a1-93d0-21bc0f4c487c"
              },
              "target": {
                "block": "0560a46c-d0ab-428a-bf30-0167bed59c70",
                "port": "49cdeb8d-fdde-46cb-8b43-67fc607de353"
              },
              "vertices": [
                {
                  "x": 1920,
                  "y": 728
                },
                {
                  "x": 1672,
                  "y": 8
                }
              ],
              "size": 26
            },
            {
              "source": {
                "block": "395f69bf-12c6-469c-908e-cfc077391919",
                "port": "a2dfbeb0-95a5-406a-ac66-cfa499d71c1d"
              },
              "target": {
                "block": "84143171-b5b0-438e-a4a0-fe844c0fbc38",
                "port": "da29e25a-f215-4ae3-a9a6-7ef8aa9b30bb"
              }
            },
            {
              "source": {
                "block": "395f69bf-12c6-469c-908e-cfc077391919",
                "port": "dfa86c66-e8f8-4c43-b5b9-fa54c88e5589"
              },
              "target": {
                "block": "95cc4275-7076-432b-85e0-a4f6402318ea",
                "port": "081e5dbe-2409-4488-9430-fc8ae8d66ee3"
              }
            },
            {
              "source": {
                "block": "395f69bf-12c6-469c-908e-cfc077391919",
                "port": "4c08410d-f8e7-4a6c-879f-35ba08185c5e"
              },
              "target": {
                "block": "95cc4275-7076-432b-85e0-a4f6402318ea",
                "port": "d7d5b5c0-0edd-452c-a3cb-dd61710939c1"
              },
              "size": 32
            }
          ]
        }
      }
    },
    "07c3e9937e380a4a69b76ed9acb607d974440968": {
      "package": {
        "name": "Instruktionsdekodierer",
        "version": "0.1",
        "description": "",
        "author": "Moritz, Yannik, Timo",
        "image": ""
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "c614052d-8b0e-49f3-97db-f1dc82997efe",
              "type": "basic.output",
              "data": {
                "name": "QuellReg1",
                "range": "[5:0]",
                "size": 6
              },
              "position": {
                "x": 720,
                "y": 72
              }
            },
            {
              "id": "044b0036-8e8b-47c8-a1a9-6c62209dc87b",
              "type": "basic.output",
              "data": {
                "name": "QuellReg2",
                "range": "[5:0]",
                "size": 6
              },
              "position": {
                "x": 704,
                "y": 176
              }
            },
            {
              "id": "83123e85-a9ee-4fa5-bcbc-2c841ab7e832",
              "type": "basic.input",
              "data": {
                "name": "Instruktion",
                "range": "[31:0]",
                "clock": false,
                "size": 32
              },
              "position": {
                "x": -1000,
                "y": 264
              }
            },
            {
              "id": "317354c3-5b79-4f8e-a5ca-64033ae5e585",
              "type": "basic.output",
              "data": {
                "name": "ZielReg1",
                "range": "[5:0]",
                "size": 6
              },
              "position": {
                "x": 720,
                "y": 280
              }
            },
            {
              "id": "4c08410d-f8e7-4a6c-879f-35ba08185c5e",
              "type": "basic.output",
              "data": {
                "name": "IDaten",
                "virtual": true,
                "range": "[31:0]",
                "pins": [
                  {
                    "index": "31",
                    "name": "NULL",
                    "value": "NULL"
                  },
                  {
                    "index": "30",
                    "name": "NULL",
                    "value": "NULL"
                  },
                  {
                    "index": "29",
                    "name": "NULL",
                    "value": "NULL"
                  },
                  {
                    "index": "28",
                    "name": "NULL",
                    "value": "NULL"
                  },
                  {
                    "index": "27",
                    "name": "NULL",
                    "value": "NULL"
                  },
                  {
                    "index": "26",
                    "name": "NULL",
                    "value": "NULL"
                  },
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
                ]
              },
              "position": {
                "x": 704,
                "y": 384
              }
            },
            {
              "id": "dfa86c66-e8f8-4c43-b5b9-fa54c88e5589",
              "type": "basic.output",
              "data": {
                "name": "ImmediateAktiv",
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
                "x": 720,
                "y": 488
              }
            },
            {
              "id": "c9c248e9-c9d1-45c9-b678-09aa7d4d5a5f",
              "type": "basic.output",
              "data": {
                "name": "FunktionsCode",
                "virtual": true,
                "range": "[5:0]",
                "pins": [
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
                ]
              },
              "position": {
                "x": 712,
                "y": 592
              }
            },
            {
              "id": "a7924039-31ca-45c6-8a7b-a4434c8bd6d1",
              "type": "basic.output",
              "data": {
                "name": "JALBefehl",
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
                "x": 720,
                "y": 696
              }
            },
            {
              "id": "a25f91cb-5ceb-473c-a646-15ee0036da29",
              "type": "basic.input",
              "data": {
                "name": "DekodierSignal",
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
                "x": -1032,
                "y": 752
              }
            },
            {
              "id": "c39adb98-1725-4957-b5ab-b04dac737ffb",
              "type": "basic.output",
              "data": {
                "name": "RelativerSprung",
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
                "x": 720,
                "y": 800
              }
            },
            {
              "id": "1b124991-cac3-4201-974f-691e1cc59c16",
              "type": "basic.output",
              "data": {
                "name": "LoadBefehl"
              },
              "position": {
                "x": 728,
                "y": 904
              }
            },
            {
              "id": "e2915c0c-a75c-49dc-8624-776b13331de7",
              "type": "basic.output",
              "data": {
                "name": "StoreBefehl"
              },
              "position": {
                "x": 728,
                "y": 1008
              }
            },
            {
              "id": "1d97c60c-7bc2-4439-b9c5-35fcecda8278",
              "type": "basic.output",
              "data": {
                "name": "UnbedingterSprungBefehl"
              },
              "position": {
                "x": 752,
                "y": 1112
              }
            },
            {
              "id": "a8512379-fdf6-4ba5-a4c4-573450c25069",
              "type": "basic.output",
              "data": {
                "name": "BedingterSprung"
              },
              "position": {
                "x": 744,
                "y": 1216
              }
            },
            {
              "id": "8893ddf5-a3ac-43ba-87b5-0d01dbdcd8cd",
              "type": "basic.input",
              "data": {
                "name": "Reset",
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
                "x": -1192,
                "y": 1232
              }
            },
            {
              "id": "51d1842d-e9d7-426f-b46f-45adefc55b91",
              "type": "basic.output",
              "data": {
                "name": "AbsoluterSprung",
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
                "x": 752,
                "y": 1320
              }
            },
            {
              "id": "a2dfbeb0-95a5-406a-ac66-cfa499d71c1d",
              "type": "basic.output",
              "data": {
                "name": "Sprungbedingung",
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
                "x": 744,
                "y": 1424
              }
            },
            {
              "id": "85dde437-ef30-4e91-a8d9-80ec330ab957",
              "type": "basic.code",
              "data": {
                "ports": {
                  "in": [
                    {
                      "name": "Instruktion",
                      "range": "[31:0]",
                      "size": 32
                    },
                    {
                      "name": "DekodierSignal"
                    },
                    {
                      "name": "Reset"
                    }
                  ],
                  "out": [
                    {
                      "name": "QuellRegister1",
                      "range": "[5:0]",
                      "size": 6
                    },
                    {
                      "name": "QuellRegister2",
                      "range": "[5:0]",
                      "size": 6
                    },
                    {
                      "name": "ZielRegister",
                      "range": "[5:0]",
                      "size": 6
                    },
                    {
                      "name": "IDaten",
                      "range": "[31:0]",
                      "size": 32
                    },
                    {
                      "name": "ImmediateAktiv"
                    },
                    {
                      "name": "FunktionsCode",
                      "range": "[5:0]",
                      "size": 6
                    },
                    {
                      "name": "JALBefehl"
                    },
                    {
                      "name": "RelativerSprung"
                    },
                    {
                      "name": "LoadBefehl"
                    },
                    {
                      "name": "StoreBefehl"
                    },
                    {
                      "name": "UnbedingterSprungBefehl"
                    },
                    {
                      "name": "BedingterSprungBefehl"
                    },
                    {
                      "name": "AbsoluterSprung"
                    },
                    {
                      "name": "Sprungbedingung"
                    }
                  ]
                },
                "params": [],
                "code": "\n//Aktuell gespeicherte Befehl\nreg [31:0] AktuellerBefehl;\n\n//Wires für Lesbaren Code\nwire[5:0] Opcode;\nwire[1:0] Format;\nwire[1:0] Kategorie;\nwire[4:0] ZRegister;\nwire[4:0] Q1Register;\nwire[4:0] Q2Register;\nwire[5:0] Funktion;\nwire[5:0] FunktionAnfang;\nwire[15:0] KleinerImmediate;\nwire[25:0] GrosserImmediate;\nwire[3:0] GleitkommaBefehl;\n\nassign Opcode = AktuellerBefehl[31:26];\nassign Format = AktuellerBefehl[31:30];\nassign Kategorie = AktuellerBefehl[5:4];\nassign ZRegister = AktuellerBefehl[25:21];\nassign Q1Register = AktuellerBefehl[20:16];\nassign Q2Register = AktuellerBefehl[15:11];\nassign Funktion = AktuellerBefehl[5:0];\nassign FunktionAnfang = AktuellerBefehl[30:26];\nassign KleinerImmediate = AktuellerBefehl[15:0];\nassign GrosserImmediate = AktuellerBefehl[25:0];\nassign GleitkommaBefehl = AktuellerBefehl[3:0];\n\n//wichtige Befehle die einzeln behandelt werden muessen\nlocalparam[5:0] LoadCode   = 6'b111000;\nlocalparam[5:0] LoadSCode  = 6'b111001;\nlocalparam[5:0] StoreCode  = 6'b111010;\nlocalparam[5:0] StoreSCode = 6'b111011;\nlocalparam[5:0] JregCode   = 6'b111100;\nlocalparam[5:0] BezCode    = 6'b111101;\nlocalparam[5:0] BNezCode   = 6'b111110;\nlocalparam[5:0] JALCode    = 6'b111111;\nlocalparam[5:0] JmpCode    = 6'b010000;\nlocalparam[5:0] AddisCode  = 6'b110000;\n\n//wichtige Formate die behandelt werden muessen\nlocalparam[1:0] RegisterFormat = 2'b00;\nlocalparam[1:0] JumpFormat = 2'b01;\nlocalparam ImmediateFormat = 1'b1;\nlocalparam FloatVergleich = 1'b1;\nlocalparam[1:0] Arithmetik = 2'b00;\nlocalparam[1:0] Vergleich = 2'b01;\nlocalparam[1:0] Gleitkomma = 2'b10;\nlocalparam[1:0] Vektor = 2'b11;\n\n//START LOGIK\n\nalways @(posedge Reset or posedge DekodierSignal) begin\n    if(Reset)\n        AktuellerBefehl <= 32'b00000000000000000000000000000000;\n    else begin\n        AktuellerBefehl <= Instruktion;\n    end\nend\n\nassign QuellRegister1 =         {((Format == RegisterFormat && Kategorie == Gleitkomma) ? 1'b1 : 1'b0), Q1Register};\n\nassign QuellRegister2 =         (Opcode == StoreCode) ? {1'b0, ZRegister}:\n                                (Opcode == StoreSCode) ? {1'b1, ZRegister}:\n                                {((Format == RegisterFormat && Kategorie == Gleitkomma) ? 1'b1 : 1'b0), Q2Register};\n\nassign ZielRegister =           (Opcode==LoadSCode || Opcode == StoreSCode || ((Format == RegisterFormat && Kategorie == Gleitkomma && GleitkommaBefehl < 8)) ? {1'b1, ZRegister}:\n                                (((Format == RegisterFormat) || (Format[1] == ImmediateFormat)) ? {1'b0, ZRegister}:\n                                6'b0));\n\nassign IDaten =                 (Format == JumpFormat) ? {6'b0, GrosserImmediate} :\n                                (Opcode == AddisCode) ? {KleinerImmediate, 16'b0} : \n                                (Format[1] == ImmediateFormat && Opcode > AddisCode && Opcode < LoadCode) ? {16'b0, KleinerImmediate} :\n                                (Format[1] == ImmediateFormat) ? {{16{KleinerImmediate[15]}}, KleinerImmediate} :\n                                32'b0;\n\nassign ImmediateAktiv =         (Format == JumpFormat || Format[1] == ImmediateFormat);\n                            \nassign FunktionsCode =          (Format == RegisterFormat) ? Funktion :\n                                ((Opcode == AddisCode || Format == JumpFormat||(Opcode >= LoadCode && Opcode <= JALCode)) ? 6'b0:\n                                {1'b0,FunktionAnfang});\n\nassign JALBefehl =              (Opcode == JALCode);\n\nassign RelativerSprung =        (Opcode == JALCode || Opcode == JmpCode || Opcode == BezCode || Opcode == BNezCode);\n\nassign AbsoluterSprung =        (Opcode == JregCode);                               \n\nassign LoadBefehl =             (Opcode == LoadCode || Opcode == LoadSCode);\n\nassign StoreBefehl =            (Opcode == StoreCode || Opcode == StoreSCode);\n\nassign UnbedingterSprungBefehl =(Opcode == JregCode || Opcode == JALCode || Opcode == JmpCode);\n\nassign BedingterSprungBefehl =  (Opcode == BezCode || Opcode == BNezCode); \n\nassign Sprungbedingung =           (Opcode == BezCode);"
              },
              "position": {
                "x": -672,
                "y": 56
              },
              "size": {
                "width": 1200,
                "height": 1448
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "83123e85-a9ee-4fa5-bcbc-2c841ab7e832",
                "port": "out"
              },
              "target": {
                "block": "85dde437-ef30-4e91-a8d9-80ec330ab957",
                "port": "Instruktion"
              },
              "size": 32
            },
            {
              "source": {
                "block": "a25f91cb-5ceb-473c-a646-15ee0036da29",
                "port": "out"
              },
              "target": {
                "block": "85dde437-ef30-4e91-a8d9-80ec330ab957",
                "port": "DekodierSignal"
              }
            },
            {
              "source": {
                "block": "8893ddf5-a3ac-43ba-87b5-0d01dbdcd8cd",
                "port": "out"
              },
              "target": {
                "block": "85dde437-ef30-4e91-a8d9-80ec330ab957",
                "port": "Reset"
              }
            },
            {
              "source": {
                "block": "85dde437-ef30-4e91-a8d9-80ec330ab957",
                "port": "FunktionsCode"
              },
              "target": {
                "block": "c9c248e9-c9d1-45c9-b678-09aa7d4d5a5f",
                "port": "in"
              },
              "size": 6
            },
            {
              "source": {
                "block": "85dde437-ef30-4e91-a8d9-80ec330ab957",
                "port": "ImmediateAktiv"
              },
              "target": {
                "block": "dfa86c66-e8f8-4c43-b5b9-fa54c88e5589",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "85dde437-ef30-4e91-a8d9-80ec330ab957",
                "port": "JALBefehl"
              },
              "target": {
                "block": "a7924039-31ca-45c6-8a7b-a4434c8bd6d1",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "85dde437-ef30-4e91-a8d9-80ec330ab957",
                "port": "LoadBefehl"
              },
              "target": {
                "block": "1b124991-cac3-4201-974f-691e1cc59c16",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "85dde437-ef30-4e91-a8d9-80ec330ab957",
                "port": "Sprungbedingung"
              },
              "target": {
                "block": "a2dfbeb0-95a5-406a-ac66-cfa499d71c1d",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "85dde437-ef30-4e91-a8d9-80ec330ab957",
                "port": "AbsoluterSprung"
              },
              "target": {
                "block": "51d1842d-e9d7-426f-b46f-45adefc55b91",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "85dde437-ef30-4e91-a8d9-80ec330ab957",
                "port": "BedingterSprungBefehl"
              },
              "target": {
                "block": "a8512379-fdf6-4ba5-a4c4-573450c25069",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "85dde437-ef30-4e91-a8d9-80ec330ab957",
                "port": "UnbedingterSprungBefehl"
              },
              "target": {
                "block": "1d97c60c-7bc2-4439-b9c5-35fcecda8278",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "85dde437-ef30-4e91-a8d9-80ec330ab957",
                "port": "StoreBefehl"
              },
              "target": {
                "block": "e2915c0c-a75c-49dc-8624-776b13331de7",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "85dde437-ef30-4e91-a8d9-80ec330ab957",
                "port": "RelativerSprung"
              },
              "target": {
                "block": "c39adb98-1725-4957-b5ab-b04dac737ffb",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "85dde437-ef30-4e91-a8d9-80ec330ab957",
                "port": "IDaten"
              },
              "target": {
                "block": "4c08410d-f8e7-4a6c-879f-35ba08185c5e",
                "port": "in"
              },
              "size": 32
            },
            {
              "source": {
                "block": "85dde437-ef30-4e91-a8d9-80ec330ab957",
                "port": "ZielRegister"
              },
              "target": {
                "block": "317354c3-5b79-4f8e-a5ca-64033ae5e585",
                "port": "in"
              },
              "size": 6
            },
            {
              "source": {
                "block": "85dde437-ef30-4e91-a8d9-80ec330ab957",
                "port": "QuellRegister2"
              },
              "target": {
                "block": "044b0036-8e8b-47c8-a1a9-6c62209dc87b",
                "port": "in"
              },
              "size": 6
            },
            {
              "source": {
                "block": "85dde437-ef30-4e91-a8d9-80ec330ab957",
                "port": "QuellRegister1"
              },
              "target": {
                "block": "c614052d-8b0e-49f3-97db-f1dc82997efe",
                "port": "in"
              },
              "size": 6
            }
          ]
        }
      }
    },
    "0980595208e1182fd423fea62d5bf8166a29b47c": {
      "package": {
        "name": "Programmzähler",
        "version": "",
        "description": "",
        "author": "",
        "image": ""
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "43b6acdf-97bc-41a1-93d0-21bc0f4c487c",
              "type": "basic.output",
              "data": {
                "name": "AktuellerPC ",
                "range": "[25:0]",
                "size": 26
              },
              "position": {
                "x": 1408,
                "y": 272
              }
            },
            {
              "id": "1ff29fca-25ea-4fc8-a224-f4fe10a518bd",
              "type": "basic.input",
              "data": {
                "name": "NeuerPC ",
                "range": "[25:0]",
                "clock": false,
                "size": 26
              },
              "position": {
                "x": 616,
                "y": 440
              }
            },
            {
              "id": "ef8e04d2-5d14-4cdb-8c52-beef5541c4c4",
              "type": "basic.input",
              "data": {
                "name": "SchreibSignal",
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
                "x": 616,
                "y": 528
              }
            },
            {
              "id": "17e637ef-d097-4a89-9612-670103f94aa3",
              "type": "basic.input",
              "data": {
                "name": "TaktSignal",
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
                "x": 616,
                "y": 592
              }
            },
            {
              "id": "e3a5e03f-9d03-4db2-94fb-e74ec080c510",
              "type": "basic.input",
              "data": {
                "name": "reset",
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
                "x": 616,
                "y": 664
              }
            }
          ],
          "wires": []
        }
      }
    },
    "d073daebe985cc6e840580d5c126e4b9b741fafd": {
      "package": {
        "name": "Steuerung",
        "version": "",
        "description": "",
        "author": "",
        "image": ""
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "528cacb6-c1be-45d7-adcf-916e31acc1d4",
              "type": "basic.input",
              "data": {
                "name": "Funktionscode",
                "virtual": true,
                "range": "[5:0]",
                "pins": [
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
                "x": 696,
                "y": -16
              }
            },
            {
              "id": "1db36b48-c321-4849-bde1-e28f61fec522",
              "type": "basic.output",
              "data": {
                "name": "RegisterSchreibSignal",
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
                "x": 1008,
                "y": 112
              }
            },
            {
              "id": "0ab4bde9-8c23-4f45-8e04-653d9400b648",
              "type": "basic.output",
              "data": {
                "name": "ALUStartSignal",
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
                "x": 1008,
                "y": 176
              }
            },
            {
              "id": "0b4a4a02-3ff6-44c3-b26e-703f1667aae9",
              "type": "basic.input",
              "data": {
                "name": "LoadBefehl",
                "clock": false
              },
              "position": {
                "x": 688,
                "y": 208
              }
            },
            {
              "id": "03069b59-0bc1-4662-96b6-a9dfc7c22b0f",
              "type": "basic.input",
              "data": {
                "name": "StoreBefehl",
                "clock": false
              },
              "position": {
                "x": 696,
                "y": 280
              }
            },
            {
              "id": "9da12b58-a282-43a7-ac77-bc3d2490d94b",
              "type": "basic.output",
              "data": {
                "name": "LoadBefehlSignal"
              },
              "position": {
                "x": 1008,
                "y": 288
              }
            },
            {
              "id": "80701733-2c21-4dd6-96ff-ede745745459",
              "type": "basic.input",
              "data": {
                "name": "JALBefehl",
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
                "x": 696,
                "y": 344
              }
            },
            {
              "id": "6427d2c6-40cd-4423-8195-684d285df381",
              "type": "basic.output",
              "data": {
                "name": "LoadDatenSignal"
              },
              "position": {
                "x": 1008,
                "y": 344
              }
            },
            {
              "id": "1f7015d3-8902-465c-881e-593942403cdf",
              "type": "basic.input",
              "data": {
                "name": "UnbedingterSprungBefehl",
                "clock": false
              },
              "position": {
                "x": 688,
                "y": 400
              }
            },
            {
              "id": "c1276045-a74b-455d-908a-edc85242ba90",
              "type": "basic.output",
              "data": {
                "name": "StoreDatenSignal"
              },
              "position": {
                "x": 1016,
                "y": 448
              }
            },
            {
              "id": "8967c841-23d3-4222-8105-c75fc5a893c8",
              "type": "basic.input",
              "data": {
                "name": "BedingterSprungBefehl",
                "clock": false
              },
              "position": {
                "x": 688,
                "y": 456
              }
            },
            {
              "id": "3773f6b8-a9b2-407e-a459-f27a07b3d59f",
              "type": "basic.input",
              "data": {
                "name": "Bedingung",
                "clock": false
              },
              "position": {
                "x": 688,
                "y": 512
              }
            },
            {
              "id": "5235af3b-edc5-46bf-8f5f-30990f32da81",
              "type": "basic.output",
              "data": {
                "name": "PCSprungSignal",
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
                "x": 1016,
                "y": 520
              }
            },
            {
              "id": "7d325103-3431-4882-90f4-8d4afc400876",
              "type": "basic.input",
              "data": {
                "name": "ALUFertig",
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
                "x": 688,
                "y": 552
              }
            },
            {
              "id": "8cf34f50-cd18-4b79-b85e-acbb3bfc9078",
              "type": "basic.output",
              "data": {
                "name": "PCSignal",
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
                "x": 1016,
                "y": 584
              }
            },
            {
              "id": "3dd214ec-0e77-4f70-9c95-7061ee49399f",
              "type": "basic.input",
              "data": {
                "name": "BefehlGeladen",
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
                "x": 688,
                "y": 592
              }
            },
            {
              "id": "8a617e6e-3f08-4591-9c64-7dccb0cdfca0",
              "type": "basic.output",
              "data": {
                "name": "DekodierSignal",
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
                "x": 1016,
                "y": 648
              }
            },
            {
              "id": "9ceb3b45-bdb4-4b49-97b8-2219d8485575",
              "type": "basic.input",
              "data": {
                "name": "DatenGeladen",
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
                "x": 688,
                "y": 648
              }
            },
            {
              "id": "9a1a51a2-fa03-413f-8d49-5b9f7ab59e2e",
              "type": "basic.input",
              "data": {
                "name": "DatenGespeichert",
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
                "x": 688,
                "y": 712
              }
            },
            {
              "id": "151db1f8-9820-4afd-955f-90dbb16de40b",
              "type": "basic.input",
              "data": {
                "name": "clock",
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
                "x": 688,
                "y": 768
              }
            },
            {
              "id": "b39cb169-c796-417c-9c48-7900b82b7065",
              "type": "basic.input",
              "data": {
                "name": "reset",
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
                "x": 688,
                "y": 824
              }
            }
          ],
          "wires": []
        }
      }
    },
    "51b9cf88c750a154b49353272857414fafc78c5e": {
      "package": {
        "name": "Register",
        "version": "",
        "description": "",
        "author": "",
        "image": ""
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "a1b808fc-82af-4985-ad41-55f4d95b7a66",
              "type": "basic.input",
              "data": {
                "name": "QuellReg1",
                "range": "[5:0]",
                "clock": false,
                "size": 6
              },
              "position": {
                "x": 456,
                "y": 224
              }
            },
            {
              "id": "892206be-caea-4813-b605-445dcd779427",
              "type": "basic.input",
              "data": {
                "name": "QuellReg2",
                "range": "[5:0]",
                "clock": false,
                "size": 6
              },
              "position": {
                "x": 448,
                "y": 288
              }
            },
            {
              "id": "b8f0d093-53fa-4444-9246-8351c4234bbf",
              "type": "basic.output",
              "data": {
                "name": "QuellDaten1",
                "range": "[31:0]",
                "size": 32
              },
              "position": {
                "x": 1528,
                "y": 304
              }
            },
            {
              "id": "d3449a5c-f0dc-4952-9612-04e5eb031b42",
              "type": "basic.input",
              "data": {
                "name": "ZielDaten",
                "range": "[31:0]",
                "clock": false,
                "size": 32
              },
              "position": {
                "x": 440,
                "y": 352
              }
            },
            {
              "id": "37f93bb3-455b-44e4-bd70-a8a59802a415",
              "type": "basic.input",
              "data": {
                "name": "ZielReg",
                "range": "[5:0]",
                "clock": false,
                "size": 6
              },
              "position": {
                "x": 440,
                "y": 424
              }
            },
            {
              "id": "a81bee85-0811-40bf-82a9-dbd224184b4c",
              "type": "basic.input",
              "data": {
                "name": "SchreibSignal",
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
                "x": 448,
                "y": 488
              }
            },
            {
              "id": "8bfa2dd1-de46-4329-99d9-ac064d57ce94",
              "type": "basic.output",
              "data": {
                "name": "QuellDaten2",
                "range": "[31:0]",
                "size": 32
              },
              "position": {
                "x": 1536,
                "y": 536
              }
            },
            {
              "id": "7f3a3db0-b1ee-4f1d-8463-ff80051a3d7d",
              "type": "basic.input",
              "data": {
                "name": "reset",
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
                "x": 440,
                "y": 552
              }
            },
            {
              "id": "439ae457-6bcb-4622-94d9-81bc05834d33",
              "type": "basic.input",
              "data": {
                "name": "clock",
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
                "x": 440,
                "y": 616
              }
            },
            {
              "id": "88c33056-b79a-46ac-8c31-d6790886eed6",
              "type": "basic.code",
              "data": {
                "ports": {
                  "in": [
                    {
                      "name": "QuellRegister1",
                      "range": "[5:0]",
                      "size": 6
                    },
                    {
                      "name": "QuellRegister2",
                      "range": "[5:0]",
                      "size": 6
                    },
                    {
                      "name": "ZielDaten",
                      "range": "[31:0]",
                      "size": 32
                    },
                    {
                      "name": "ZielRegister",
                      "range": "[5:0]",
                      "size": 6
                    },
                    {
                      "name": "Schreibsignal"
                    },
                    {
                      "name": "Reset"
                    },
                    {
                      "name": "Clock"
                    }
                  ],
                  "out": [
                    {
                      "name": "QuellDaten1",
                      "range": "[31:0]",
                      "size": 32
                    },
                    {
                      "name": "QuellDaten2",
                      "range": "[31:0]",
                      "size": 32
                    }
                  ]
                },
                "params": [],
                "code": "reg [31:0] registers [63:0];\n\nassign QuellDaten1 = registers[QuellRegister1];\nassign QuellDaten2 = registers[QuellRegister2];\ninteger i;\n\nalways @(posedge Clock) begin\n    if(Reset) begin\n        for (i = 0; i < 64; i = i + 1) begin\n            registers[i] <= 32'b00000000000000000000000000000000; \n        end\n    end\n    else if(Schreibsignal) begin \n        if(ZielRegister != 0)\n            registers[ZielRegister] <= ZielDaten;\n    end\nend"
              },
              "position": {
                "x": 736,
                "y": 224
              },
              "size": {
                "width": 648,
                "height": 456
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "88c33056-b79a-46ac-8c31-d6790886eed6",
                "port": "QuellDaten2"
              },
              "target": {
                "block": "8bfa2dd1-de46-4329-99d9-ac064d57ce94",
                "port": "in"
              },
              "size": 32
            },
            {
              "source": {
                "block": "88c33056-b79a-46ac-8c31-d6790886eed6",
                "port": "QuellDaten1"
              },
              "target": {
                "block": "b8f0d093-53fa-4444-9246-8351c4234bbf",
                "port": "in"
              },
              "size": 32
            },
            {
              "source": {
                "block": "a1b808fc-82af-4985-ad41-55f4d95b7a66",
                "port": "out"
              },
              "target": {
                "block": "88c33056-b79a-46ac-8c31-d6790886eed6",
                "port": "QuellRegister1"
              },
              "size": 6
            },
            {
              "source": {
                "block": "892206be-caea-4813-b605-445dcd779427",
                "port": "out"
              },
              "target": {
                "block": "88c33056-b79a-46ac-8c31-d6790886eed6",
                "port": "QuellRegister2"
              },
              "size": 6
            },
            {
              "source": {
                "block": "d3449a5c-f0dc-4952-9612-04e5eb031b42",
                "port": "out"
              },
              "target": {
                "block": "88c33056-b79a-46ac-8c31-d6790886eed6",
                "port": "ZielDaten"
              },
              "size": 32
            },
            {
              "source": {
                "block": "37f93bb3-455b-44e4-bd70-a8a59802a415",
                "port": "out"
              },
              "target": {
                "block": "88c33056-b79a-46ac-8c31-d6790886eed6",
                "port": "ZielRegister"
              },
              "size": 6
            },
            {
              "source": {
                "block": "a81bee85-0811-40bf-82a9-dbd224184b4c",
                "port": "out"
              },
              "target": {
                "block": "88c33056-b79a-46ac-8c31-d6790886eed6",
                "port": "Schreibsignal"
              }
            },
            {
              "source": {
                "block": "7f3a3db0-b1ee-4f1d-8463-ff80051a3d7d",
                "port": "out"
              },
              "target": {
                "block": "88c33056-b79a-46ac-8c31-d6790886eed6",
                "port": "Reset"
              }
            },
            {
              "source": {
                "block": "439ae457-6bcb-4622-94d9-81bc05834d33",
                "port": "out"
              },
              "target": {
                "block": "88c33056-b79a-46ac-8c31-d6790886eed6",
                "port": "Clock"
              }
            }
          ]
        }
      }
    },
    "625d79635c0735eb022174bd3b756bc09c6d1186": {
      "package": {
        "name": "ALU",
        "version": "",
        "description": "",
        "author": "",
        "image": ""
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "a44f2dd4-1ea9-4743-b632-e6da11a4ab30",
              "type": "basic.input",
              "data": {
                "name": "Daten1",
                "virtual": true,
                "range": "[31:0]",
                "pins": [
                  {
                    "index": "31",
                    "name": "NULL",
                    "value": "NULL"
                  },
                  {
                    "index": "30",
                    "name": "NULL",
                    "value": "NULL"
                  },
                  {
                    "index": "29",
                    "name": "NULL",
                    "value": "NULL"
                  },
                  {
                    "index": "28",
                    "name": "NULL",
                    "value": "NULL"
                  },
                  {
                    "index": "27",
                    "name": "NULL",
                    "value": "NULL"
                  },
                  {
                    "index": "26",
                    "name": "NULL",
                    "value": "NULL"
                  },
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
                "x": 552,
                "y": -736
              }
            },
            {
              "id": "7a0ad72d-1e1f-4a7d-a98f-8af8dedb49e3",
              "type": "basic.input",
              "data": {
                "name": "Daten2",
                "range": "[31:0]",
                "clock": false,
                "size": 32
              },
              "position": {
                "x": 584,
                "y": -200
              }
            },
            {
              "id": "fafd4392-05f5-4020-8989-c06d7e1bdcb3",
              "type": "basic.output",
              "data": {
                "name": "HatFertigGerechnet",
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
                "x": 2856,
                "y": -200
              }
            },
            {
              "id": "cd22b151-94d3-4fb2-8e7f-cbccdf809bf4",
              "type": "basic.input",
              "data": {
                "name": "Funktionscode",
                "virtual": true,
                "range": "[5:0]",
                "pins": [
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
                "x": 536,
                "y": 336
              }
            },
            {
              "id": "821416e3-f3d9-4ed9-8ad7-9f923ca5158a",
              "type": "basic.input",
              "data": {
                "name": "StartSignal",
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
                "x": 608,
                "y": 880
              }
            },
            {
              "id": "0450dc41-6526-407d-bce5-a63817a776ed",
              "type": "basic.output",
              "data": {
                "name": "Ergebnis",
                "range": "[31:0]",
                "size": 32
              },
              "position": {
                "x": 2848,
                "y": 1416
              }
            },
            {
              "id": "cacc8401-cf85-4130-8ab4-f199bdec6f35",
              "type": "basic.input",
              "data": {
                "name": "Reset",
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
                "x": 640,
                "y": 1416
              }
            },
            {
              "id": "71842a6b-f88f-4e17-ad89-bcb5bbd0d523",
              "type": "basic.input",
              "data": {
                "name": "Clock",
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
                "x": 664,
                "y": 1920
              }
            },
            {
              "id": "8dcfc08d-f1e6-4590-8448-c8bd942f1822",
              "type": "basic.code",
              "data": {
                "ports": {
                  "in": [
                    {
                      "name": "Daten1",
                      "range": "[31:0]",
                      "size": 32
                    },
                    {
                      "name": "Daten2",
                      "range": "[31:0]",
                      "size": 32
                    },
                    {
                      "name": "FunktionsCode",
                      "range": "[5:0]",
                      "size": 6
                    },
                    {
                      "name": "StartSignal"
                    },
                    {
                      "name": "Reset"
                    },
                    {
                      "name": "Clock"
                    }
                  ],
                  "out": [
                    {
                      "name": "HatFertigGerechnet"
                    },
                    {
                      "name": "Ergebnis",
                      "range": "[31:0]",
                      "size": 32
                    }
                  ]
                },
                "params": [],
                "code": "`include \"../Prozessor/ALUModule/Intsqrt.v\"\n`include \"../Prozessor/ALUModule/verilog-math-master_FLOAT_/components/add.v\"\n`include \"../Prozessor/ALUModule/verilog-math-master_FLOAT_/components/mul.v\"\n`include \"../Prozessor/ALUModule/verilog-math-master_FLOAT_/components/sqrt.v\"\n`include \"../Prozessor/ALUModule/verilog-math-master_FLOAT_/components/div.v\"\n`include \"../Prozessor/ALUModule/verilog-math-master_FLOAT_/components/eq.v\"\n`include \"../Prozessor/ALUModule/verilog-math-master_FLOAT_/components/gt.v\"\n`include \"../Prozessor/ALUModule/verilog-math-master_FLOAT_/components/lt.v\"\n`include \"../Prozessor/ALUModule/verilog-math-master_FLOAT_/components/int_to_single.v\"\n`include \"../Prozessor/ALUModule/verilog-math-master_FLOAT_/components/unsigned_int_to_single.v\"\n`include \"../Prozessor/ALUModule/verilog-math-master_FLOAT_/components/single_to_int.v\"\n`include \"../Prozessor/ALUModule/verilog-math-master_FLOAT_/components/single_to_unsigned_int.v\"\n\n\nreg[31:0] Radikand; //Wurzel\nreg[7:0] TakteBisFertig = 0;\nwire[31:0] FloatAdditionDaten2;\nwire[31:0] EinfacheRechnungErgebnis;\nwire[31:0] DivisionErgebnis; //Div und Mod\nwire[31:0] WurzelErgebnis;\nwire[31:0] IntZuFloatErgebnis;\nwire[31:0] UnsignedIntZuFloatErgebnis;\nwire[31:0] AdditionFloatErgebnis;\nwire[31:0] MultiplikationFloatErgebnis;\nwire[31:0] WurzelFloatErgebnis;\nwire[31:0] DivisionFloatErgebnis;\nwire[31:0] FloatZuIntErgebnis;\nwire[31:0] FloatZuUnsignedIntErgebnis;\nwire FloatGleichheitErgebnis;\nwire FloatGroesserErgebnis;\nwire FloatKleinerErgebnis;\nwire WurzelFertig;\nwire DivisionFertig;\nwire DivisionInArbeit;\nwire IntWurzelReset;\n\n//Int Arithmetik\nlocalparam IntAddition =        6'b000000;\nlocalparam IntSubtraktion =     6'b000001;\nlocalparam IntMultiplikation =  6'b000010;\nlocalparam IntQuadratwurzel =   6'b000011;\nlocalparam IntDivision =        6'b000100;\nlocalparam IntModulo =          6'b000101;\nlocalparam LinksSchiebenArithm =6'b000110;\nlocalparam RechtsSchiebenArithm=6'b000111;\nlocalparam Gleichheit =         6'b001000;\nlocalparam Ungleichheit =       6'b001001;\nlocalparam Groesser =           6'b001010;\nlocalparam Kleiner =            6'b001011;\nlocalparam GroesserUnsigned =   6'b001100;\nlocalparam KleinerUnsigned =    6'b001101;\nlocalparam IntZuFloat =         6'b001110;\nlocalparam UnsignedIntZuFloat = 6'b001111;\n\n//Logik\nlocalparam Verneinung =         6'b010000;\nlocalparam Und =                6'b010001;\nlocalparam Oder =               6'b010010;\nlocalparam Ungleich =           6'b010011;\nlocalparam Gleich =             6'b010100;\nlocalparam LinksSchiebenLogik = 6'b010110;\nlocalparam RechtsSchiebenLogik =6'b010111;\n\n//Float Arithmetik\nlocalparam FloatAddition =        6'b100000;\nlocalparam FloatSubtraktion =     6'b100001;\nlocalparam FloatMultiplikation =  6'b100010;\nlocalparam FloatQuadratwurzel =   6'b100011;\nlocalparam FloatDivision =        6'b100100;\nlocalparam FloatGleichheit =      6'b101000;\nlocalparam FloatUngleichheit =    6'b101001;\nlocalparam FloatGroesser =        6'b101010;\nlocalparam FloatKleiner =         6'b101011;\nlocalparam FloatZuInt =           6'b101110;\nlocalparam FloatZuUnsignedInt =   6'b101111;\n\nIntsqrt QuadratModul(\n    .Clock(Clock),\n    .Reset(IntWurzelReset),\n    .Num_in(Radikand),\n    .Done(WurzelFertig),\n    .Sq_root(WurzelErgebnis)\n);\n\nint_to_single IntZuFloatMacher(\n    .clk(Clock),\n    .int_to_single_a(Daten1),\n    .int_to_single_z(IntZuFloatErgebnis)\n);\n\nunsigned_int_to_single UnsignedIntZuFloatMacher(\n    .clk(Clock),\n    .unsigned_int_to_single_a(Daten1),\n    .unsigned_int_to_single_z(UnsignedIntZuFloatErgebnis)\n);\n\nadd FloatAddierer(\n    .clk(Clock),\n    .add_a(Daten1),\n    .add_b(FloatAdditionDaten2),\n    .add_z(AdditionFloatErgebnis)\n);\n\nmul FloatMultiplizierer(\n    .clk(Clock),\n    .mul_a(Daten1),\n    .mul_b(Daten2),\n    .mul_z(MultiplikationFloatErgebnis)\n);\n\nsqrt FloatWurzeler(\n    .clk(Clock),\n    .sqrt_a(Daten1),\n    .sqrt_z(WurzelFloatErgebnis)\n);\n\ndiv FloatDividierer(\n    .clk(Clock),\n    .div_a(Daten1),\n    .div_b(Daten2),\n    .div_z(DivisionFloatErgebnis)\n);\n\neq FloatVergleicherGleich(\n    .clk(Clock),\n    .eq_a(Daten1),\n    .eq_b(Daten2),\n    .eq_z(FloatGleichheitErgebnis)\n);\n\ngt FloatVergleicherGroesser(\n    .clk(Clock),\n    .gt_a(Daten1),\n    .gt_b(Daten2),\n    .gt_z(FloatGroesserErgebnis)\n);\n\nlt FloatVergleicherKleiner(\n    .clk(Clock),\n    .lt_a(Daten1),\n    .lt_b(Daten2),\n    .lt_z(FloatKleinerErgebnis)\n);\n\nsingle_to_int FloatZuIntMacher(\n    .clk(Clock),\n    .single_to_int_a(Daten1),\n    .single_to_int_z(FloatZuIntErgebnis)\n);\n\nsingle_to_unsigned_int FloatZuUnsignedIntMacher(\n    .clk(Clock),\n    .single_to_unsigned_int_a(Daten1),\n    .single_to_unsigned_int_z(FloatZuUnsignedIntErgebnis)\n);\n\nassign EinfacheRechnungErgebnis =   FunktionsCode[5:0] == IntAddition           ? $signed(Daten1) + $signed(Daten2) :\n                                    FunktionsCode[5:0] == IntSubtraktion        ? $signed(Daten1) - $signed(Daten2) :\n                                    FunktionsCode[5:0] == IntMultiplikation     ? $signed(Daten1) * $signed(Daten2) :\n                                    FunktionsCode[5:0] == IntDivision           ? $signed(Daten1) / $signed(Daten2) :\n                                    FunktionsCode[5:0] == IntModulo             ? $signed(Daten1) % $signed(Daten2) :\n                                    FunktionsCode[5:0] == LinksSchiebenArithm   ? $signed(Daten1) <<< $signed(Daten2) :\n                                    FunktionsCode[5:0] == RechtsSchiebenArithm  ? $signed(Daten1) >>> $signed(Daten2) :\n                                    FunktionsCode[5:0] == Gleichheit            ? $signed({31'b0, Daten1 == Daten2})  : \n                                    FunktionsCode[5:0] == Ungleichheit          ? $signed({31'b0, Daten1 != Daten2})  :\n                                    FunktionsCode[5:0] == Groesser              ? $signed({31'b0, $signed(Daten1) > $signed(Daten2)})  :     \n                                    FunktionsCode[5:0] == Kleiner               ? $signed({31'b0, $signed(Daten1) < $signed(Daten2)})  :\n                                    FunktionsCode[5:0] == GroesserUnsigned      ? $signed({31'b0, Daten1 > Daten2}) : \n                                    FunktionsCode[5:0] == KleinerUnsigned       ? $signed({31'b0, Daten1 < Daten2}) : \n                                    FunktionsCode[5:0] == Verneinung            ? $signed(~Daten1) : \n                                    FunktionsCode[5:0] == Und                   ? $signed(Daten1 & Daten2) :        \n                                    FunktionsCode[5:0] == Oder                  ? $signed(Daten1 | Daten2) :       \n                                    FunktionsCode[5:0] == Ungleich              ? $signed(Daten1 ^ Daten2) :   \n                                    FunktionsCode[5:0] == Gleich                ? $signed(Daten1 ~^ Daten2) :\n                                    FunktionsCode[5:0] == LinksSchiebenLogik    ? $signed(Daten1 << $signed(Daten2)) :\n                                    FunktionsCode[5:0] == RechtsSchiebenLogik   ? $signed(Daten1 >> $signed(Daten2)) : $signed(0);\n\nassign Ergebnis =   FunktionsCode[5:0] == IntQuadratwurzel ? WurzelErgebnis :\n                    FunktionsCode[5:0] == IntZuFloat ? IntZuFloatErgebnis :\n                    FunktionsCode[5:0] == UnsignedIntZuFloat ? UnsignedIntZuFloatErgebnis :\n                    FunktionsCode[5:0] == FloatAddition ? AdditionFloatErgebnis :\n                    FunktionsCode[5:0] == FloatSubtraktion ? AdditionFloatErgebnis :\n                    FunktionsCode[5:0] == FloatMultiplikation ? MultiplikationFloatErgebnis :\n                    FunktionsCode[5:0] == FloatQuadratwurzel ? WurzelFloatErgebnis :\n                    FunktionsCode[5:0] == FloatDivision ? DivisionFloatErgebnis :\n                    FunktionsCode[5:0] == FloatGleichheit ? {31'b0, FloatGleichheitErgebnis} :\n                    FunktionsCode[5:0] == FloatUngleichheit ? {31'b0, ~FloatGleichheitErgebnis} :\n                    FunktionsCode[5:0] == FloatGroesser ? {31'b0, FloatGroesserErgebnis} :\n                    FunktionsCode[5:0] == FloatKleiner ? {31'b0, FloatKleinerErgebnis} :\n                    FunktionsCode[5:0] == FloatZuInt ? {31'b0, FloatZuIntErgebnis} :\n                    FunktionsCode[5:0] == FloatZuUnsignedInt ? {31'b0, FloatZuUnsignedIntErgebnis} :\n                    EinfacheRechnungErgebnis;\n\nassign HatFertigGerechnet =     (FunktionsCode[5:0]==IntQuadratwurzel)?(WurzelFertig):(TakteBisFertig == 0);\n\nassign IntWurzelReset =         ((FunktionsCode[5:0] == IntQuadratwurzel & StartSignal) || FunktionsCode[5:0] != IntQuadratwurzel) | Reset;\n\nassign FloatAdditionDaten2 =    {(FunktionsCode[5:0] != FloatAddition),Daten2[30:0]};\n\n\nalways @(posedge Reset or posedge Clock) begin\n    if(Reset) begin\n        Radikand <= 0;\n        TakteBisFertig <= 0;\n    end else if(TakteBisFertig != 0) begin\n        TakteBisFertig <= TakteBisFertig - 1;\n    end\n    else if (StartSignal) begin\n        Radikand <= Daten1;\n        case (FunktionsCode[5:0])\n            IntZuFloat : begin\n                TakteBisFertig <= 4;\n            end\n            UnsignedIntZuFloat : begin\n                TakteBisFertig <= 4;\n            end\n            //Float Arithmetik\n            //Add.s\n            6'b100000: begin\n                TakteBisFertig <= 6;\n            end\n            //Sub.s \n            6'b100001: begin \n                TakteBisFertig <= 6;\n            end\n            //Mul.s\n            6'b100010    : begin \n                TakteBisFertig <= 8;\n            end\n            //Sqrt.s\n            6'b100011    : begin \n                TakteBisFertig <= 9;\n            end\n            //Div.s\n            6'b100100    : begin \n                TakteBisFertig <= 31;\n            end\n            //Cg.s\n            6'b101010\t: begin\n                TakteBisFertig <= 6;\n            end\n            //Cl.s\n            6'b101011\t: begin\n                TakteBisFertig <= 6;\n            end\n            FloatZuInt : begin\n                TakteBisFertig <= 1;\n            end\n            default : begin\n                TakteBisFertig <= 0;\n            end\n        endcase\n    end  "
              },
              "position": {
                "x": 872,
                "y": -976
              },
              "size": {
                "width": 1696,
                "height": 3232
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "cacc8401-cf85-4130-8ab4-f199bdec6f35",
                "port": "out"
              },
              "target": {
                "block": "8dcfc08d-f1e6-4590-8448-c8bd942f1822",
                "port": "Reset"
              }
            },
            {
              "source": {
                "block": "71842a6b-f88f-4e17-ad89-bcb5bbd0d523",
                "port": "out"
              },
              "target": {
                "block": "8dcfc08d-f1e6-4590-8448-c8bd942f1822",
                "port": "Clock"
              }
            },
            {
              "source": {
                "block": "8dcfc08d-f1e6-4590-8448-c8bd942f1822",
                "port": "HatFertigGerechnet"
              },
              "target": {
                "block": "fafd4392-05f5-4020-8989-c06d7e1bdcb3",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "7a0ad72d-1e1f-4a7d-a98f-8af8dedb49e3",
                "port": "out"
              },
              "target": {
                "block": "8dcfc08d-f1e6-4590-8448-c8bd942f1822",
                "port": "Daten2"
              },
              "size": 32
            },
            {
              "source": {
                "block": "cd22b151-94d3-4fb2-8e7f-cbccdf809bf4",
                "port": "out"
              },
              "target": {
                "block": "8dcfc08d-f1e6-4590-8448-c8bd942f1822",
                "port": "FunktionsCode"
              },
              "size": 6
            },
            {
              "source": {
                "block": "821416e3-f3d9-4ed9-8ad7-9f923ca5158a",
                "port": "out"
              },
              "target": {
                "block": "8dcfc08d-f1e6-4590-8448-c8bd942f1822",
                "port": "StartSignal"
              }
            },
            {
              "source": {
                "block": "8dcfc08d-f1e6-4590-8448-c8bd942f1822",
                "port": "Ergebnis"
              },
              "target": {
                "block": "0450dc41-6526-407d-bce5-a63817a776ed",
                "port": "in"
              },
              "size": 32
            },
            {
              "source": {
                "block": "a44f2dd4-1ea9-4743-b632-e6da11a4ab30",
                "port": "out"
              },
              "target": {
                "block": "8dcfc08d-f1e6-4590-8448-c8bd942f1822",
                "port": "Daten1"
              },
              "size": 32
            }
          ]
        }
      }
    },
    "aa9caf8ebcb7b0229e1a641e9bda55962d23528d": {
      "package": {
        "name": "MultiplexerZielDaten",
        "version": "",
        "description": "Multiplext Datan von der ALU, vom RAM und vom Immediate Operand",
        "author": "",
        "image": ""
      },
      "design": {
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
                "x": 728,
                "y": 536
              }
            },
            {
              "id": "d91193b7-11e3-48ac-b2f5-08dd974d73e2",
              "type": "basic.input",
              "data": {
                "name": "AktuellePC",
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
                "x": 720,
                "y": 584
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
                "x": 1656,
                "y": 640
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
                "x": 720,
                "y": 640
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
                "x": 720,
                "y": 688
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
                "x": 728,
                "y": 736
              }
            },
            {
              "id": "19838716-171d-40bc-bc44-06e0f2a2bc8e",
              "type": "basic.code",
              "data": {
                "ports": {
                  "in": [
                    {
                      "name": "ALUErgebnis",
                      "range": "[31:0]",
                      "size": 32
                    },
                    {
                      "name": "AktuellerPC",
                      "range": "[25:0]",
                      "size": 26
                    },
                    {
                      "name": "LoadErgebnis",
                      "range": "[31:0]",
                      "size": 32
                    },
                    {
                      "name": "JALBefehl"
                    },
                    {
                      "name": "LoadBefehl"
                    }
                  ],
                  "out": [
                    {
                      "name": "ZielDaten",
                      "range": "[31:0]",
                      "size": 32
                    }
                  ]
                },
                "params": [],
                "code": " assign ZielDaten = (JALBefehl==1'b1)? {6'b0,AktuellerPC}:\n                    ((LoadBefehl==1'b1)? LoadErgebnis:\n                    ALUErgebnis);\n"
              },
              "position": {
                "x": 976,
                "y": 544
              },
              "size": {
                "width": 528,
                "height": 248
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "19838716-171d-40bc-bc44-06e0f2a2bc8e",
                "port": "ZielDaten"
              },
              "target": {
                "block": "b7f8b7e9-59b8-4991-a6c1-51593d688b58",
                "port": "in"
              },
              "size": 32
            },
            {
              "source": {
                "block": "6c5c6aaa-2fb6-40f4-910c-fa001a1cf5fd",
                "port": "out"
              },
              "target": {
                "block": "19838716-171d-40bc-bc44-06e0f2a2bc8e",
                "port": "ALUErgebnis"
              },
              "size": 32
            },
            {
              "source": {
                "block": "d91193b7-11e3-48ac-b2f5-08dd974d73e2",
                "port": "out"
              },
              "target": {
                "block": "19838716-171d-40bc-bc44-06e0f2a2bc8e",
                "port": "AktuellerPC"
              },
              "size": 26
            },
            {
              "source": {
                "block": "95777557-33b9-4fae-8324-55ca8d0ea6c8",
                "port": "out"
              },
              "target": {
                "block": "19838716-171d-40bc-bc44-06e0f2a2bc8e",
                "port": "LoadErgebnis"
              },
              "size": 32
            },
            {
              "source": {
                "block": "6d9a9010-9997-45ca-9724-9b5b4fc74839",
                "port": "out"
              },
              "target": {
                "block": "19838716-171d-40bc-bc44-06e0f2a2bc8e",
                "port": "JALBefehl"
              }
            },
            {
              "source": {
                "block": "66cf6051-c4f5-490a-9570-8d4da9276ef3",
                "port": "out"
              },
              "target": {
                "block": "19838716-171d-40bc-bc44-06e0f2a2bc8e",
                "port": "LoadBefehl"
              }
            }
          ]
        }
      }
    },
    "1215e7c917c45969312f4d1b2e4c239094400d4c": {
      "package": {
        "name": "Bedingungsprüfer",
        "version": "",
        "description": "Vornort alle Bits und gibt das Ergebnis aus",
        "author": "",
        "image": ""
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "0fe5550a-6ffd-4cc7-8fcc-3a62a6c8c2c4",
              "type": "basic.input",
              "data": {
                "name": "Eingang",
                "range": "[31:0]",
                "clock": false,
                "size": 32
              },
              "position": {
                "x": 616,
                "y": 104
              }
            },
            {
              "id": "b0cef370-f1b8-40aa-9372-37c6e08dc3dd",
              "type": "basic.output",
              "data": {
                "name": "Ergebnis",
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
                "x": 1168,
                "y": 304
              }
            },
            {
              "id": "da29e25a-f215-4ae3-a9a6-7ef8aa9b30bb",
              "type": "basic.input",
              "data": {
                "name": "GleichNullPrüfen",
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
                "x": 616,
                "y": 312
              }
            }
          ],
          "wires": []
        }
      }
    },
    "ef4843571745ee7cf39510612ba7bd08ba00fb02": {
      "package": {
        "name": "MultiplexerAluDaten",
        "version": "",
        "description": "Multiplext die möglichen ALU Eingänge (Register, kleiner und großer Immediate)",
        "author": "",
        "image": ""
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "3128ddd7-9d74-4768-aa0e-fc956aa0734d",
              "type": "basic.input",
              "data": {
                "name": "RegisterDaten2",
                "range": "[31:0]",
                "clock": false,
                "size": 32
              },
              "position": {
                "x": 568,
                "y": 1440
              }
            },
            {
              "id": "d7d5b5c0-0edd-452c-a3cb-dd61710939c1",
              "type": "basic.input",
              "data": {
                "name": "Immediate",
                "virtual": true,
                "range": "[31:0]",
                "pins": [
                  {
                    "index": "31",
                    "name": "NULL",
                    "value": "NULL"
                  },
                  {
                    "index": "30",
                    "name": "NULL",
                    "value": "NULL"
                  },
                  {
                    "index": "29",
                    "name": "NULL",
                    "value": "NULL"
                  },
                  {
                    "index": "28",
                    "name": "NULL",
                    "value": "NULL"
                  },
                  {
                    "index": "27",
                    "name": "NULL",
                    "value": "NULL"
                  },
                  {
                    "index": "26",
                    "name": "NULL",
                    "value": "NULL"
                  },
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
                "x": 568,
                "y": 1496
              }
            },
            {
              "id": "7aa4c854-00a8-436d-9729-901eeb493bb7",
              "type": "basic.output",
              "data": {
                "name": "Daten2",
                "range": "[31:0]",
                "size": 32
              },
              "position": {
                "x": 1664,
                "y": 1496
              }
            },
            {
              "id": "081e5dbe-2409-4488-9430-fc8ae8d66ee3",
              "type": "basic.input",
              "data": {
                "name": "ImmediateAktiv",
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
                "x": 568,
                "y": 1552
              }
            },
            {
              "id": "817cd645-9e8f-4b33-8eda-25f848d3b33f",
              "type": "basic.code",
              "data": {
                "ports": {
                  "in": [
                    {
                      "name": "RegisterDaten2",
                      "range": "[31:0]",
                      "size": 32
                    },
                    {
                      "name": "Immediate",
                      "range": "[31:0]",
                      "size": 32
                    },
                    {
                      "name": "ImmediateAktiv"
                    }
                  ],
                  "out": [
                    {
                      "name": "Daten2",
                      "range": "[31:0]",
                      "size": 32
                    }
                  ]
                },
                "params": [],
                "code": " assign Daten2 = (ImmediateAktiv==1'b1)? Immediate:\n                    RegisterDaten2;\n"
              },
              "position": {
                "x": 872,
                "y": 1448
              },
              "size": {
                "width": 624,
                "height": 160
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "817cd645-9e8f-4b33-8eda-25f848d3b33f",
                "port": "Daten2"
              },
              "target": {
                "block": "7aa4c854-00a8-436d-9729-901eeb493bb7",
                "port": "in"
              },
              "size": 32
            },
            {
              "source": {
                "block": "3128ddd7-9d74-4768-aa0e-fc956aa0734d",
                "port": "out"
              },
              "target": {
                "block": "817cd645-9e8f-4b33-8eda-25f848d3b33f",
                "port": "RegisterDaten2"
              },
              "size": 32
            },
            {
              "source": {
                "block": "d7d5b5c0-0edd-452c-a3cb-dd61710939c1",
                "port": "out"
              },
              "target": {
                "block": "817cd645-9e8f-4b33-8eda-25f848d3b33f",
                "port": "Immediate"
              },
              "size": 32
            },
            {
              "source": {
                "block": "081e5dbe-2409-4488-9430-fc8ae8d66ee3",
                "port": "out"
              },
              "target": {
                "block": "817cd645-9e8f-4b33-8eda-25f848d3b33f",
                "port": "ImmediateAktiv"
              }
            }
          ]
        }
      }
    },
    "433ce5316c1247a4e0a16f5007c3b5cf1c56a0e3": {
      "package": {
        "name": "MultiplexerNeuerPc",
        "version": "",
        "description": "Multiplext relative und absolute neue PCs. Die Bits 31 bis 26 werden ignoriert",
        "author": "",
        "image": ""
      },
      "design": {
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
      }
    },
    "26af9a43487ae90923261d1771fd552a03494500": {
      "package": {
        "name": "MultiplexerAluDaten2",
        "version": "",
        "description": "Multiplext den aktuellen PC mit den Quelldaten2",
        "author": "",
        "image": ""
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "49cdeb8d-fdde-46cb-8b43-67fc607de353",
              "type": "basic.input",
              "data": {
                "name": "AktuellerPC",
                "range": "[25:0]",
                "clock": false,
                "size": 26
              },
              "position": {
                "x": 480,
                "y": 312
              }
            },
            {
              "id": "fee8ac0d-c6f4-48ce-a75d-2a904ebd1296",
              "type": "basic.output",
              "data": {
                "name": "Daten1",
                "virtual": true,
                "range": "[31:0]",
                "pins": [
                  {
                    "index": "31",
                    "name": "NULL",
                    "value": "NULL"
                  },
                  {
                    "index": "30",
                    "name": "NULL",
                    "value": "NULL"
                  },
                  {
                    "index": "29",
                    "name": "NULL",
                    "value": "NULL"
                  },
                  {
                    "index": "28",
                    "name": "NULL",
                    "value": "NULL"
                  },
                  {
                    "index": "27",
                    "name": "NULL",
                    "value": "NULL"
                  },
                  {
                    "index": "26",
                    "name": "NULL",
                    "value": "NULL"
                  },
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
                ]
              },
              "position": {
                "x": 1520,
                "y": 368
              }
            },
            {
              "id": "d6c04894-ff4c-4827-b35d-7dbd31a34e4f",
              "type": "basic.input",
              "data": {
                "name": "QuellDaten1",
                "range": "[31:0]",
                "clock": false,
                "size": 32
              },
              "position": {
                "x": 488,
                "y": 368
              }
            },
            {
              "id": "7461aa4d-447c-46cc-92b2-f437b6fb7557",
              "type": "basic.input",
              "data": {
                "name": "RelativerSprungBefehl",
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
                "x": 424,
                "y": 424
              }
            },
            {
              "id": "27468064-edc5-49e1-887d-f31db8030d87",
              "type": "basic.code",
              "data": {
                "ports": {
                  "in": [
                    {
                      "name": "AktuellerPC",
                      "range": "[25:0]",
                      "size": 26
                    },
                    {
                      "name": "QuellDaten1",
                      "range": "[31:0]",
                      "size": 32
                    },
                    {
                      "name": "RelativerSprungBefehl"
                    }
                  ],
                  "out": [
                    {
                      "name": "Daten1",
                      "range": "[31:0]",
                      "size": 32
                    }
                  ]
                },
                "params": [],
                "code": " assign Daten1 = (RelativerSprungBefehl==1'b1)? {6'b0,AktuellerPC}:\n                    QuellDaten1;\n"
              },
              "position": {
                "x": 712,
                "y": 320
              },
              "size": {
                "width": 640,
                "height": 160
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "49cdeb8d-fdde-46cb-8b43-67fc607de353",
                "port": "out"
              },
              "target": {
                "block": "27468064-edc5-49e1-887d-f31db8030d87",
                "port": "AktuellerPC"
              },
              "size": 26
            },
            {
              "source": {
                "block": "d6c04894-ff4c-4827-b35d-7dbd31a34e4f",
                "port": "out"
              },
              "target": {
                "block": "27468064-edc5-49e1-887d-f31db8030d87",
                "port": "QuellDaten1"
              },
              "size": 32
            },
            {
              "source": {
                "block": "7461aa4d-447c-46cc-92b2-f437b6fb7557",
                "port": "out"
              },
              "target": {
                "block": "27468064-edc5-49e1-887d-f31db8030d87",
                "port": "RelativerSprungBefehl"
              }
            },
            {
              "source": {
                "block": "27468064-edc5-49e1-887d-f31db8030d87",
                "port": "Daten1"
              },
              "target": {
                "block": "fee8ac0d-c6f4-48ce-a75d-2a904ebd1296",
                "port": "in"
              },
              "size": 32
            }
          ]
        }
      }
    }
  }
}