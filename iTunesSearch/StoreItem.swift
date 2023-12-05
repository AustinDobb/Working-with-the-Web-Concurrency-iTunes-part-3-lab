//
//  StoreItem.swift
//  iTunesSearch
//
//  Created by Austin Dobberfuhl on 11/29/23.
//

import Foundation

//struct SearchREsponse: Codable {
//    let results: [StoreItem]
//}

struct StoreItem: Codable {
    var name: String
    var artist: String
    var kind: String
    var description: String?
    var artworkURL: String
    
    enum CodingKeys: String, CodingKey {
        case name = "trackName"
        case artist = "artistName"
        case kind = "kind"
        case description = "description"
        case artworkURL = "artworkUrl100"
        
    }
    
}
