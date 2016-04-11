package Viwer

class ViwerUser {

    String username
    String password
    String ageRange
    List<Movie> history = []
    List<Movie> wantToSee = []

    static constraints = {
        password nullable: true
        ageRange nullable: true
    }

    static hasMany = [
            ratings: Review
    ]
}
