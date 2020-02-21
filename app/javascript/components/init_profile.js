const profileCollapse = () => {
  const btnCars = document.getElementById('btn-cars');
  const btnReviews = document.getElementById('btn-reviews');
  const cars = document.querySelector('.cars');
  const reviews = document.querySelector('.reviews');

  if (btnReviews) {
    btnReviews.addEventListener('click', (event) => {
      btnCars.classList.remove('active');
      btnReviews.classList.add('active');
      cars.classList.add('d-none');
      reviews.classList.remove('d-none');
    });
  }

  if (btnCars) {
    btnCars.addEventListener('click', (event) => {
      btnCars.classList.add('active');
      btnReviews.classList.remove('active');
      reviews.classList.add('d-none');
      cars.classList.remove('d-none');
    });
  }
}

export { profileCollapse };
