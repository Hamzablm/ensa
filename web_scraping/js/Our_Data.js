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
                "</td> <td> <a href='" + data[i].productUrl +"'> " + data[i].productUrl +"</a>"+
                "</td> <td> <a href='" + data[i].imageUrl +"' target='_blank'><img src='" + data[i].imageUrl + "' alt=" + data[i].name + " /></a></td>  </tr>";
                // "</td> <td> <img src='" + data[i].imageUrl + "' alt=" + data[i].name + " /> </td>  </tr>";

        }

        productContainer.insertAdjacentHTML('beforeend', htmlString);

    }

    $(document).ready(function(){
        $("#MySearch").on("keyup", function() {
            var value = $(this).val().toLowerCase();
            $("#pro tr").filter(function() {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });
    });
    /*
    //todo:sorting by id_product
    $(document).ready(function() {
        $('#pro').DataTable( {
            "Id of Product": [[ 0, "desc" ]] // "0" means First column and "desc" is order type;
        } );
    } );
    var table = $('#pro').DataTable();

    table
        .columns( '.Id of Product' )
        .order( 'desc' )
        .draw();
        */
}


