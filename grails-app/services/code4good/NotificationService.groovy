package code4good

import grails.transaction.Transactional
import org.code4good.Notification
import org.code4good.TwilloMessage
import org.code4good.User

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
                randomServiceWorkerAssignments(message)
            }
        }


    }

    def randomServiceWorkerAssignments(TwilloMessage message) {
        Random r = new Random(new Date().getTime())
        def assignment = r.nextInt(4)

        if(assignment > 1 && assignment <= 3) {
            message.conversation.owner = User.get(assignment)
            message.save(failOnError: true)
        }


    }
}
