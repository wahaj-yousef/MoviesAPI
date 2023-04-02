import Fluent

struct CreateActor: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("actor")
            .id()
            .field("actor_name", .string, .required)
            .field("actor_image", .data, .required)

            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("actor").delete()
    }
}
