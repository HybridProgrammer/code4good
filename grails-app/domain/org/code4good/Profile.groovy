package org.code4good

class Profile {

    static constraints = {
        user nullable: true
        firstName nullable: true
        lastName nullable: true

    }

    String phone
    String firstName
    String lastName

    User user
}
