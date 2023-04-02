import Fluent
import Vapor

func routes(_ app: Application) throws {

    try app.register(collection: MoviesController())
    try app.register(collection: DirectorController())
    try app.register(collection: ActorController())

}
