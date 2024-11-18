/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/*--------------Theater-----------------*/
document.querySelectorAll(".province").forEach(function (provinceLink) {
  provinceLink.addEventListener("click", function (event) {
    event.preventDefault();

    document.querySelectorAll(".province").forEach(function (link) {
      link.classList.remove("selected");
    });
    provinceLink.classList.add("selected");

    document.querySelectorAll(".cinemas-list").forEach(function (list) {
      list.classList.add("hidden");
    });

    const provinceID = provinceLink.getAttribute("data-id");
    document.getElementById(provinceID).classList.remove("hidden");

    // Ẩn danh sách phim hiện tại khi chuyển sang tỉnh mới
    document.querySelectorAll(".filmList").forEach(function (list) {
      list.classList.add("hidden");
    });
  });
});

/*--------------FILMS-----------------*/
document.querySelectorAll(".cinemass").forEach(function (cinemaLink) {
  cinemaLink.addEventListener("click", function (event) {
    event.preventDefault();

    document.querySelectorAll(".cinemass").forEach(function (link) {
            console.log("aaaa")

      link.classList.remove("selected");
    });
    cinemaLink.classList.add("selected");
    console.log("bbb");
    const filmListID = cinemaLink.getAttribute("film-id");

    document.querySelectorAll(".filmList").forEach(function (list) {
      list.classList.add("hidden");
    });
    document.getElementById(filmListID).classList.remove("hidden");
  });
});


