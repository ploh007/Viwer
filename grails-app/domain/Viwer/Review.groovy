package Viwer

class Review {

    double rating
    String review
    ViwerUser user

    static constraints = {
        review nullable: true
    }

    static hasOne = [
            movie: Movie
    ]
}
