package clientagency

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/solCat/$site,$metodoPago"(controller: "Form", action: "CargarAgencia")

        "/"(controller: "form")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
