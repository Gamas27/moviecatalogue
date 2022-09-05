//
//  Model.swift
//  moviecatalogue
//
//  Created by João Gameiro on 05/09/2022.
//

import Foundation

// MARK: - Welcome
struct Welcome: Decodable {
    let searchType, expression: String
    let results: [Result]
    let errorMessage: String
}

// MARK: - Result
struct Result: Decodable, Hashable {
    let id, resultType: String
    let image: String
    let title, resultDescription: String

    enum CodingKeys: String, CodingKey {
        case id, resultType, image, title
        case resultDescription = "description"
    }

    func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }

        public static func == (lhs: Result, rhs: Result) -> Bool {
            return lhs.id == rhs.id
        }
}
