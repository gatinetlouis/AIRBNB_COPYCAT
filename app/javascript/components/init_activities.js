const activitiesCollapse = () => {
  const btnTrips = document.getElementById('btn-trips');
  const btnRenters = document.getElementById('btn-renters');
  const trips = document.querySelector('.trips');
  const renters = document.querySelector('.renters');

  if (btnRenters) {
    btnRenters.addEventListener('click', (event) => {
      btnTrips.classList.remove('active');
      btnRenters.classList.add('active');
      trips.classList.add('d-none');
      renters.classList.remove('d-none');
    });
  }

  if (btnTrips) {
    btnTrips.addEventListener('click', (event) => {
      btnTrips.classList.add('active');
      btnRenters.classList.remove('active');
      renters.classList.add('d-none');
      trips.classList.remove('d-none');
    });
  }
}

export { activitiesCollapse };
