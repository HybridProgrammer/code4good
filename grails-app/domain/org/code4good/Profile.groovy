package org.code4good

class Profile {

    static constraints = {
        user nullable: true
        firstName nullable: true
        lastName nullable: true
        email nullable: true
        conversations nullable: true
    }

    static hasMany = [conversations: Conversation]

    String phone
    String firstName
    String lastName
    String email
    List conversations = new ArrayList()

    User user
}
