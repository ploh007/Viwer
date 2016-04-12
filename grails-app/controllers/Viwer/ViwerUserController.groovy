package Viwer

class ViwerUserController {

    static scaffold = ViwerUser

    def signUp() {

        ViwerUser newUser = new ViwerUser()

        newUser.setUsername(params.username)
        newUser.setPassword(params.password)
        newUser.setName(params.name)
        newUser.setEmail(params.email)
        newUser.setAgeRange(params.ageRange)

        newUser.save(flush: true, failOnError: true)

        println(ViwerUser.findAll().size() + " users")

        session.user = newUser

        redirect(action: "user")
    }

    def user() {

        ViwerUser u = session.user

        def model = [:]
        model.userName = u.getName()
        model.allTags = MovieTag.findAll()
        render(view: 'user.gsp', model: model)
    }

    def ajax_searchMovies = {

        List<Movie> movies = Movie.findAll()
        def model = [:]
        model.searchResults = []

        movies.each {

            def movieValid = true

            if(params.movieTitle) {
                if(!it.getTitle().toLowerCase().contains((params.movieTitle as String).toLowerCase())) {
                    movieValid = false
                }
            }

            if(movieValid && params.movieTag != "Select a genre") {
                if(!it.getMovieTags().any { tag ->
                    tag.tag == params.movieTag
                }) {
                    movieValid = false
                }
            }

//            if(movieValid && params.movieTag != "Select a rating") {
//
//            }

            if(movieValid && params.year != "Select a year") {
                if(it.dateReleased.toCalendar().get(Calendar.YEAR) != params.year as Integer) {
                    movieValid = false
                }
            }

            if(movieValid) {
                def resultRow = [:]

                //quick metadata
                resultRow.publicId = it.getPublicId()
                resultRow.title = it.getTitle()
                resultRow.posterUrl = it.getPosterUrl()
                resultRow.trailerEmbedUrl = it.getTrailerEmbedUrl()

                //release date
                Calendar releaseCalendar = it.dateReleased.toCalendar()
                resultRow.releaseDate = "${releaseCalendar.get(Calendar.MONTH)} ${releaseCalendar.get(Calendar.DAY_OF_MONTH)}, ${releaseCalendar.get(Calendar.YEAR)}"

                //director
                Person director = it.participants.find { participant ->
                    participant.roleName == Role.DIRECTOR
                }?.getPerson()

                resultRow.director = director ? "${director.firstName} ${director.lastName}" : "No director"

                //producer
                Person producer = it.participants.find { participant ->
                    participant.roleName == Role.PRODUCER
                }?.getPerson()

                resultRow.producer = producer ? "${producer.firstName} ${producer.lastName}" : "No producer"

                //ratings
                resultRow.numRatings = it.reviews.size()
                resultRow.averageRating = it.averageRating()?: "Not enough ratings yet!"

                //get actors and characters
                resultRow.actorRoles = []

                List<Role> actorRoles = it.participants.findAll {
                    it.roleName == Role.ACTOR
                }?.toList()

                if(actorRoles) {
                    actorRoles.each { actorRole ->
                        resultRow.actorRoles << ["actorName":"${actorRole.person.firstName} ${actorRole.person.lastName}", "characterName":actorRole.roleProperties.character]
                    }
                }

                model.searchResults << resultRow
            }
        }

        println(model)
        render(template: "searchResults", model: model)
    }

    def ajax_rateMovie = {
        render "this is dumb"
    }
}