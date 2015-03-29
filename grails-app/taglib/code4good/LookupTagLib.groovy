package code4good

import org.code4good.Profile
import org.code4good.Conversation

class LookupTagLib {
    static defaultEncodeAs = [taglib:'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]

    def getPhoneByProfileID = { attrs, body ->
        def profile = attrs.profile
        out << profile.phone
    }

    def getOwner = { attrs, body ->
        def conversation = attrs.conversation
        if(conversation.owner != null) {
            out << conversation.owner.username
            return
        }
        else {
            out << "Unassigned"
            return
        }

    }
}
