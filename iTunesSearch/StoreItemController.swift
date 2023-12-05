//
//  StoreItemController.swift
//  iTunesSearch
//
//  Created by Austin Dobberfuhl on 11/29/23.
//

import Foundation
import UIKit

class StoreItemController: UIViewController {
    
    // ... rest of the class code
    
    //func fetchImageData(for url: URL) async throws -> Data {
    //    let (data, response) = try await URLSession.shared.data(from: url)
    //
    //    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
    //        throw PokemonError.badResponse
    //    }
    //
    //    return data
    
    //
    //enum PhotoInfoError: Error, LocalizedError {
    //    case itemNotFound
    //    case imageDataMissing
    //}
    
    enum StoreItemError: Error, LocalizedError {
        case itemsNotFound
    }
    struct SearchResponse: Codable {
        let results: [StoreItem]
    }
    //    func fetchItems(matching query: [String: String]) async
    //    throws -> [StoreItem] {
    //        var urlComponents = URLComponents(string: "https://itunes.apple.com/search")!
    //        urlComponents.queryItems = query.map { URLQueryItem(name: $0.key, value: $0.value) }
    //
    //        let (data, response) = try await URLSession.shared.data(from: urlComponents.url!)
    //
    //        guard let httpResponse = response as? HTTPURLResponse,
    //              httpResponse.statusCode == 200 else {
    //            throw StoreItemError.itemsNotFound
    //        }
    //
    //        let decoder = JSONDecoder()
    //        let searchResponse = try decoder.decode([StoreItem].self,
    //                                                from: data)
    //
    //        return searchResponse
    //    }
    //}
    
    func fetchItems(matching queryItems: [URLQueryItem]) async throws -> [StoreItem] {
        var urlComponents = URLComponents(string: "https://itunes.apple.com/search")!
        urlComponents.queryItems = queryItems
        print(urlComponents)
        let (data, _) = try await URLSession.shared.data(from: urlComponents.url!)
        let searchResponse = try JSONDecoder().decode(SearchResponse.self, from: data)
        return searchResponse.results
    }
}
