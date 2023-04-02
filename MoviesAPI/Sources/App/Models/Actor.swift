//
//  Actor.swift
//  MoviesAPI
//
//  Created by Wahaj on 15/02/2023.
//

import Fluent
import Vapor


final class Actor: Model, Content {

    static let schema = "actor"

    @ID() var id: UUID?
        
    @Field(key: "actor_name") var actor_name: String
    
    @Field(key: "actor_image") var actor_image: Data
    
    @Siblings(through: MovieActor.self, from: \.$actor, to: \.$movie) var movies: [Movie]

    init() { }

    init(id: UUID? = nil,movie_id: UUID, actor_name: String, actor_image: Data) {
        self.id = id
        self.actor_name = actor_name
        self.actor_image = actor_image

    }
}
