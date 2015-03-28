import org.code4good.Profile
import org.code4good.Role
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

    }
    def destroy = {
    }
}
