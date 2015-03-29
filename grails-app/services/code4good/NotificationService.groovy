package code4good

import grails.transaction.Transactional
import org.code4good.Notification
import org.code4good.TwilloMessage

@Transactional
class NotificationService {
    def grailsApplication

    def processNewMessages() {
        def messages = TwilloMessage.findAll()

        messages.each {
            def notificaiton = Notification.findByTwilloMessage(it)
            if(!notificaiton) {
                TwilloMessage message = it
                sendMail {
                    to grailsApplication.config.org.code4good.default.email
                    subject "New message from " + message.conversation.profile.phone
                    body message.messageText
                }
                new Notification(twilloMessage: message).save(failOnError: true)
            }
        }
    }
}
