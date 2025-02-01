//
//  Card.swift
//  Flashzilla
//
//  Created by mac on 20/01/25.
//

struct Card:Codable {
    var prompt: String
    var answer: String

    static let example = Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
}
