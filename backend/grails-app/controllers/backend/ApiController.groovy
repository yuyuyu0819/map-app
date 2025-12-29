package backend

class ApiController {
    def hello() {
        render(text: "Hello from Grails API", contentType: "text/plain")
    }
}
