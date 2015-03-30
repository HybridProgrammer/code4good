import org.apache.commons.lang.time.DateUtils
import org.code4good.Conversation
import org.code4good.Notification
import org.code4good.Profile
import org.code4good.Role
import org.code4good.Schedule
import org.code4good.TwilloMessage
import org.code4good.User
import org.code4good.UserRole

class BootStrap {
    public static final int MAX_RANDOM_INT = 10
    def springSecurityService

    def init = { servletContext ->
        // Enables access to form Submittions /appname/student/create etc
        def userRole = Role.findByAuthority('ROLE_USER') ?: new Role(authority: 'ROLE_USER').save(failOnError: true)

        // Enables access to everything
        def adminRole = Role.findByAuthority('ROLE_ADMIN') ?: new Role(authority: 'ROLE_ADMIN').save(failOnError: true)

        def adminUser = User.findByUsername('admin') ?: new User(
                username: 'admin',
                //password: springSecurityService.encodePassword('admin'),
                password: 'admin',
                enabled: true).save(failOnError: true)

        if (!adminUser.authorities.contains(adminRole)) {
            UserRole.create adminUser, adminRole
        }

        log.info "Created user admin/admin."


        def user = User.findByUsername('John Smith') ?: new User(
                username: 'John Smith',
                //password: springSecurityService.encodePassword('admin'),
                password: 'socialworker1',
                enabled: true).save(failOnError: true)

        if (!user.authorities.contains(userRole)) {
            UserRole.create user, userRole
        }

        def user2 = User.findByUsername('Jane Tayler') ?: new User(
                username: 'Jane Tayler',
                //password: springSecurityService.encodePassword('admin'),
                password: 'socialworker2',
                enabled: true).save(failOnError: true)

        if (!user2.authorities.contains(userRole)) {
            UserRole.create user, userRole
        }

        int twilloMessageID = 0
        Random random = new Random()

        def profile1 = Profile.findByPhone("555-555-5555") ?: new Profile(phone: "555-555-5555").save(failOnError: true)
        def profile2 = Profile.findByPhone("555-555-5556") ?: new Profile(phone: "555-555-5556").save(failOnError: true)
        def profile3 = Profile.findByPhone("111-111-1111") ?: new Profile(phone: "111-111-1111").save(failOnError: true)

        Conversation conversation = new Conversation(profile: profile1, status: "Open", urgencyLevel: "Low").save(failOnError: true)


        TwilloMessage twilloMessage11 = new TwilloMessage(isOugoing: false, isSent: false, messageText: "I need help", conversation: conversation, twilloMessageId: "code4good" + twilloMessageID++, sent: DateUtils.addMinutes(new Date(), random.nextInt(MAX_RANDOM_INT))).save(failOnError: true)
        TwilloMessage twilloMessage21 = new TwilloMessage(isOugoing: false, isSent: false, messageText: "How do you cook ramen?", conversation: conversation, twilloMessageId: "code4good" + twilloMessageID++, sent: DateUtils.addMinutes(new Date(), random.nextInt(MAX_RANDOM_INT))).save(failOnError: true)
//        TwilloMessage twilloMessage2_1 = new TwilloMessage(isOugoing: true, isSent: true, messageText: "Please checkout goo.gl/Y8WXm9", conversation: conversation, twilloMessageId: "code4good" + twilloMessageID++, sent: DateUtils.addMinutes(new Date(), random.nextInt(MAX_RANDOM_INT))).save(failOnError: true)
//        TwilloMessage twilloMessage2_2 = new TwilloMessage(isOugoing: false, isSent: false, messageText: "Thanks!", conversation: conversation, twilloMessageId: "code4good" + twilloMessageID++, sent: DateUtils.addMinutes(new Date(), random.nextInt(MAX_RANDOM_INT))).save(failOnError: true)
        conversation.addToTwilloMessages(twilloMessage11)
        conversation.addToTwilloMessages(twilloMessage21)
//        conversation.addToTwilloMessages(twilloMessage2_1)
//        conversation.addToTwilloMessages(twilloMessage2_2)
        conversation.save(failOnError: true)

        Conversation conversationx = new Conversation(owner: user, profile: profile2, status: "Open", urgencyLevel: "High").save(failOnError: true)


        TwilloMessage twilloMessage1 = new TwilloMessage(isOugoing: false, isSent: false, messageText: "I need help", conversation: conversation, twilloMessageId: "code4good" + twilloMessageID++, sent: DateUtils.addMinutes(new Date(), random.nextInt(MAX_RANDOM_INT))).save(failOnError: true)
        TwilloMessage twilloMessage2 = new TwilloMessage(isOugoing: false, isSent: false, messageText: "Where can I find housing for the night?", conversation: conversation, twilloMessageId: "code4good" + twilloMessageID++, sent: DateUtils.addMinutes(new Date(), random.nextInt(MAX_RANDOM_INT))).save(failOnError: true)
        TwilloMessage twilloMessage2_1 = new TwilloMessage(isOugoing: true, isSent: true, messageText: "Please checkout goo.gl/Y8WXm9", conversation: conversation, twilloMessageId: "code4good" + twilloMessageID++, sent: DateUtils.addMinutes(new Date(), random.nextInt(MAX_RANDOM_INT))).save(failOnError: true)
        TwilloMessage twilloMessage2_2 = new TwilloMessage(isOugoing: false, isSent: false, messageText: "Thanks!", conversation: conversation, twilloMessageId: "code4good" + twilloMessageID++, sent: DateUtils.addMinutes(new Date(), random.nextInt(MAX_RANDOM_INT))).save(failOnError: true)
        conversationx.addToTwilloMessages(twilloMessage1)
        conversationx.addToTwilloMessages(twilloMessage2)
        conversationx.addToTwilloMessages(twilloMessage2_1)
        conversationx.addToTwilloMessages(twilloMessage2_2)
        conversationx.save(failOnError: true)

        Conversation conversation2 = new Conversation(owner: user2, profile: profile3, status: "Open", urgencyLevel: "High").save(failOnError: true)


        TwilloMessage twilloMessage3 = new TwilloMessage(isOugoing: false, isSent: false, messageText: "I don't know what to do", conversation: conversation, twilloMessageId: "code4good" + twilloMessageID++, sent: DateUtils.addMinutes(new Date(), random.nextInt(MAX_RANDOM_INT))).save(failOnError: true)
        TwilloMessage twilloMessage4 = new TwilloMessage(isOugoing: false, isSent: false, messageText: "Is there someone I can talk to?", conversation: conversation, twilloMessageId: "code4good" + twilloMessageID++, sent: DateUtils.addMinutes(new Date(), random.nextInt(MAX_RANDOM_INT))).save(failOnError: true)
        TwilloMessage twilloMessage4_1 = new TwilloMessage(isOugoing: true, isSent: true, messageText: "Yes, I can help. What seems to be the problem?", conversation: conversation, twilloMessageId: "code4good" + twilloMessageID++, sent: DateUtils.addMinutes(new Date(), random.nextInt(MAX_RANDOM_INT))).save(failOnError: true)
        conversation2.addToTwilloMessages(twilloMessage3)
        conversation2.addToTwilloMessages(twilloMessage4)
        conversation2.addToTwilloMessages(twilloMessage4_1)
        conversation2.save(failOnError: true)


        Conversation conversation3 = new Conversation(owner: user, profile: profile3, status: "Closed", urgencyLevel: "High").save(failOnError: true)


        TwilloMessage twilloMessage5 = new TwilloMessage(isOugoing: false, isSent: false, messageText: "I don't know what to do", conversation: conversation, twilloMessageId: "code4good" + twilloMessageID++, sent: DateUtils.addMinutes(new Date(), random.nextInt(MAX_RANDOM_INT))).save(failOnError: true)
        TwilloMessage twilloMessage6 = new TwilloMessage(isOugoing: false, isSent: false, messageText: "Is there someone I can talk to?", conversation: conversation, twilloMessageId: "code4good" + twilloMessageID++, sent: DateUtils.addMinutes(new Date(), random.nextInt(MAX_RANDOM_INT))).save(failOnError: true)
        conversation3.addToTwilloMessages(twilloMessage5)
        conversation3.addToTwilloMessages(twilloMessage6)
        conversation3.save(failOnError: true)

        conversation2.owner = user
        conversation2.save(failOnError: true)


        // for demo purposes we clear out our message queue onload
        def messages = TwilloMessage.findAll()
        messages.each {
            Notification.findByTwilloMessage(it) ?: new Notification(twilloMessage: it).save(failOnError: true)
        }

    }
    def destroy = {
    }
}
