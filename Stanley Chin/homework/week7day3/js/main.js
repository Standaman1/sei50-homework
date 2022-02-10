console.log('main.js loaded');

const FLICKR_API_KEY = '2f5ac274ecfac5a455f38745704ad084';
const FLICKR_BASE_URL = 'https://api.flickr.com/services/rest'


//https://api.flickr.com/services/rest?method=flickr.photos.search&format=json&nojsoncallback=1&text=ocean+coral&api_key=2f5ac274ecfac5a455f38745704ad084

const fetchSearchResults = function(userQuery){
    
    axios.get(FLICKR_BASE_URL, { 
        params: {
            //axios will combine these key-value pairs into the querystring for us
            method: 'flickr.photos.search',
            api_key: FLICKR_API_KEY,
            format: 'json',
            nojsoncallback: 1,
            text: `${userQuery}`
        }
    })
    .then(function(res){
        console.log(res.data.photos);
        renderSearchResults(res.data.photos)
    })
    .catch(function(err){
        console.log('AJAX error, ', err);
    });
};// fetchSearchResults

const renderSearchResults = function(data){

    $('#imagesResults').show();
    $('#imageDetails').hide();

    $('#imagesResults').html(`<p>${data.total} matches found:</p>`)

    console.log(data.photo); //res.data.photos.photo
    let sizeSuffix = 'q'
    
    let photos = '<ul>'
    data.photo.map(function(image){
        
        let photoURL = `https://live.staticflickr.com/${image.server}/${image.id}_${image.secret}_${sizeSuffix}.jpg`
        
        photos +=`
            <li data-photo-id="${image.id}">
            <img src="${photoURL}">
            </li>
        `;
    });

    photos += '</ul>'

    $('#imagesResults').append(photos);

    $('li').on('click', function(){
        const photoID = $(this).data('photo-id');
        console.log('Photo ID clicked: ', photoID);
        fetchPhotoById(photoID);
    });

};// renderSearchResults

const fetchPhotoById = function(id){
    console.log('fetchPhotoById(): ', id);
    axios.get(FLICKR_BASE_URL, { 
        params: {
            method: 'flickr.photos.getInfo',
            api_key: FLICKR_API_KEY,
            format: 'json',
            nojsoncallback: 1,
            photo_id: id
        }
    })
    .then(function(res){
        console.log("What", res.data.photo);
        renderPhotoDetails(res.data.photo);
    })
    .catch(function(err){
        console.log('AJAX error, ', err);
    });
    
};// fetchPhotoById()

const renderPhotoDetails = function(data){
    $('#imagesResults').hide();
    $('#imageDetails').show();
    
    console.log('Photo details: ', data);

    $('#imageDetails').html(`
    
    <img src="https://live.staticflickr.com/${data.server}/${data.id}_${data.secret}_m.jpg">
    <h3>${data.title._content}</h3>
    <p><strong>Date taken: </strong>${data.dates.taken}</p>
    <p><strong>Description: </strong>${data.description._content}</p>
    <button id="backButton">Back to Results</button>
    
    `);

   
    $('#backButton').on('click',function(){
        $('#imageDetails').hide();
        $('#imagesResults').show();
    });

}

$(function(){

    $('#userQuery').focus();
    $('#searchForm').on('submit',function(ev){
        ev.preventDefault(); // prevents page reload after a submit
        console.log('Form submitted!');

        const query = $('#userQuery').val();

        fetchSearchResults(query);

    }); // submit handler


});// DOME request