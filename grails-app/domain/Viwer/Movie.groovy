package Viwer

class Movie {

    String publicId = ""
    String title
    Date dateReleased

    static constraints = {
        participants nullable: true
        reviews nullable: true
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
}
