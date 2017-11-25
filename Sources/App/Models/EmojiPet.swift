//
//  EmojiPet.swift
//  App
//
//  Created by Alberto Guarino on 19/11/2017.
//

import FluentProvider

protocol EmojiPetProtocol {
    var name: String { get }
    var emoji: String { get }
}

// EmojiPet Model
final class EmojiPet: EmojiPetProtocol, Model {
    let storage = Storage()
    
    let name: String // e.g., "FailPanda"
    let emoji: String // e.g., "🐼"

    init(name: String, emoji: String) {
        self.name = name
        self.emoji = emoji
    }
    
    // Fluent serialization
    struct Keys {
        static let id = "id"
        static let name = "name"
        static let emoji = "emoji"
    }
    
    init(row: Row) throws {
        self.name = try row.get(Keys.name)
        self.emoji = try row.get(Keys.emoji)
    }
    
    func makeRow() throws -> Row {
        var row = Row()
        try row.set(Keys.name, name)
        try row.set(Keys.emoji, emoji)
        return row
    }
}

// Fluent Preparation
extension EmojiPet: Preparation {
    static func prepare(_ database: Database) throws {
        try database.create(self) { builder in
            builder.id()
            builder.string(Keys.name)
            builder.string(Keys.emoji)
        }
    }
    
    static func revert(_ database: Database) throws {
        try database.delete(self)
    }
}

// This extension specifies how the model converts to / from JSON.
extension EmojiPet: JSONConvertible {
    func makeJSON() throws -> JSON {
        var json = JSON()
        try json.set(Keys.id, id)
        try json.set(Keys.name, name)
        try json.set(Keys.emoji, emoji)
        return json
    }

    convenience init(json: JSON) throws {
        try self.init(name: json.get(Keys.name), emoji: json.get(Keys.emoji))
    }
}

// This extension allows EmojiPet objects to be returned directly in routes
extension EmojiPet: ResponseRepresentable {}

