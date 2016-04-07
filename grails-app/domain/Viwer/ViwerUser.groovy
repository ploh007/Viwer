package Viwer

class ViwerUser {

    String firstName
    String lastName
    String email
    String publicId
    List<Movie> history = []
    List<Movie> wantToSee = []

    static constraints = {

    }

    static hasMany = [
            ratings: Review
    ]

    def beforeInsert() {
        if(!publicId) {
            publicId = "${firstName}:${lastName}:${email}".encodeAsMD5()
        }
    }
}
