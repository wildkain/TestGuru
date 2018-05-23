document.addEventListener('turbolinks:load', function () {
    var timer_div = document.querySelector('#timer');

    if (timer_div) {

    var countdown = setInterval(function () {
        var form = document.querySelector('form');
        var time_end = document.querySelector('#timer').dataset.timerCount;
        var time_now = new Date().getTime();

        var timeCounter = (time_end * 1000) - (time_now);


        var minutes = Math.floor((timeCounter % (1000 * 60 * 60)) / (1000 * 60));
        var seconds = Math.floor((timeCounter % (1000 * 60)) / 1000);

        timer_div.children[0].innerHTML = minutes;
        timer_div.children[1].innerHTML = ":"+seconds;


        if (timeCounter < 0) {
            clearInterval(countdown);
            timer_div.innerHTML = "EXPIRED";
            form.submit();
        }

    }, 1000)
}
});