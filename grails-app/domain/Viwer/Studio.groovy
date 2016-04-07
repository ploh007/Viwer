package Viwer

class Studio {

    String name

    static constraints = {
    }

    static hasMany = [
            movies: Movie
    ]
}
