//
//  CreateSongs.swift
//  
//
//  Created by Vitor Otero on 24/04/2022.
//

import Fluent

struct CreateSongs: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        //Create table db on API begin
        return database.schema("songs")
            .id()
            .field("title", .string, .required)
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        //Revert delete table db been create API begin
        return database.schema("songs").delete()
    }
}
