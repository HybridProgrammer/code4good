import org.apache.commons.lang.time.DateUtils
import org.code4good.Conversation
import org.code4good.Profile
import org.code4good.Role
import org.code4good.Schedule
import org.code4good.TwilloMessage
import org.code4good.User
import org.code4good.UserRole

class BootStrap {
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


        def user = User.findByUsername('socialworker1') ?: new User(
                username: 'socialworker1',
                //password: springSecurityService.encodePassword('admin'),
                password: 'socialworker1',
                enabled: true).save(failOnError: true)

        if (!user.authorities.contains(userRole)) {
            UserRole.create adminUser, userRole
        }

        user = User.findByUsername('socialworker2') ?: new User(
                username: 'socialworker2',
                //password: springSecurityService.encodePassword('admin'),
                password: 'socialworker2',
                enabled: true).save(failOnError: true)

        if (!user.authorities.contains(userRole)) {
            UserRole.create adminUser, userRole
        }

        Profile.findByPhone("555-555-5555") ?: new Profile(phone: "555-555-5555").save(failOnError: true)
        def profile2 = Profile.findByPhone("555-555-5556") ?: new Profile(phone: "555-555-5556").save(failOnError: true)


        Conversation conversation = Conversation.findByProfileAndStatus(profile2, "Open") ?: new Conversation(profile: profile2, status: "Open").save(failOnError: true)


        TwilloMessage twilloMessage1 = TwilloMessage.findByConversation(conversation) ?: new TwilloMessage(conversation: conversation, twilloMessageId: "code4good1", sent: DateUtils.addMinutes(new Date(), 1)).save(failOnError: true)
        TwilloMessage twilloMessage2 = TwilloMessage.findByConversation(conversation) ?: new TwilloMessage(conversation: conversation, twilloMessageId: "code4good1", sent: DateUtils.addMinutes(new Date(), 1)).save(failOnError: true)
        conversation.addToTwilloMessages(twilloMessage)



    }
    def destroy = {
    }
}
