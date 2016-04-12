<html lang="en">

<!-- HEAD COMPONENT -->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">
    <title>Viwer | User</title>

    <!-- CSS -->
    <asset:stylesheet src="paul/animate.css"/>
    <asset:stylesheet src="paul/bootstrap.min.css"/>
    <asset:stylesheet src="paul/homepage.css"/>
    <asset:stylesheet src="paul/browse.css"/>

    <!-- JS SCRIPTS -->
    <asset:javascript src="paul/jquery-1.11.3.min.js"/>
    <asset:javascript src="paul/bootstrap.min.js"/>
    <asset:javascript src="paul/jquery.scrollTo.min.js"/>

    <!-- FONTS -->
    <link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>

    <script>
        $(function() {

            $("#search-movies-btn").click(function(event){

                event.preventDefault();

                //get variables
                var movieTitle = $("#search-form-movie-title").val();
                var movieTag = $("#search-form-movie-tag").val();
                var rating = $("#search-form-rating").val();
                var year = $("#search-form-year").val();

                $.post("/viwerUser/ajax_searchMovies", { movieTitle: movieTitle, movieTag: movieTag, rating:rating, year:year }, function(data) {
                    console.log(data);
                    $("#insertSearchResults").html(data);
                });
            });

        });

        function submitRating(moviePublicId) {

            var $modal = $('#ratingModal'+moviePublicId);
            var rating = $modal.find('select').find(":selected").text();
            var reviewText = $modal.find('textarea')[0].value;

            $.post("/viwerUser/ajax_rateMovie", { publicId:moviePublicId, rating:rating, reviewText:reviewText }, function(data) {
                console.log(data);
            });
        }
    </script>

</head>
<!-- END HEAD COMPONENT -->


<!-- BODY COMPONENT -->
<body>


<!-- NAVBAR COMPONENT -->
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/">VIWER</a>
        </div>

        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="#"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Home</a>
                </li>
                <li>
                    <a href="#"><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span> Locations</a>
                </li>
                <li>
                    <a href="#"><span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span> About</a>
                </li>
                <li>
                    <a href="#"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span> Contact</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<!-- END NAVBAR COMPONENT -->

<!-- MAINJUMBOTRON COMPONENT -->
<div class="jumbotron" id="browse_jumbotron">
    <div class="container" >

        <h3><span class="glyphicon glyphicon-user" aria-hidden="true"></span> ${userName} </h3>

        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span> Recommended</a></li>
            <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-search" aria-hidden="true"></span> Search</a></li>
            <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> Profile</a></li>
            <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span> Settings</a></li>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="home">
                <h3 class="panel_description">Recommended movies for you</h3>
                <div class="col-md-2" id="recommended_movie">
                    <div id="recommended_movie_image">
                        <asset:image src="/paul/whatsnew_1.png"/>
                    </div>
                    <div id="recommended_movie_text">Recommended1</div>
                </div>

                <div class="col-md-2" id="recommended_movie">
                    <div id="recommended_movie_image">
                        <asset:image src="paul/whatsnew_2.png"/>
                    </div>
                    <div id="recommended_movie_text">Recommended2</div>
                </div>

                <div class="col-md-2" id="recommended_movie">
                    <div id="recommended_movie_image">
                        <asset:image src="paul/whatsnew_3.png"/>
                    </div>
                    <div id="recommended_movie_text">Recommended3</div>
                </div>

                <div class="col-md-2" id="recommended_movie">
                    <div id="recommended_movie_image">
                        <asset:image src="paul/whatsnew_4.png"/>
                    </div>
                    <div id="recommended_movie_text">Recommended4</div>
                </div>
                <div class="col-md-2" id="recommended_movie">
                    <div id="recommended_movie_image">
                        <asset:image src="paul/whatsnew_5.png"/>
                    </div>
                    <div id="recommended_movie_text">Recommended5</div>
                </div>

                <div class="col-md-2" id="recommended_movie">
                    <div id="recommended_movie_image">
                        <asset:image src="paul/whatsnew_6.png"/>
                    </div>
                    <div id="recommended_movie_text">Recommended6</div>
                </div>
            </div>

            <div role="tabpanel" class="tab-pane" id="profile">

                <h3 class="panel_description">My Profile Reports</h3>

                <form class="form-horizontal">

                    <div class="form-group">
                        <label for="exampleInputName2" class="col-sm-2 control-label">Search Reports </label>
                        <div class="col-sm-5">
                            <select class="form-control" id="sel1">
                                <option selected disabled>Select a report</option>
                                <option>My Rated Movies</option>
                                <option>My Most Rated Movies</option>
                                <option>My Profile Information</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-primary custom_search_button">Search My Reports</button>
                        </div>
                    </div>

                </form>
            </div>

            <div role="tabpanel" class="tab-pane" id="messages">
                <h3 class="panel_description">Search Across our movies database</h3>
                <div class="panel-body">

                    <form class="form-horizontal">

                        <div class="form-group">
                            <label for="exampleInputName2" class="col-sm-2 control-label">Movie Title </label>
                            <div class="col-sm-5">
                                <input id="search-form-movie-title" type="text" class="form-control" placeholder="Movie Title">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="exampleInputName2" class="col-sm-2 control-label">Movie Genre </label>
                            <div class="col-sm-5">
                                <select id="search-form-movie-tag" class="form-control">
                                    <option selected>Select a genre</option>
                                    <g:each var="tag" in="${allTags}">
                                        <option>${tag.tag}</option>
                                    </g:each>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="exampleInputName2" class="col-sm-2 control-label">Movie Rating </label>
                            <div class="col-sm-5">
                                <select id="search-form-rating" class="form-control">
                                    <option selected>Select a rating</option>
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="exampleInputName2" class="col-sm-2 control-label">Movie Year </label>
                            <div class="col-sm-5">
                                <select id="search-form-year" class="form-control">
                                    <option selected>Select a year</option>
                                    <option>2005</option>
                                    <option>2006</option>
                                    <option>2007</option>
                                    <option>2008</option>
                                    <option>2009</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-3">
                                <button id="search-movies-btn" type="submit" class="btn btn-primary custom_search_button">Search Movie Database</button>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane" id="settings">

            </div>
        </div>




    </div>
</div>
<!-- END MAINJUMBOTRON COMPONENT -->

<!-- DISPLAY USER REQUESTED DATA -->
<div id="insertSearchResults">

</div>

</body>
<!-- END BODY COMPONENT -->




<!-- FOOTER COMPONENT -->
<footer>
    <div> CSI 2132 © 2016. Joshua Saunders || Paul Loh </div>
    <!-- <div id="scroll-top">Go To Top</div> -->
</footer>
<!-- END FOOTER COMPONENT -->

</html>

