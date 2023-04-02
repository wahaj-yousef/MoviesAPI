import Fluent

struct CreateDirector: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("director")
            .id()
            .field("director_name", .string, .required)
            .field("director_image", .data, .required)

            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("director").delete()
    }
}
