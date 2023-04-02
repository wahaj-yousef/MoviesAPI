
import Fluent

struct CreateMovieActor: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("movie_actors")
            .id()
            .field("movie_id", .uuid, .required, .references("movies", "id"))
            .field("actor_id", .uuid, .required, .references("actor", "id"))
        
            .create()
    }
    
    func revert(on database: Database) async throws {
        try await database.schema("movie_actors").delete()
    }
}
