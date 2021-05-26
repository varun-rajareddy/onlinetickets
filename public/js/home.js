function loadMovies(type) {
  let pageNumber = Number(localStorage.getItem('pageNumber')) || 1;
  pageNumber = type == 'prev' ? pageNumber - 1 : pageNumber + 1;

  if (pageNumber >= 1) {
    localStorage.setItem('pageNumber', pageNumber);

    window.location.href = `/?page=${pageNumber}`;
  }
}

function loadUpcomingMovies(type) {
  let pageNumber = Number(localStorage.getItem('pageNumber')) || 1;
  pageNumber = type == 'prev' ? pageNumber - 1 : pageNumber + 1;

  if (pageNumber >= 1) {
    localStorage.setItem('pageNumber', pageNumber);

    window.location.href = `/upcoming-movies?page=${pageNumber}`;
  }
}

function showUpcomingMovies() {
  localStorage.setItem('pageNumber', 1);
  window.location.href = '/upcoming-movies';
}

function loadNowPlayingMovies() {
  window.location.href = '/';
}

$(document).ready(function(){
  filterSelection('all')

  $("#search").on("keyup", function() {
    const value = $(this).val().split(' ').join('-').toLowerCase();

    const movies = document.getElementsByClassName("movie-list");

    for (let i = 0; i < movies.length; i++) {
      w3RemoveClass(movies[i], "show");
      if (movies[i].className.includes(value)) {
        w3RemoveClass(movies[i], "hide");
        w3AddClass(movies[i], "show");
      } else {
        w3RemoveClass(movies[i], "show");
        w3AddClass(movies[i], "hide");
      }
    }

    displayNoResults();
  });
});

function displayNoResults(){
  $('#movies-container').children().remove('p');
  if($('.filterDiv.show').length===0){
    const pEle = document.createElement('p');
    pEle.innerHTML='No Results Found';
    pEle.style='padding:50px';
    $('#movies-container')[0]?.appendChild(pEle);

    $('#nav-buttons').hide();
  }
}

function filterSelection(c) {
  console.log(c);
  if (!c) return;

  var x, i;
  x = document.getElementsByClassName("filterDiv");
  if (c == "all") c = "";
  for (i = 0; i < x.length; i++) {
    w3RemoveClass(x[i], "show");
    if (x[i].className.indexOf(c) > -1) w3AddClass(x[i], "show");
  }

  displayNoResults();
}

function w3AddClass(element, name) {
  var i, arr1, arr2;
  arr1 = element.className.split(" ");
  arr2 = name.split(" ");
  for (i = 0; i < arr2.length; i++) {
    if (arr1.indexOf(arr2[i]) == -1) {element.className += " " + arr2[i];}
  }
}

function w3RemoveClass(element, name) {
  var i, arr1, arr2;
  arr1 = element.className.split(" ");
  arr2 = name.split(" ");
  for (i = 0; i < arr2.length; i++) {
    while (arr1.indexOf(arr2[i]) > -1) {
      arr1.splice(arr1.indexOf(arr2[i]), 1);
    }
  }
  element.className = arr1.join(" ");
}
