import Fluent
import Vapor

final class Movie: Model, Content {
    static let schema = "movies"
    
    @ID(key: .id) var id: UUID?
    
    @Field(key: "movie_name")var movie_name: String

    @Field(key: "movie_poster")var movie_poster: Data
    
    @Field(key: "movie_story")var movie_story: String
    
    @Field(key: "movie_duration")var movie_duration: Date
    
    @Field(key: "movie_genres")var movie_genres: String
    
    @Field(key: "movie_watcher_type")var movie_watcher_type: String
    
    @Field(key: "movie_IMDb_rate")var movie_IMDb_rate: Double
    
    @Field(key: "movie_language")var movie_language: String
        
    @Siblings(through: MovieActor.self, from: \.$movie, to: \.$actor) var actors : [Actor]
    
    @Siblings(through: MovieDirector.self, from: \.$movie, to: \.$director) var directors: [Director]
    
    init() { }
    
    init(id: UUID? = nil, movie_poster: Data, movie_story: String,movie_name: String,movie_duration: Date,
         movie_genres: String,movie_watcher_type: String, movie_IMDb_rate: Double, movie_language: String ) throws {
        
        
        self.id = id
        self.movie_poster = movie_poster
        self.movie_name = movie_name
        self.movie_duration = movie_duration
        self.movie_story = movie_story
        self.movie_genres = movie_genres
        self.movie_watcher_type = movie_watcher_type
        self.movie_IMDb_rate = movie_IMDb_rate
        self.movie_language = movie_language

    }

}


