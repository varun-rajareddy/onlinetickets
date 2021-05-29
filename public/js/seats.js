$(document).ready(function(){
  const container = document.querySelector('.container');
  const seats = document.querySelectorAll('.row .seat:not(.occupied)');
  const count = document.getElementById('count');
  const price = document.getElementById('price');

  const ticketAmountElement = document.getElementById('amount');
  const ticketPrice = Number(ticketAmountElement.innerHTML);

  const populateUI = () => {
    const selectedSeats = JSON.parse(localStorage.getItem('selectedSeats'));

    if (selectedSeats !== null && selectedSeats.length > 0) {
      seats.forEach((seat, index) => {
        if (selectedSeats.indexOf(index) > -1) {
          seat.classList.add('selected');
        }
      });
    }

    if (ticketPrice !== null && selectedSeats) {
      count.innerText = selectedSeats.length;
      price.innerText = selectedSeats.length * +ticketPrice;
    }
  };

  populateUI();

  const updateSelectedSeatsCount = () => {
    const selectedSeats = document.querySelectorAll('.row .selected');
    const allSeats = document.querySelectorAll('.row .seat');

    const seatsIndex = [...selectedSeats].map(seat => [...allSeats].indexOf(seat));

    localStorage.setItem('selectedSeats', JSON.stringify(seatsIndex));

    const selectedSeatsCount = selectedSeats.length;

    count.innerText = selectedSeatsCount;
    price.innerText = selectedSeatsCount * ticketPrice;
  };

  // Seat select event
  container.addEventListener('click', e => {
    if (
      e.target.classList.contains('seat') &&
      !e.target.classList.contains('occupied')
    ) {
      e.target.classList.toggle('selected');

      updateSelectedSeatsCount();
    }
  });
})

function payToReserveMovie(){
  const selectedSeats = localStorage.getItem('selectedSeats');

  if(!selectedSeats){
    alert('Please select seats before proceeding to Payment');
    return
  } else {
    $('#book-movie').hide();
    $('#proceed-payment').show();
  }
}

function onCardNumberInputFieldChange(event) {
  if (event.target.value.length==12) {
    $(event.target).next().removeClass('toggle');
  } else {
    $(event.target).next().addClass('toggle');
  }
}

function onCvvInputFieldChange(event) {
  if (event.target.value.length==3) {
    $(event.target).next().removeClass('toggle');
  } else {
    $(event.target).next().addClass('toggle');
  }
}

function reserveMovie(movieId,theaterId) {
  const cardNumber = $('#card_number_field').val();
  const cvv = $('#cvv_field').val();
  const expiryDate = $('#expiry_date_field').val();

  if (!cardNumber && !cvv && !expiryDate) {
    alert('Please fill details properly');

    return;
  }

  const ticketAmountElement = document.getElementById('amount');
  const ticketPrice = Number(ticketAmountElement.innerHTML);

  const details={
    selectedSeats:localStorage.getItem('selectedSeats'),
    user_id:localStorage.getItem('userId'),
    movie_id:movieId,
    ticket_price:ticketPrice,
    theater_id:theaterId
  };
  $.post(`${url}/reserve`, details, (res) => {
    alert('Tickets reserved successfully');
    localStorage.removeItem('selectedSeats');
    window.location.href='/'
  });
}

function goBack(){
  $('#book-movie').show();
  $('#proceed-payment').hide();
}
