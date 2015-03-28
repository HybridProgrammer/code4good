package org.code4good

class DashboardController {

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Conversation.list(params), model: [conversationInstanceCount: Conversation.count()]
    }
}
