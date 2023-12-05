function show_result(data) {
    console.log(data);
    const result = document.getElementById("result");
    result.innerHTML = "<hr/>Результат: " + 'hui' +
        "<hr/><p id='date'>" + Date() + "</p>";
}

$(document).ready(function () {
    console.log("Вывод данных в консоль");
    $("#calc_form").bind("ajax:success",
        function (xhr, data, status) {
            // data is already an object
            show_result(data);
        })
})