function loadUpcomingMovies(type) {
  let pageNumber = Number(localStorage.getItem('pageNumber')) || 1;
  pageNumber = type == 'prev' ? pageNumber - 1 : pageNumber + 1;

  if (pageNumber >= 1) {
    localStorage.setItem('pageNumber', pageNumber);

    window.location.href = `/?page=${pageNumber}`;
  }
}




function showUpcomingMovies() {
  window.location.href = '/upcoming-movies';
}

function loadNowPlayingMovies() {
  window.location.href = '/';
}

function onSearch(event) {
  const value = event.target.value.split(' ').join('-').toLowerCase();
  console.log('value', value);

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
