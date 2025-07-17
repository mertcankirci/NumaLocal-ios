//
//  NetworkError.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 16.07.2025.
//

import Foundation

enum NetworkError: Error {
    case invalidUrl
    case badRequest
    case notFound
    case decodingError
}

enum ApplESignInError: Error {
    case invalidResponse
    case alreadySigningIn
}
