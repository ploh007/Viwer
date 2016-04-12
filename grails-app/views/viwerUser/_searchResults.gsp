<g:each var="movie" in="${searchResults}">
    <div class="container" id="search_results">
        <div class="col-md-5" id="search_movie">
            <h2 id="search_movie_title">${movie.title}</h2>
            <img src="${movie.posterUrl}">
            <div class="row">
                <button class="btn custom_search_button" data-toggle="modal" data-target="#ratingModal${movie.publicId}">Rate This Movie</button>
                <button class="btn custom_search_button" data-toggle="modal" data-target="#trailerModal${movie.publicId}">View Trailer</button>
            </div>
        </div>
        <div class="col-md-7" id="search_movie_table">

            <h2 id="search_movie_tabletitle2">Movie Details</h2>

            <table class="table table-hover">
                <tbody>

                <tr>
                    <td>Released On</td>
                    <td>${movie.releaseDate}</td>
                </tr>
                <tr>
                    <td>Directed By</td>
                    <td>${movie.director}</td>
                </tr>
                <tr>
                    <td>Produced By</td>
                    <td>${movie.producer}</td>
                </tr>
                <tr>
                    <td>Ratings</td>
                    <td>
                        <g:if test="${movie.averageRating == "Not enough ratings yet!"}">
                            ${movie.averageRating}
                        </g:if>
                        <g:else>
                            <g:each in="${1..Math.round(movie.averageRating as Integer)}">
                                <span class="glyphicon glyphicon glyphicon-star" aria-hidden="true"></span>
                            </g:each>
                            (${movie.numRatings})
                        </g:else>
                    </td>
                </tr>
                </tbody>
            </table>

            <h2 id="search_movie_tabletitle">Casts</h2>

            <table class="table table-hover">
                <thead> <tr> <th>Name</th> <th>Role</th></tr> </thead>
                <tbody>
                    <g:each var="actorRole" in="${movie.actorRoles}">
                        <tr>
                        <td>${actorRole.actorName}</td>
                        <td>${actorRole.characterName}</td>
                    </tr>
                    </g:each>
                </tbody>
            </table>

        </div>
    </div>

    <!-- RATING MODAL -->
    <div class="modal fade" id="ratingModal${movie.publicId}" tabindex="-1" role="dialog" aria-labelledby="ratingModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h3 class="modal-title" id="ratingModalTitle">Rate Movie</h3>
                </div>

                <form onsubmit="return false;" class="form-horizontal">
                    <div class="modal-body">
                        <div class="row">

                            <div class="col-md-12 signUpPromo">
                                <h4>WHAT DID YOU THINK OF THE MOVIE?</h4>
                            </div>
                            <div class="col-md-7">

                                <div class="input-group input-group-sm">
                                    <span class="input-group-addon" id="inputUserNameLabel">Rating</span>
                                    <select class="form-control" id="sel1">
                                        <option selected disabled>Select a rating</option>
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
                                    </select>
                                </div>
                                <p>

                                <div class="input-group input-group-sm">
                                    <span class="input-group-addon" id="inputUserNameLabel">Review</span>
                                    <textarea class="form-control" rows="10" cols="50"></textarea>
                                </div>


                                <div class="ratingFeedback">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button onclick="submitRating('${movie.publicId}');" type="submit" class="btn btn-default" data-dismiss="modal">Rate!</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    </div>
                </form>

            </div>
        </div>
    </div>
    <!-- END RATING MODAL -->


    <!-- RATING MODAL -->
    <div class="modal fade" id="trailerModal${movie.publicId}" tabindex="-1" role="dialog" aria-labelledby="trailerModal">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h3 class="modal-title" id="trailerModal">Movie Trailer</h3>
                </div>

                <form class="form-horizontal">
                    <div class="modal-body">
                        <h5>
                        </h5>
                        <iframe width="560" height="315" src="https://www.youtube.com/embed/${movie.trailerEmbedUrl}" frameborder="0" allowfullscreen></iframe>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </form>

            </div>
        </div>
    </div>
    <!-- END RATING MODAL -->
</g:each>