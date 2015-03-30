<g:each in="${conversationInstanceList}" status="i" var="conversationInstance">
    <tr id="${conversationInstance.id}" class="${conversationInstance.urgencyLevel.equalsIgnoreCase("High") ? 'urgent' : 'even'}">

        <td><g:link action="showHistory" id="${conversationInstance.id}"><g:getOwner conversation="${conversationInstance}" /></g:link></td>

        <td><g:link action="showHistory" id="${conversationInstance.id}">${conversationInstance.profile.phone}</g:link></td>

        <td><g:link action="showHistory" id="${conversationInstance.id}">${fieldValue(bean: conversationInstance, field: "dateCreated")}</g:link></td>

        <td><g:link action="showHistory" id="${conversationInstance.id}">${fieldValue(bean: conversationInstance, field: "urgencyLevel")}</g:link></td>

    </tr>
</g:each>