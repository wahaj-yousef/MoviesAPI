import Fluent
import Vapor

struct DirectorController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let directors = routes.grouped("director")
        directors.get(use: index)
        directors.post(use: create)
        directors.group(":movieId") { actor in
            actor.get(use: getDirector)
            actor.delete(use: delete)
        }
        
        
    }
    
    func create(_ req: Request) throws -> EventLoopFuture<Director> {
        let director = try req.content.decode(Director.self)
        return director.create(on: req.db).map { director }
    }
    
    func index(req: Request) throws -> EventLoopFuture<[Director]> {
        return Director.query(on: req.db).all()
    }
    
    func getDirector(req: Request) throws -> EventLoopFuture<[Director]> {
        if let id = try? req.query.get(UUID.self, at: "movieId") {
            return Director.find(id, on: req.db).map {
                guard let director = $0 else { return [] }
                return [director]
            }
        } else {
            return Director.query(on: req.db).all()
        }
    }
    
    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        return Director.find(req.parameters.get("movieId"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .ok)
    }
}
