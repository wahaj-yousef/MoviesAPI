import Fluent
import Vapor

struct MoviesController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let movies = routes.grouped("movies")
        movies.get(use: index)
        movies.post(use: create)
        movies.get(":id", use: getMovie)

       
    }

    func create(_ req: Request) throws -> EventLoopFuture<Movie> {
         let movie = try req.content.decode(Movie.self)
         return movie.create(on: req.db).map { movie }
     }
     
     func index(req: Request) throws -> EventLoopFuture<[Movie]> {
         return Movie.query(on: req.db).all()
     }
    
    func getMovie(req: Request) throws -> EventLoopFuture<Movie> {
          Movie.find(req.parameters.get("id"), on: req.db)
                    .unwrap(or: Abort(.notFound))
    }

   
}
