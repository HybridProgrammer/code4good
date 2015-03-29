package code4good

import org.code4good.Profile
import org.code4good.Conversation

import java.text.SimpleDateFormat

class LookupTagLib {
//    static defaultEncodeAs = [taglib:'html']
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

    def getMessages = { attrs, body ->
        Conversation conversation = attrs.conversation
        String output = ""
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy.MM.dd hh:mm:ss a zzz");

        conversation.twilloMessages.each {
            if(it != null) {
                def sentBy = ""
                if(it.isOugoing) {
                    sentBy = conversation.owner.username
                }
                else {
                    sentBy = conversation.profile.phone
                }
                output += " <tr>\n" +
                        "\n" +
                        "                        <td>"+ it.messageText + "</td>\n" +
                        "\n" +
                        "                        <td>"+ simpleDateFormat.format(it.sent) + "</td>\n" +
                        "\n" +
                        "                        <td>"+ sentBy + "</td>\n" +
                        "\n" +
                        "</tr>"


            }
        }

        out << body() << output

    }
}
