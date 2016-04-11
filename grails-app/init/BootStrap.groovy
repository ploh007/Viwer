import Viwer.Movie
import Viwer.MovieTag
import Viwer.Person
import Viwer.Role

class BootStrap {

    def init = { servletContext ->
        System.out.println("Setting up movies");

        MovieTag action = new MovieTag(tag: "Action")
        action.save(flush: true)
        MovieTag comedy = new MovieTag(tag: "Comedy")
        comedy.save(flush: true)
        MovieTag suspense = new MovieTag(tag: "Suspense")
        suspense.save(flush: true)

        Movie starWars = new Movie(title: "Star Wars XII", dateReleased: new Date().clearTime())

        Person georgeLucas = new Person(firstName: "George", lastName: "Lucas")
        georgeLucas.save(flush: true, failOnError: true)

        Person harrisonFord = new Person(firstName: "Harrison", lastName: "Ford")
        harrisonFord.save(flush: true, failOnError: true)

        starWars.addToParticipants(new Role(person: georgeLucas, roleName: Role.PRODUCER))
        starWars.addToParticipants(new Role(person: harrisonFord, roleName: Role.ACTOR, roleProperties: ["character":"Han Solo"]))
        starWars.save(flush: true, failOnError: true)

        Movie anotherMovie = new Movie(title: "Paul Loh: The Movie", dateReleased: new Date().clearTime())
        anotherMovie.save(flush: true)

        System.out.println("There are ${Movie.findAll().size()} movies and ${Person.findAll().size()} persons")
    }
    def destroy = {
    }
}
