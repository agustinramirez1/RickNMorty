//
//  RMEndPoint.swift
//  RickAndMorty
//
//  Created by Agustin Ramirez on 2023-08-23.
//

import Foundation

/// Represent unique API endpoint
@frozen enum RMEndPoint: String {
    /// Endpoint to get character info
    case character
    /// Endpoint to get location info
    case location
    /// Endpoint to get episode info
    case episode
}
