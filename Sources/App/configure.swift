import Fluent
import FluentPostgresDriver
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.databases.use(.postgres(
        hostname: Environment.get("DATABASE_HOST") ?? "localhost",
        port: Environment.get("DATABASE_PORT").flatMap(Int.init(_:)) ?? PostgresConfiguration.ianaPortNumber,
        username: Environment.get("DATABASE_USERNAME") ?? "api_server",
        password: Environment.get("DATABASE_PASSWORD") ?? "oQPV*kU@px*TgV7G9QZR",
        database: Environment.get("DATABASE_NAME") ?? "api_database"
    ), as: .psql)

    
    app.migrations.add(CreateSongs())
    //wait till finish migration CreateSongs.
    try app.autoMigrate().wait()
    
    // register routes
    try routes(app)
}
