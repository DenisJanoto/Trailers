//
//  Trailer.swift
//  TrailerFlix
//
//  Created by Denis Janoto on 19/03/2019.
//  Copyright © 2019 Denis Janoto. All rights reserved.
//

import Foundation

struct Trailer:Codable {
    let title:String
    let url:String
    let rating:Int
    let year:Int
    let poster:String
}
