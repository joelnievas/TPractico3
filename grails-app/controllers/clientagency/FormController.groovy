package clientagency

import grails.converters.JSON
import groovy.json.JsonSlurper

class FormController {

    def index() { }

    def CargarAgencia(){

        def site = params.site_id
        def metodoPago = params.payment_method_id
        /*def latitud = params.latitud
        def longitud = params.longitud
        def distancia = params.distancia
        def limite = params.limite
        def offset = params.offset
        def orden = params.orden*/
        
        def url = new URL("https://localhost:4567/agencias?site_id=$site&payment_method_id=$metodoPago")
        def connection = (HttpURLConnection) url.openConnection()
        connection.setRequestMethod("GET")
        connection.setRequestProperty("Accept", "application/json")
        connection.setRequestProperty("User-Agent", "Mozilla/5.0")
        JsonSlurper json = new JsonSlurper()
        def agencias = json.parse(connection.getInputStream())
        render agencias as JSON

    }
}
