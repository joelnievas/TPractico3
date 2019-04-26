<%--
  Created by IntelliJ IDEA.
  User: jnievas
  Date: 2019-04-26
  Time: 10:18
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <meta name="layout" content="main"/>
    <title>Form</title>
</head>

<body>
    <h1 style="text-align: center">Agencias de Pago </h1>

<form method="get">
        <div class="form-group">
            <label for="Latitud">LATITUD</label>
            <input type="text" class="form-control" id="Latitud" placeholder="-35.512311">
        </div>
        <div class="form-group">
            <label for="Longitud">LONGITUD</label>
            <input type="text" class="form-control" id="Longitud" placeholder="-42.847293">
        </div>
        <div class="form-group">
            <label for="Distancia">Distancia</label>
            <input type="text" class="form-control" id="Distancia" placeholder="300">
        </div>
        <div class="form-group">
            <label for="Limite">Cantidad de resultados</label>
            <input type="text" class="form-control" id="Limite" placeholder="20">
        </div>
        <div class="form-group">
            <label for="Offset">Saltear Resultados</label>
            <input type="text" class="form-control" id="Offset" placeholder="3">
        </div>
        <div class="form-group">
            <label for="MetodoPago">Metodo de pago</label>
            <input type="text" class="form-control" id="MetodoPago" placeholder="rapipago">
        </div>
        <div class="form-group">
            <label for="Site">Sitio</label>
            <input type="text" class="form-control" id="Site" placeholder="MLA">
        </div>

        <div class="form-group">
            <label for="Orden">Metodo de Orden</label>
            <select class="form-control" id="Orden">
                <option>DISTANCE</option>
                <option>ADDRESS_LINE</option>
                <option>AGENCY_CODE</option>
            </select>
        </div>

    <input style="float: right" type="button" onclick="Solicitar()" value="Solicitar"></input>



</form>


<script>
    function Solicitar() {
        var site = document.getElementById("Site").value;
        var metodoPago = document.getElementById("MetodoPago").value;
        var latitud = document.getElementById("Latitud").value;
        var longitud = document.getElementById("Longitud").value;
        var distancia = document.getElementById("Distancia").value;
        var limite = document.getElementById("Limite").value;
        var offset = document.getElementById("Offset").value;
        var orden = document.getElementById("Orden").value;


        var near_to = (latitud+","+longitud+","+distancia).toString();

        var URL = "${createLink(controller: 'Form', action: 'CargarAgencia', params: [site_id: ""])}"+site+
            "&payment_method_id="+metodoPago/*+"&near_to="+near_to+"&limit="+limite+"&offset="+offset+"&order_by="+orden*/;
        console.log(URL);

        $.ajax({
            url: URL,
            success: function(resp){
                // var cat_head = document.getElementById("category_head");
                // console.log(site);
                // console.log(resp.data)
                var val = resp.data
                // cat_head.innerText = resp.name;
                var subcats_element = document.getElementById("data2");
                while(subcats_element.firstChild){
                    subcats_element.removeChild(subcats_element.firstChild);
                }
                var col_div = document.createElement("div");
                col_div.setAttribute("class", "col-md-4");
                var intro = document.createElement("P");
                intro.innerText = "Agencias cercanas: ";
                intro.style = "display: block; font-size: 24px";
                col_div.appendChild(intro);
                val.forEach(function(data){
                    var inicio = document.createElement("P");
                    inicio.innerText = "Agencia: ";
                    var dire = document.createElement("P");
                    dire.innerText = data.address.address_line;
                    var ciudad = document.createElement("P");
                    ciudad.innerText = data.address.city;
                    var pais = document.createElement("P");
                    pais.innerText = data.address.country;
                    var texto4 = document.createElement("br");
                    inicio.style = "display: block; font-size: 14px";
                    dire.style = "display: block; font-size: 12px";
                    ciudad.style = "display: block; font-size: 10px";
                    pais.style = "display: block; font-size: 10px";

                    // console.log(data.address);
                    // console.log(data.address.address_line);

                    col_div.appendChild(inicio);
                    col_div.appendChild(dire);
                    col_div.appendChild(ciudad);
                    col_div.appendChild(pais);
                    col_div.appendChild(texto4)


                });
                subcats_element.appendChild(col_div)
            }
        })




        /*$.ajax({
            //url: "/Client/CargarAgencia/",
            url:"/solCat/",
            type: 'GET',
            dataType: 'json',
            data: {
                site_id: site,
                payment_method_id: metodoPago
                near_to: near_to,
                limit: limite,
                offset: offset,
                order_by: orden

            },
            success:function (json) {
                json = JSON.stringify(json);
                json = JSON.parse(json);
            }
        });*/
    }


</script>
</body>
</html>