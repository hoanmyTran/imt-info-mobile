fetch(`https://devfest-nantes-2018-api.cleverapps.io/blog`)
    .then(res => res.json())
    .then(posts => 
        {
            const childToPrint = document.getElementById("image");
            console.log(posts)
            childToPrint.src = posts[0].title;
        });

/*hello = async function() {
    alert('Hello World!');
}
*/