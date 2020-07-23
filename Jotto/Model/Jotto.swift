/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Jotto : Codable {

    let game : [Game]?

    enum CodingKeys: String, CodingKey {

        case game = "game"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        game = try? values.decodeIfPresent([Game].self, forKey: .game)
    }
    
    struct Game : Codable {
        var item : [Item]?

        enum CodingKeys: String, CodingKey {

            case item = "item"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            item = try? values.decodeIfPresent([Item].self, forKey: .item)
        }

    }

    struct Item : Codable {
        var number : Int?
        var posx : Double?
        var posy : Double?
        var color : String?
        var size : Double?

        enum CodingKeys: String, CodingKey {

            case number = "number"
            case posx = "posx"
            case posy = "posy"
            case color = "color"
            case size = "size"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            number = try? values.decodeIfPresent(Int.self, forKey: .number)
            posx = try? values.decodeIfPresent(Double.self, forKey: .posx)
            posy = try? values.decodeIfPresent(Double.self, forKey: .posy)
            color = try? values.decodeIfPresent(String.self, forKey: .color)
            size = try? values.decodeIfPresent(Double.self, forKey: .size)
        }

    }

}

/*
 {
    "game":[
       {
          "item":[
             {
                "number":-1,
                "posx":0.0,
                "posy":0.0,
                "color":"#ffffff",
                "size":10.0
             },
             {
                "number":-1,
                "posx":0.0,
                "posy":0.0,
                "color":"#ffffff",
                "size":10.0
             },
             {
                "number":-1,
                "posx":0.0,
                "posy":0.0,
                "color":"#ffffff",
                "size":10.0
             },
             {
                "number":-1,
                "posx":0.0,
                "posy":0.0,
                "color":"#ffffff",
                "size":10.0
             },
             {
                "number":-1,
                "posx":0.0,
                "posy":0.0,
                "color":"#ffffff",
                "size":10.0
             },
             {
                "number":-1,
                "posx":0.0,
                "posy":0.0,
                "color":"#ffffff",
                "size":10.0
             }
          ]
       },
       {
          "item":[
             {
                "number":-1,
                "posx":0.0,
                "posy":0.0,
                "color":"#ffffff",
                "size":10.0
             },
             {
                "number":-1,
                "posx":0.0,
                "posy":0.0,
                "color":"#ffffff",
                "size":10.0
             },
             {
                "number":-1,
                "posx":0.0,
                "posy":0.0,
                "color":"#ffffff",
                "size":10.0
             },
             {
                "number":-1,
                "posx":0.0,
                "posy":0.0,
                "color":"#ffffff",
                "size":10.0
             },
             {
                "number":-1,
                "posx":0.0,
                "posy":0.0,
                "color":"#ffffff",
                "size":10.0
             },
             {
                "number":-1,
                "posx":0.0,
                "posy":0.0,
                "color":"#ffffff",
                "size":10.0
             }
          ]
       },
       {
          "item":[
             {
                "number":-1,
                "posx":0.0,
                "posy":0.0,
                "color":"#ffffff",
                "size":10.0
             },
             {
                "number":-1,
                "posx":0.0,
                "posy":0.0,
                "color":"#ffffff",
                "size":10.0
             },
             {
                "number":-1,
                "posx":0.0,
                "posy":0.0,
                "color":"#ffffff",
                "size":10.0
             },
             {
                "number":-1,
                "posx":0.0,
                "posy":0.0,
                "color":"#ffffff",
                "size":10.0
             },
             {
                "number":-1,
                "posx":0.0,
                "posy":0.0,
                "color":"#ffffff",
                "size":10.0
             },
             {
                "number":-1,
                "posx":0.0,
                "posy":0.0,
                "color":"#ffffff",
                "size":10.0
             }
          ]
       },
       {
          "item":[
             {
                "number":-1,
                "posx":0.0,
                "posy":0.0,
                "color":"#ffffff",
                "size":10.0
             },
             {
                "number":-1,
                "posx":0.0,
                "posy":0.0,
                "color":"#ffffff",
                "size":10.0
             },
             {
                "number":-1,
                "posx":0.0,
                "posy":0.0,
                "color":"#ffffff",
                "size":10.0
             },
             {
                "number":-1,
                "posx":0.0,
                "posy":0.0,
                "color":"#ffffff",
                "size":10.0
             },
             {
                "number":-1,
                "posx":0.0,
                "posy":0.0,
                "color":"#ffffff",
                "size":10.0
             },
             {
                "number":-1,
                "posx":0.0,
                "posy":0.0,
                "color":"#ffffff",
                "size":10.0
             }
          ]
       },
       {
          "item":[
             {
                "number":-1,
                "posx":0.0,
                "posy":0.0,
                "color":"#ffffff",
                "size":10.0
             },
             {
                "number":-1,
                "posx":0.0,
                "posy":0.0,
                "color":"#ffffff",
                "size":10.0
             },
             {
                "number":-1,
                "posx":0.0,
                "posy":0.0,
                "color":"#ffffff",
                "size":10.0
             },
             {
                "number":-1,
                "posx":0.0,
                "posy":0.0,
                "color":"#ffffff",
                "size":10.0
             },
             {
                "number":-1,
                "posx":0.0,
                "posy":0.0,
                "color":"#ffffff",
                "size":10.0
             },
             {
                "number":-1,
                "posx":0.0,
                "posy":0.0,
                "color":"#ffffff",
                "size":10.0
             }
          ]
       },
       {
          "item":[
             {
                "number":-1,
                "posx":0.0,
                "posy":0.0,
                "color":"#ffffff",
                "size":10.0
             },
             {
                "number":-1,
                "posx":0.0,
                "posy":0.0,
                "color":"#ffffff",
                "size":10.0
             },
             {
                "number":-1,
                "posx":0.0,
                "posy":0.0,
                "color":"#ffffff",
                "size":10.0
             },
             {
                "number":-1,
                "posx":0.0,
                "posy":0.0,
                "color":"#ffffff",
                "size":10.0
             },
             {
                "number":-1,
                "posx":0.0,
                "posy":0.0,
                "color":"#ffffff",
                "size":10.0
             },
             {
                "number":-1,
                "posx":0.0,
                "posy":0.0,
                "color":"#ffffff",
                "size":10.0
             }
          ]
       }
    ]
 }


 **/

