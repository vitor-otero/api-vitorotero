//
//  SongController.swift
//  
//
//  Created by Vitor Otero on 24/04/2022.
//

import Fluent
import Vapor

struct SongController: RouteCollection {
  
    func boot(routes: RoutesBuilder) throws {
        //routes means localhost/songs
        let songs = routes.grouped("songs")
        songs.get(use: index)
        songs.post(use: create)
    }
    
    func index(req: Request) throws -> EventLoopFuture<[Song]> {
        //Get data from db >> Song Model
        return Song.query(on: req.db).all()
    }
        //Create data on db
    func create(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        let song = try req.content.decode(Song.self)
        return song.save(on: req.db).transform(to: .ok)
    }
}
