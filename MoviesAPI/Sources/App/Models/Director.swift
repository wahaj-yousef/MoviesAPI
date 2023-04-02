//
//  File.swift
//  
//
//  Created by Wahaj on 20/02/2023.
//

import Foundation

import Fluent
import Vapor


final class Director: Model, Content {

    static let schema = "director"

    @ID() var id: UUID?
        
    @Field(key: "director_name") var director_name: String
    
    @Field(key: "director_image") var director_image: Data
    
    @Siblings(through: MovieDirector.self, from: \.$director, to: \.$movie) var movies: [Movie]

    init() { }

    init(id: UUID? = nil,movie_id: UUID, director_name: String, director_image: Data) {
        self.id = id
        self.director_name = director_name
        self.director_image = director_image

    }
}
