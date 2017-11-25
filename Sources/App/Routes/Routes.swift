import Vapor

extension Droplet {
    func setupRoutes() throws {
        let controller = EmojiPetController()
        controller.addRoutes(to: self)
    }
}
