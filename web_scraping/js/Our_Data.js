/*

    var pageCounter = 1;
    var productContainer = document.getElementById("pro");
    var btn = document.getElementById("btn");


    btn.addEventListener("click", function () {

        var ourRequest = new XMLHttpRequest();
        ourRequest.open('GET', './response.json');
        //ourRequest.open('GET', 'http://localhost:8080/api/products' + pageCounter + '.json');
        ourRequest.onload = function () {
            if (ourRequest.status >= 200 && ourRequest.status < 400) {
                var ourData = JSON.parse(ourRequest.responseText);
                // renderHTML(ourData);
                console.log(ourData[2]);
            } else {
                console.log("We connected to the server, but it returned an error.");
            }

        };

        ourRequest.onerror = function () {
            console.log("Connection error");
        };
        /!*
            ourRequest.send();
            pageCounter++;
            if (pageCounter > 3) {
                btn.classList.add("hide-me");
            }

         *!/
    });


    function renderHTML(data) {
        var htmlString = "";

        for (i = 0; i < data.length; i++) {
            htmlString += "<tr> <th scope=\"row\">" + i +
                "<td>" + data[i].id +
                "</td> <td>" + data[i].name +
                "</td> <td>" + data[i].sales +
                "</td> <td>" + data[i].rating +
                "</td> <td>" + data[i].date +
                "</td> <td>" + data[i].price +
                "</td> <td>" + data[i].category.name +
                "</td> <td>" + data[i].store.name +
                "</td> <td>" + data[i].productUrl +
                "</td> <td> <img src='" + data[i].imageUrl + "' alt=" + data[i].name + " /> </td>  </tr>";

        }

        productContainer.insertAdjacentHTML('beforeend', htmlString);
    }
}
*/
window.onload= function () {
    var pageCounter = 1;
    var productContainer = document.getElementById("pro");
    var btn = document.getElementById("btn");

    btn.addEventListener("click", function () {
        var xhr = new XMLHttpRequest();
        xhr.open('GET', 'https://gist.githubusercontent.com/abdennacerelmaalem/4df54e212f8bbbb3763029dfdb84f873/raw/67a1fdca2a8b5d5fc5b07d53814c7d6b402d06a7/jsont_test.json');
        xhr.onload = function () {
            if (xhr.status >= 200 && xhr.status < 400) {
                var ourData = JSON.parse(xhr.responseText);
                renderHTML(ourData);
                // console.log(this)
            }else {
            console.log("We connected to the server, but it returned an error.");
        }
            xhr.onerror = function () {
                console.log("Connection error");
            };

        }
        xhr.send();

        pageCounter++;
        if (pageCounter > 3) {
            btn.classList.add("hide-me");

        }

    });

    function renderHTML(data) {
        var htmlString = "";

        for (i = 0; i < data.length; i++) {
            htmlString += "<tr> <th scope=\"row\">" + i +
                "<td>" + data[i].id +
                "</td> <td>" + data[i].name +
                "</td> <td>" + data[i].sales +
                "</td> <td>" + data[i].rating +
                "</td> <td>" + data[i].date +
                "</td> <td>" + data[i].price +
                "</td> <td>" + data[i].category.name +
                "</td> <td>" + data[i].store +
                "</td> <td>" + data[i].productUrl +
                "</td> <td> <img src='" + data[i].imageUrl + "' alt=" + data[i].name + " /> </td>  </tr>";

        }

        productContainer.insertAdjacentHTML('beforeend', htmlString);

    }
}


