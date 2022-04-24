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
    }
    
    func index(req: Request) throws -> EventLoopFuture<[Song]> {
        //Get data from db >> Song Model
        return Song.query(on: req.db).all()
    }
}
