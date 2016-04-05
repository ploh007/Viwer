package Viwer

class Role {

    public static final String ACTOR = "actor"
    public static final String PRODUCER = "producer"

    Person person
    String roleName //producer, etc.
    String prefix //vice, senior, junior, etc.
    String suffix //camera rig (1) <- suffix
    Map roleProperties = [:] //store information like character name

    static constraints = {
        prefix nullable: true
        suffix nullable: true
    }

    static hasOne = [
            movie: Movie
    ]

    String getFullRoleName() {
        String result = ""
        if(prefix) {
            result = "${prefix} "
        }
        result = result + roleName
        if(suffix) {
            result = result + " ${suffix}"
        }
        return result
    }
}
