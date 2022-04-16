//
//  LoC.swift
//  BookScan
//
//  Created by Peter Richardson on 11/29/21.
//

import Foundation

class LoC {
    static func lookup(isbn: String, completion: @escaping(String) throws -> ()) {
        let apiKey = "<insert your google books api key here>"
        guard let url = URL(string: "https://www.googleapis.com/books/v1/volumes?q=isbn:\(isbn)&key=\(apiKey)") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
             DispatchQueue.main.async {
                let outputStr  = String(data: data!, encoding: String.Encoding.utf8) as String?
                try! completion(outputStr!)
            }
        }
        .resume()
    }
}
