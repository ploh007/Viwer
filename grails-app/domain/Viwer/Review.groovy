package Viwer

class Review {

    double rating
    String review

    static constraints = {
        review nullable: true
    }

    static hasOne = [
            user: ViwerUser,
            movie: Movie
    ]
}
