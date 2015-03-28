package org.code4good

class TwilloMessage {

    static constraints = {
    }

    Date sent
    String twilloMessageId
    Boolean isOugoing
    Boolean isSent

    Conversation conversation
}
