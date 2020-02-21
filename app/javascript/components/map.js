import mapboxgl from 'mapbox-gl';

// const form = document.getElementById("form");
// const results = document.getElementById("results");
mapboxgl.accessToken = 'pk.eyJ1IjoibWFuZG91MTMiLCJhIjoiY2s2MjdnMHl3MGFibTNqbzA5ZWdxMXoweiJ9.z8XxJ16W0uGr-41bTbehkQ';

const mapElement = document.getElementById('map');

const fetchMap = (event) => {
  if (mapElement) {
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mandou13/ck627h7ei0t2j1iqripzazoln',
      center: [5.3522,41.8566],
      zoom: 5
    });

    const addresses = document.querySelectorAll(".pick-up-address");
    console.log(addresses)
    Array.from(addresses).forEach((address) => {
      let input = address.innerText
      var popup = new mapboxgl.Popup({ offset: 25 }).setText(address.innerText);
      console.log(input)
      fetch(`https://api.mapbox.com/geocoding/v5/mapbox.places/${input}.json?access_token=pk.eyJ1IjoibWFuZG91MTMiLCJhIjoiY2s2MjdnMHl3MGFibTNqbzA5ZWdxMXoweiJ9.z8XxJ16W0uGr-41bTbehkQ`)
        .then(response => response.json())
        .then((data) => {
          map.center = data.features[0].center
          new mapboxgl.Marker({color: '#E7055F'})
            .setLngLat(data.features[0].center)
            .setPopup(popup)
            .addTo(map);
        });
    })
  }
};

export { fetchMap };
