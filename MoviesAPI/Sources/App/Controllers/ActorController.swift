import Fluent
import Vapor

struct ActorController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let actors = routes.grouped("actor")
        actors.get(use: index)
        actors.post(use: create)
        actors.group(":movieId") { actor in
            actor.get(use: getActor)
            actor.delete(use: delete)
        }
        
        
    }
    
    func create(_ req: Request) throws -> EventLoopFuture<Actor> {
        let actor = try req.content.decode(Actor.self)
        return actor.create(on: req.db).map { actor }
    }
    
    func index(req: Request) throws -> EventLoopFuture<[Actor]> {
        return Actor.query(on: req.db).all()
    }
    
    func getActor(req: Request) throws -> EventLoopFuture<[Actor]> {
        if let id = try? req.query.get(UUID.self, at: "movieId") {
            return Actor.find(id, on: req.db).map {
                guard let actor = $0 else { return [] }
                return [actor]
            }
        } else {
            return Actor.query(on: req.db).all()
        }
    }
    
    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        return Actor.find(req.parameters.get("movieId"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .ok)
    }
}
