const url = 'http://localhost:3000';

$(document).ready(function() {
  if (localStorage.getItem('userId')) {
    $('#login').hide();
    $('#logout').show();
  } else {
    $('#logout').hide();
    $('#login').show();
  }

  const headerNavElements = $('.header-nav').children();
  const url = window.location.href;
  const isQueryParamsExist = url.lastIndexOf('?');

  let activeTab = url.substring(url.lastIndexOf('/')+1);

  if (isQueryParamsExist !== -1) {
    activeTab = url.substring(url.lastIndexOf('/')+1, isQueryParamsExist);
  }

  console.log('activeTab', activeTab);

  headerNavElements.each((index, element) => {
    const linkElement = $(element).children();

    if ($(linkElement).hasClass('active')) {
      $(linkElement).toggleClass('active')
    }

    if ($(linkElement).hasClass(activeTab)) {
      $(linkElement).addClass('active')
    }

    if (!activeTab && ($(linkElement).hasClass('home') || $(linkElement).hasClass('admin'))) {
      $(linkElement).addClass('active')
    }
  })
})

function onInputFieldChange(event) {
  if (event.target.value) {
    $(event.target).next().removeClass('toggle');
  } else {
    $(event.target).next().addClass('toggle');
  }
}

function logout() {
  localStorage.removeItem('userId');
  window.location.href = '/';
}

function validateEmail(event) {
  const email = event.target.value;
  const regexExp = /\S+@\S+\.\S+/;
  if (regexExp.test(email)) {
    $(event.target).next().removeClass('toggle');
  } else {
    $(event.target).next().addClass('toggle');
  }
}

function profile() {
  const userId = localStorage.getItem('userId');
  if(!userId){
    window.location.href='/login'
    return;
  }
  window.location.href = `/profile?userId=${userId}`;
}



function updateProfile(event) {
  event.preventDefault();

  const Name = $('#name_field').val();
  const Address = $('#address_field').val();
  const DL_N = $('#DL_field').val();
  const PhoneNumber = $('#phonenumber_field').val();
  const Email = $('#Email_field').val();

  if (!Name || !Address || !DL_N || !PhoneNumber || !Email) {
    alert('Please fill the fields properly');

    return;
  }

  if (!/\S+@\S+\.\S+/.test(Email)) {
    alert('Please enter proper email');

    return
  }

  const userId = localStorage.getItem('userId')
  const user = {userId, Name, Address, DL_N, PhoneNumber, Email};

  $.post(`${url}/update_profile`, user, (res) => {
    if (res?.code === 'ER_DUP_ENTRY') {
      alert('User with these details already exists. Please enter proper details');

      return
    }

    $.get(`${url}/`, (res) => {
      alert('Profile updated successfully');
      const role = localStorage.getItem('userRole')
      if (role === 'employee') {
        const userId = localStorage.getItem('userId');
        window.location.href = `/admin?userId=${userId}`;
      } else {
        window.location.href = '/';
      }
    })
  });
}
class User {
  constructor(user_id, Name, Address,  PhoneNumber, Email, Password, role) {
    this.user_id = user_id;
    this.Name = Name;
    this.Address = Address;
    this.PhoneNumber = PhoneNumber;
    this.Email = Email;
    this.Password = Password;
  }
}

function onConfirmPasswordChange(event) {
  const password = $('#password_field').val();
  const confirmPassword = event.target.value;

  if (password !== confirmPassword) {
    $(event.target).next().addClass('toggle');
  } else {
    $(event.target).next().removeClass('toggle');
  }
}

function signUp(event) {
  event.preventDefault();

  const Name = $('#name_field').val();
  const Address = $('#address_field').val();
  const PhoneNumber = $('#phonenumber_field').val();
  const Email = $('#Email_field').val();
  const Password = $('#password_field').val();
  const confirmPassword = $('#confirm_password_field').val();

  if (!Name && !Address && !PhoneNumber && !Email && !Password) {
    alert('Please fill the fields properly');

    return;
  }

  if (!/\S+@\S+\.\S+/.test(Email)) {
    alert('Please enter proper email');

    return
  }

  if (Password !== confirmPassword) {
    alert('Password and Confirm Password are not same');

    return
  }

  const user = new User ('', Name, Address,  PhoneNumber, Email, Password);

  $.post(`${url}/register`, user, (res) => {
    if (res?.code === 'ER_DUP_ENTRY') {
      alert('User with these details already exists. Please enter proper details');

      return
    }

    window.location.href = '/login';
  });
}

function login(event) {
  event.preventDefault();

  const email = $('#email_field').val();
  const password = $('#password_field').val();

  if (!email && !password) {
    alert('Please fill the fields properly');

    return;
  }

  if (!/\S+@\S+\.\S+/.test(email)) {
    alert('Please enter proper email');

    return
  }

  const loginParams = {email, password};

  $.post(`${url}/loginUser`, loginParams, (res) => {
    if (res?.length > 0) {
      const loggedInUser = res[0];

      if (loggedInUser.password === password) {
        localStorage.setItem('userId', loggedInUser.id);

        console.log('loggedInUser.role', loggedInUser.role);

        if (loggedInUser.role === 'employee') {
          localStorage.setItem('userRole', 'employee');
          window.location.href = `/admin?userId=${loggedInUser.id}`;
        } else {
          localStorage.setItem('userRole', 'customer');
          window.location.href = '/';
        }
      } else {
        alert('Invalid login credentials');
      }
    } else {
      alert('Invalid login credentials');
    }
  });
}




function gotoHome() {
  const role = localStorage.getItem('userRole')
  console.log(0)
   console.log(role, role ==='employee')
  if(role ==='employee'){
    const userId = localStorage.getItem('userId');
    window.location.href =`/admin?userId=${userId}`;
  }else{
  window.location.href='/';
  }
}



function admin_profile() {
  const userId = localStorage.getItem('userId');
  if(!userId){
    window.location.href='/login'
    return;
  }
  window.location.href = `/admin-profile?userId=${userId}`;
}



function createMovie() {
  window.location.href = '/create_movie'
}



function submitCreateMovie(event) {
  event.preventDefault();

  const name = $('#name').val();
  const description = $('#description').val();
  const genre = $('#genre').val();
  const language = $('#language').val();
  const amount = $('#amount').val();
  const imageName = $('#image_name').val();

  if (!name || !description || !genre || !language || !amount || !imageName) {
    alert('Please fill all fields properly');
    return;
  }

  const movie = { name, description, genre, language, amount, imageName };
  console.log(movie);

  $.post(`${url}/create_movie`, movie, (res) => {
    const userId = localStorage.getItem('userId');
    window.location.href = `/admin?userId=${userId}`;

    alert('Created Movie successfully')
  })
}

function getProfile() {
  const userId = localStorage.getItem('userId');

  if(!userId){
    window.location.href='/login'
    return;
  }
  window.location.href = `/profile?userId=${userId}`;
}

function viewMyCustomers() {
  const userId = localStorage.getItem('userId');

  window.location.href = `/customer_profiles`;
}

function deleteMovie(movieId) {
  $.post(`${url}/delete_movie`, { movieId }, (res) => {
    const userId = localStorage.getItem('userId');

    window.location.href = `/admin?userId=${userId}`;
    alert('Deleted Movie successfully')
  })
}
