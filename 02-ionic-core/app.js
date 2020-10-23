const API_URL = `https://devfest-nantes-2018-api.cleverapps.io/blog`;
const IMAGES_URL = `https://devfest2018.gdgnantes.com`;

fetch(API_URL)
    .then(res => res.json())
    .then(posts => 
        {
            const childToPrint = document.getElementById("image");
            console.log(posts)
            childToPrint.src = posts[0].title;
        });