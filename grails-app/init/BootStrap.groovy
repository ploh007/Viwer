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

        Movie starWars = new Movie(title: "Star Wars: Episode VII - The Force Awakens", dateReleased: new Date().clearTime())

        Person georgeLucas = new Person(firstName: "George", lastName: "Lucas")
        georgeLucas.save(flush: true, failOnError: true)
        starWars.addToParticipants(new Role(person: georgeLucas, roleName: Role.PRODUCER))

        Person harrisonFord = new Person(firstName: "Harrison", lastName: "Ford")
        harrisonFord.save(flush: true, failOnError: true)
        starWars.addToParticipants(new Role(person: harrisonFord, roleName: Role.ACTOR, roleProperties: ["character":"Han Solo"]))

        Person markHamil = new Person(firstName: "Mark", lastName: "Hamill")
        markHamil.save(flush: true, failOnError: true)
        starWars.addToParticipants(new Role(person: markHamil, roleName: Role.ACTOR, roleProperties: ["character":"Luke Skywalker"]))

        Person adamDriver = new Person(firstName: "Adam", lastName: "Driver")
        adamDriver.save(flush: true, failOnError: true)
        starWars.addToParticipants(new Role(person: adamDriver, roleName: Role.ACTOR, roleProperties: ["character":"Kylo Ren"]))

        starWars.save(flush: true, failOnError: true)

        Movie lionKing = new Movie(title: "The Lion King", dateReleased: new Date().clearTime())

        Person roger = new Person(firstName: "Roger", lastName: "Allers")
        roger.save(flush: true, failOnError: true)
        lionKing.addToParticipants(new Role(person: roger, roleName: Role.PRODUCER))

        Person matthewB = new Person(firstName: "Matthew", lastName: "Broderick")
        matthewB.save(flush: true, failOnError: true)
        lionKing.addToParticipants(new Role(person: matthewB, roleName: Role.ACTOR, roleProperties: ["character":"Adult Simba"]))

        Person jimCummings = new Person(firstName: "Jim", lastName: "Cummings")
        jimCummings.save(flush: true, failOnError: true)
        lionKing.addToParticipants(new Role(person: jimCummings, roleName: Role.ACTOR, roleProperties: ["character":"Ed"]))

        lionKing.save(flush: true, failOnError: true)

        Movie spiderman = new Movie(title: "Spiderman", dateReleased: new Date().clearTime())

        Person samRaimi = new Person(firstName: "Sam", lastName: "Raimi")
        samRaimi.save(flush: true, failOnError: true)
        spiderman.addToParticipants(new Role(person: samRaimi, roleName: Role.PRODUCER))

        Person tobeyMacguire = new Person(firstName: "Tobey", lastName: "Maguire")
        tobeyMacguire.save(flush: true, failOnError: true)
        spiderman.addToParticipants(new Role(person: tobeyMacguire, roleName: Role.ACTOR, roleProperties: ["character":"Spiderman"]))

        Person willemDafoe = new Person(firstName: "Willem", lastName: "Dafoe")
        willemDafoe.save(flush: true, failOnError: true)
        spiderman.addToParticipants(new Role(person: willemDafoe, roleName: Role.ACTOR, roleProperties: ["character":"Green Goblin"]))

        spiderman.save(flush: true, failOnError: true)

        Movie avengers = new Movie(title: "The Avengers", dateReleased: new Date().clearTime())

        Person jossWhedon = new Person(firstName: "Joss", lastName: "Whedon")
        jossWhedon.save(flush: true, failOnError: true)
        avengers.addToParticipants(new Role(person: jossWhedon, roleName: Role.PRODUCER))

        Person rDowney = new Person(firstName: "Robert", lastName: "Downey Jr.")
        rDowney.save(flush: true, failOnError: true)
        avengers.addToParticipants(new Role(person: rDowney, roleName: Role.ACTOR, roleProperties: ["character":"Iron Mam"]))

        Person cEvans = new Person(firstName: "Chris", lastName: "Evans")
        cEvans.save(flush: true, failOnError: true)
        avengers.addToParticipants(new Role(person: cEvans, roleName: Role.ACTOR, roleProperties: ["character":"Captain America"]))

        avengers.save(flush: true, failOnError: true)

        System.out.println("There are ${Movie.findAll().size()} movies and ${Person.findAll().size()} persons")
    }
    def destroy = {
    }
}
