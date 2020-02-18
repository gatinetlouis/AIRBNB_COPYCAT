import mapboxgl from 'mapbox-gl';

// const form = document.getElementById("form");
// const results = document.getElementById("results");
mapboxgl.accessToken = 'pk.eyJ1IjoibWFuZG91MTMiLCJhIjoiY2s2MjdnMHl3MGFibTNqbzA5ZWdxMXoweiJ9.z8XxJ16W0uGr-41bTbehkQ';


const map = new mapboxgl.Map({
  container: 'map',
  style: 'mapbox://styles/mapbox/streets-v9',
  center: [2.3522,48.8566],
  zoom: 5
});

const fetchMap = (event) => {
  event.preventDefault();
  const addresses = document.querySelectorAll(".pick_up_address");
  Array.from(addresses).forEach((address) => {
    let input = address.innerText
    console.log(input)
    fetch(`https://api.mapbox.com/geocoding/v5/mapbox.places/${input}.json?access_token=pk.eyJ1IjoibWFuZG91MTMiLCJhIjoiY2s2MjdnMHl3MGFibTNqbzA5ZWdxMXoweiJ9.z8XxJ16W0uGr-41bTbehkQ`)
      .then(response => response.json())
      .then((data) => {
        map.center = data.features[0].center
        new mapboxgl.Marker()
          .setLngLat(data.features[0].center)
          .addTo(map);
      });
  })
};


const mapElement = document.getElementById('map');

if (mapElement) {
  window.addEventListener("load", fetchMap);
}

export { fetchMap };
