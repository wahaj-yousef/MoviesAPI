
import Fluent

struct CreateMovieDirector: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("movie_director")
            .id()
        
            .field("movie_id", .uuid, .required, .references("movies", "id"))
            .field("director_id", .uuid, .required, .references("director", "id"))
            .create()
    }
    
    func revert(on database: Database) async throws {
        try await database.schema("movie_director").delete()
    }
}
