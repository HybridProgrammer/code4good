package org.code4good

class DashboardController {

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def conversations = Conversation.findAllByStatus("Open")
        [conversationInstanceList: conversations.toList(), conversationInstanceCount: conversations.size()]
    }

    def showHistory(Conversation conversationInstance) {
        def max = 10
        params.max = Math.min(max ?: 10, 100)
        params.conversation = conversationInstance
        respond TwilloMessage.list(params), model: [twilloMessageInstanceCount: TwilloMessage.count()]
    }
}
