
var url = 

// Fetches Movie Title 
var name = $("h1[itemprop='name']").text();
console.log(name.substring(0,name.indexOf('(')));

// Fetches Movie Year
if($('.nobr').text().indexOf("(") > -1){
	console.log($('.nobr').html().trim().replace('(',"").replace(')',""));
}

// Fetches Directors Name
var dname = $("[itemprop='director']").find("[itemprop='name']").text();
console.log(dname);

// Fetches Casts List

var actorlist = $("#titleCast > table > tbody > tr > td.itemprop > a > span").text();

console.log(actorlist);

var characterlist = 

