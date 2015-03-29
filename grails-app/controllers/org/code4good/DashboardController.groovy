package org.code4good

import org.apache.commons.lang.time.DateUtils

class DashboardController {
    def grailsApplication
    def notificationService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
//        def conversations = Conversation.findAllByStatus("Open")
        def c = Conversation.createCriteria()
        def conversations = c.list {
            eq("status", "Open")
            order("urgencyLevel", "asc")
            order("dateCreated", "desc")
        }
        notificationService.processNewMessages()
        [conversationInstanceList: conversations.toList(), conversationInstanceCount: conversations.size()]
    }

    def showHistory(Conversation conversationInstance) {
        [conversationInstance: conversationInstance]
    }

    def newConversations(Long maxId) {
        def c = Conversation.createCriteria()
        def conversations = c.list {
            eq("status", "Open")
//            order("urgencyLevel", "asc")
            gt("id", maxId)
//            order("id", "desc")
//            firstResult(maxId)
        }
        notificationService.processNewMessages()
        render(view: "newMessages", model: [conversationInstanceList: conversations.toList(), conversationInstanceCount: conversations.size()])

    }

    def testNewMessage() {
        def profile1 = Profile.findAll().first()
        int twilloMessageID = 100
        Conversation conversation = new Conversation(profile: profile1, status: "Open", urgencyLevel: "Low").save(failOnError: true)


        TwilloMessage twilloMessage11 = new TwilloMessage(isOugoing: false, isSent: false, messageText: "I need help", conversation: conversation, twilloMessageId: "code4good" + twilloMessageID++, sent: DateUtils.addMinutes(new Date(), 7)).save(failOnError: true)
        conversation.addToTwilloMessages(twilloMessage11)
        conversation.save(failOnError: true)

        render "New message created: " + conversation.id
    }

    def testMail() {
        sendMail {
            to grailsApplication.config.org.code4good.default.email
            subject "This is a test"
            body 'How are you?'
        }

        render "email sent"
    }
}
