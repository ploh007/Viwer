package Viwer

class Movie {

    String publicId = ""
    String title
    String posterUrl
    String trailerEmbedUrl = "Wji-BZ0oCwg"
    Date dateReleased

    static constraints = {
        participants nullable: true
        reviews nullable: true
        posterUrl nullable: true
        trailerEmbedUrl nullable: true
    }

    static belongsTo = Studio

    static hasMany = [
            participants: Role,
            reviews: Review,
            producers: Studio,
            movieTags: MovieTag
    ]

    def beforeInsert() {
        publicId = "${title}:${dateReleased.toGMTString()}".encodeAsMD5()
    }

    def averageRating() {

        if(!reviews || reviews.size() == 0) {
            return null
        }

        int totalRating = 0
        reviews.each {
            totalRating += it.rating
        }
        return totalRating / reviews.size()
    }
}
