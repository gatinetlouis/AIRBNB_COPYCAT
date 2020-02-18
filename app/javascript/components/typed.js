import Typed from 'typed.js';


const loadDynamicHomeText = () => {
  const typed = document.getElementById('home-typed-text');
  if (typed) {
    new Typed('#home-typed-text', {
      strings: ["Roubaix", "Sarcelles", "Maubeuge", "Tourcoing", "Fallempin", "Brussel", "Le Mans", "Massy"],
      typeSpeed: 100,
      loop: true
    });
  };
}

export { loadDynamicHomeText };
