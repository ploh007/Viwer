package Viwer

class Movie {

    String title
    Date dateReleased

    static constraints = {
        participants nullable: true
    }

    static hasMany = [
            participants: Role
    ]
}
