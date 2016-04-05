import Viwer.Movie
import Viwer.Person
import Viwer.Role

class BootStrap {

    def init = { servletContext ->
        System.out.println("Setting up movies");

        Movie starWars = new Movie(title: "Star Wars XII", dateReleased: new Date().clearTime())

        Person georgeLucas = new Person(firstName: "George", lastName: "Lucas")
        georgeLucas.save(flush: true, failOnError: true)

        Person harrisonFord = new Person(firstName: "Harrison", lastName: "Ford")
        harrisonFord.save(flush: true, failOnError: true)

        starWars.addToParticipants(new Role(person: georgeLucas, roleName: Role.PRODUCER))
        starWars.addToParticipants(new Role(person: harrisonFord, roleName: Role.ACTOR, roleProperties: ["character":"Han Solo"]))
        starWars.save(flush: true, failOnError: true)

        System.out.println("There are ${Movie.findAll().size()} movies and ${Person.findAll().size()} persons")
    }
    def destroy = {
    }
}
