const searchAlgoliaPlaces = (event) => {
  console.log(event)
  fetch("https://places-dsn.algolia.net/1/places/query", {
    method: "POST",
    body: JSON.stringify({ query: event.currentTarget.value })
  })
    .then(response => response.json())
    .then((data) => {
      console.log(data.hits); // Look at local_names.default
    });
};

const input = document.querySelector("#search");
input.addEventListener("keyup", searchAlgoliaPlaces);



var placesAutocomplete = places({
    appId: '<YOUR_PLACES_APP_ID>',
    apiKey: '<YOUR_PLACES_API_KEY>',
    container: document.querySelector('#search')
  });

  var $address = document.querySelector('#address-value')
  placesAutocomplete.on('change', function(e) {
    $address.textContent = e.suggestion.value
  });

  placesAutocomplete.on('clear', function() {
    $address.textContent = 'none';
  });



export { searchAlgoliaPlaces };
