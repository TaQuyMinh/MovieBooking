/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var slideIndex = 0;
var slideTimer;

function showSlides() {
    var i;
    var slides = document.getElementsByClassName("slide");
    var dots = document.getElementsByClassName("dot");
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }
    slideIndex++;
    if (slideIndex > slides.length) {
        slideIndex = 1
    }
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex - 1].style.display = "block";
    dots[slideIndex - 1].className += " active";
    clearTimeout(slideTimer);
    slideTimer = setTimeout(showSlides, 4000);
}

function plusSlides(n) {
    slideIndex += n - 1;
    showSlides();
}

function currentSlide(n) {
    slideIndex = n - 1;
    showSlides();
}

showSlides();

/*-----------------FILMS------------------*/
var currentIndex = 0;
var movies = document.getElementById("movies").getElementsByTagName("img");

function showMovies(startIndex) {
   
    var numToShow = 3; // Số phim muốn hiển thị mỗi lần

    // Duyệt qua tất cả các phần tử phim
    for (var i = 0; i < movies.length; i++) {
        if (i >= startIndex && i < startIndex + numToShow) {
            movies[i].style.display = "inline-block"; // Hiển thị phim trong khoảng từ startIndex đến startIndex + numToShow
        } else {
            movies[i].style.display = "none"; // Ẩn các phim khác
        }
    }
}
function prevMovies() {
    if (currentIndex > 0) {
        currentIndex -= 1;
        showMovies(currentIndex);
    }
}

function nextMovies() {
    if (currentIndex + 3 < movies.length) {
        currentIndex += 1;
        showMovies(currentIndex);
    }

}

showMovies(currentIndex);

/*-----------------EVENTS------------------*/
var currentIndexEvent = 0;
var events = document.getElementById("events").getElementsByTagName("img");

function showEvents(startIndex) {
    for (var i = 0; i < events.length; i++) {
        if (i >= startIndex && i < startIndex + 3) {
            events[i].style.display = "inline-block";
        } else {
            events[i].style.display = "none";
        }
    }
}

function prevEvents() {
    if (currentIndexEvent > 0) {
        currentIndexEvent -= 1;
        showEvents(currentIndexEvent);
    }
}

function nextEvents() {
    if (currentIndexEvent + 3 < events.length) {
        currentIndexEvent += 1;
        showEvents(currentIndexEvent);
    }
}

showEvents(currentIndexEvent);