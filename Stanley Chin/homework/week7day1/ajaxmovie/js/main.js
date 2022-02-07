
const loadMovie = function(){

    console.log("Loaded");

    const xhr = new XMLHttpRequest();

    const userInput = $('#userInput').val();

    xhr.open('GET', `https://api.themoviedb.org/3/search/movie?api_key=24d863d54c86392e6e1df55b9a328755&query=${userInput}`);

    xhr.send();

    xhr.onload = function(){

        const data = JSON.parse(xhr.response);
        console.log('data', xhr.response);
        // console.log('result:'. data.results);


        for (i=0; i<data.results.length; i++){
            
            const movieSelected = data.results[i]
            $('#output').append(`<p> <strong>Title:</strong> ${movieSelected.title} <strong>Popularity:</strong> ${movieSelected.popularity}</p>`);

        }; //for loop for title

    }; //onload()

    
    
    
    
    
}; //loadMovie()
$(function(){


    $('#loadMovie').on('click', function(){

        loadMovie()

    });//inner onclick()


    
});//onclick()