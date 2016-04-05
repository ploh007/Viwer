package Viwer

class User {

    String firstName
    String lastName
    String email
    String publicId

    static constraints = {

    }

    def beforeInsert() {
        if(!publicId) {
            publicId = "${firstName}:${lastName}:${email}".encodeAsMD5()
        }
    }
}
