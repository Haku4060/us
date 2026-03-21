//
//  util.swift
//  us
//
//  Created by Hakuho Fujiwara on 3/20/26.
//

import Foundation

enum API {
    static let baseURL = "http://localhost:8000"
}

struct User: Decodable {
    let name: String
    let status: String
}

func getUserName(userId: Int) async throws -> String {
    guard let url = URL(string: "\(API.baseURL)/user/\(userId)") else {
        throw URLError(.badURL)
    }

    let (data, _) = try await URLSession.shared.data(from: url)
    let user = try JSONDecoder().decode(User.self, from: data)
    return user.name
}

func getUserStatus(userId: Int) async throws -> String {
    guard let url = URL(string: "\(API.baseURL)/user/\(userId)") else {
        throw URLError(.badURL)
    }

    let (data, _) = try await URLSession.shared.data(from: url)
    let user = try JSONDecoder().decode(User.self, from: data)
    return user.status
}
