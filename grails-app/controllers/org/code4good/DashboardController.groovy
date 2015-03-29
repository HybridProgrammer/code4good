package org.code4good

class DashboardController {

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
//        def conversations = Conversation.findAllByStatus("Open")
        def c = Conversation.createCriteria()
        def conversations = c.list {
            eq("status", "Open")
            order("urgencyLevel", "asc")
            order("dateCreated", "desc")
        }
        [conversationInstanceList: conversations.toList(), conversationInstanceCount: conversations.size()]
    }

    def showHistory(Conversation conversationInstance) {
        [conversationInstance: conversationInstance]
    }
}
