//
//  File.swift
//  
//
//  Created by Wahaj on 19/02/2023.
//

import Fluent
import Vapor

final class MovieActor: Model { 
    

    static let schema = "movie_actors"
    
    @ID() var id: UUID?
    
    @Parent(key: "movie_id") var movie: Movie

    @Parent(key: "actor_id") var actor: Actor
    

    init() { }

    init(movie_id: UUID, actor_id: UUID) {
        self.$movie.id = movie_id
        self.$actor.id = actor_id

    }
}
