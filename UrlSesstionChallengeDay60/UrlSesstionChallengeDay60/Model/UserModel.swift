//
//  UserModel.swift
//  UrlSesstionChallengeDay60
//
//  Created by mac on 10/11/24.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//let parentChildAsset = try? JSONDecoder().decode(ParentChildAsset.self, from: jsonData);

import Foundation

// MARK: - ParentChildAssetElement
class UserModel: Codable,Identifiable {
    var id: String?
    var isActive: Bool?
    var name: String?
    var age: Int?
    var company, email, address, about: String?
    var registered: String?
    var tags: [String]?
    var friends: [Friend]?

    init(id: String?, isActive: Bool?, name: String?, age: Int?, company: String?, email: String?, address: String?, about: String?, registered: String?, tags: [String]?, friends: [Friend]?) {
        self.id = id
        self.isActive = isActive
        self.name = name
        self.age = age
        self.company = company
        self.email = email
        self.address = address
        self.about = about
        self.registered = registered
        self.tags = tags
        self.friends = friends
    }
}

// MARK: - Friend
class Friend: Codable,Identifiable{
    var id, name: String?

    init(id: String?, name: String?) {
        self.id = id
        self.name = name
    }
}

typealias userModel = [UserModel]
