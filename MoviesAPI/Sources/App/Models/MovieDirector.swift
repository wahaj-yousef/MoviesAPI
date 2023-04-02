//
//  File.swift
//  
//
//  Created by Wahaj on 20/02/2023.
//
import Fluent
import Vapor

final class MovieDirector: Model {
    

    static let schema = "movie_director"
    
    @ID() var id: UUID?
    
    @Parent(key: "movie_id") var movie: Movie

    @Parent(key: "director_id") var director: Director
    

    init() { }

    init(movie_id: UUID, director_id: UUID) {
        self.$movie.id = movie_id
        self.$director.id = director_id

    }
}
