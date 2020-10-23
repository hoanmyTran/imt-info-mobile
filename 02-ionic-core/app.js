const API_URL = `https://devfest-nantes-2018-api.cleverapps.io/blog`;
const IMAGE_URL = `https://devfest2018.gdgnantes.com`;

fetch(API_URL)
    .then(res => res.json())
    .then(elements => 
        {
            let list ="";
            for (let i in elements) {
                let element = elements[i];
                console.log(element);
                list += "<ion-card> <img src=\""+IMAGE_URL+element.image+"\" /> <ion-card-header> <ion-card-title>"+element.title+"</ion-card-title></ion-card-header> <ion-card-content>"+element.brief+"</ion-card-content> </ion-card>";
            }
            $("#blog").html(list);
        });