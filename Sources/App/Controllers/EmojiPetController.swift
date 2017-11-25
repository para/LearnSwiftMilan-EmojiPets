//
//  EmojiPetController.swift
//  App
//
//  Created by Alberto Guarino on 19/11/2017.
//

import Vapor
import FluentProvider

struct EmojiPetController {
    // Add all EmojiPetController routes to a Droplet
    func addRoutes(to drop: Droplet) {
        // Define a common path prefix for all routes inside this group
        let group = drop.grouped("api", "pets")
        group.get(handler: getEmojiPets) // GET /api/pets
        group.post(handler: createEmojiPet) // POST /api/pets
    }
    
    // Get a list of all existing EmojiPets
    func getEmojiPets(_ req: Request) throws -> ResponseRepresentable {
        // Retrieve all the EmojiPets from the DB
        let pets = try EmojiPet.all()
        // Return the array of EmojiPets as JSON
        return try pets.makeJSON()
    }
    
    // Create a new EmojiPet
    func createEmojiPet(_ req: Request) throws -> ResponseRepresentable {
        // Make sure the request contains JSON
        guard let json = req.json else {
            throw Abort.badRequest
        }
        
        // Parse JSON and save EmojiPet in the DB
        let newPet = try EmojiPet(json: json)
        try newPet.save()
        
        // Return the newly created EmojiPet
        return newPet
    }
}
