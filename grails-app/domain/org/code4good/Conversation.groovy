package org.code4good

class Conversation {

    static constraints = {
        twilloMessages nullable: true
        owner nullable: true
    }

    static hasMany = [twilloMessages: TwilloMessage]

    Date dateCreated
    Date lastUpdated
    List twilloMessages = new ArrayList()
    Profile profile
    User owner

    String status

    String urgencyLevel



}
