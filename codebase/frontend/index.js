'use strict'

const header = document.querySelector('h1');

fetch('http://colourBackend:5000/colour').then((response) => {
    response.text().then((data) => {
        header.style.color = data;
    })
})
