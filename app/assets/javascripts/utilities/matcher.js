document.addEventListener('turbolinks:load', function () {
    var confirmation  = document.querySelector('#user_password_confirmation')
    if (confirmation) { confirmation.addEventListener('keyup', matcherFunction)}
})

function matcherFunction() {

    var password = document.querySelector('#user_password')
    var confirmation  = document.querySelector('#user_password_confirmation')


    if (password.value === confirmation.value ) {
        document.querySelector('.octicon-check').classList.remove('hide');
        document.querySelector('.octicon-x').classList.add('hide')

    } else {

        document.querySelector('.octicon-x').classList.remove('hide');
        document.querySelector('.octicon-check').classList.add('hide');
    }



    if (confirmation.value === "" || password.value === null) {
        document.querySelector('.octicon-x').classList.add('hide');
        document.querySelector('.octicon-check').classList.add('hide');
    }

}