package Viwer

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

class ViwerUserController {

    static scaffold = ViwerUser

    def signUp() {
        render(text: params)
    }
}
