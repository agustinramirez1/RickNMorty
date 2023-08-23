//
//  RMCharacterStatus.swift
//  RickAndMorty
//
//  Created by Agustin Ramirez on 2023-08-23.
//

import Foundation

enum RMCharacterStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case `unknown` = "unknown"
}
