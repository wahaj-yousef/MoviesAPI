import Fluent

struct CreateMovie: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("movies")
        
            .id()
            .field("movie_name", .string, .required)
            .field("movie_poster", .data, .required)
            .field("movie_story", .string, .required)
            .field("movie_duration", .date, .required)
            .field("movie_genres", .string, .required)
            .field("movie_watcher_type", .string, .required)
            .field("movie_IMDb_rate", .double, .required)
            .field("movie_language", .string, .required)

            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("movies").delete()
    }
}
