package Viwer

class ViwerUser {

    String username
    String name
    String email
    String password
    String ageRange
    List<Movie> history = []
    List<Movie> wantToSee = []

    static constraints = {
        password nullable: true
        ageRange nullable: true
    }
}
