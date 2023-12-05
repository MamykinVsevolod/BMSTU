function formation_table (data) {
    let tableHTML = "<table>"; // Начало таблицы
    if (data.value2[0] == data.value2[1]) {
        if (data.value1[2] != '0') {
            tableHTML +=
                '<tr><td style="border: 2px solid darkblue;"><strong>Введенная последовательность:</strong></td></tr>' +
                '<tr><td style="border: 2px solid darkblue;">' + data.value1[3] + '</td></tr>' +
                '<tr><td style="border: 2px solid darkblue;"><strong>Подпоследовательности:</strong></td></tr>';

            data.value1[0].forEach(function (res) {
                tableHTML += '<tr><td style="border: 2px solid darkblue;">' + res + '</td></tr>';
            });

            tableHTML +=
                '<tr><td style="border: 2px solid darkblue;"><strong>Самая длинная подпоследовательность:</strong></td></tr>' +
                '<tr><td style="border: 2px solid darkblue;">' + data.value1[1] + '</td></tr>' +
                '<tr><td style="border: 2px solid darkblue;"><strong>Ее длина:</strong></td></tr>' +
                '<tr><td style="border: 2px solid darkblue;">' + data.value1[2] + '</td></tr>';
        } else {
            tableHTML +=
                '<tr><td style="border: 2px solid darkblue;"><strong>Введенная последовательность:</strong></td></tr>' +
                '<tr><td style="border: 2px solid darkblue;">' + data.value1[3] + '</td></tr>' +
                '<tr><td style="border: 2px solid darkblue;"><strong>Подполседовательностей квадратов натуральных чисел нет</strong></td></tr>';
        }
    } else {
        tableHTML +=
            '<tr><td style="border: 2px solid darkblue;"><strong>Введенная последовательность:</strong></td></tr>' +
            '<tr><td style="border: 2px solid darkblue;">' + data.value1[3] + '</td></tr>' +
            '<tr><td style="border: 2px solid darkblue;"><strong>Введенное число n:</strong></td></tr>' +
            '<tr><td style="border: 2px solid darkblue;">' + data.value2[0] + '</td></tr>' +
            '<tr><td style="border: 2px solid darkblue;"><strong>Число n не совпадает с длиной введенной последовательности!</strong></td></tr>';
    }

    tableHTML += "</table>"; // Конец таблицы
    return "<hr/>" + tableHTML +  "<hr/><p id='date'>" + Date() + "</p>"
}

function show_result(data) {
    console.log(data);
    const result = document.getElementById("result");
    result.innerHTML = formation_table(data); // Вставляем сформированную таблицу в элемент с id "result"
}

$(document).ready(function () {
    $("#calc_form").bind("ajax:success",
        function (xhr, data, status) {
            // data is already an object
            show_result(data);
        })
});