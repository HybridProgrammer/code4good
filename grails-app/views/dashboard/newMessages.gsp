<g:each in="${conversationInstanceList}" status="i" var="conversationInstance">
    <tr id="${conversationInstance.id}" class="${(i % 2) == 0 ? 'even' : 'odd'}">

        <td><g:link action="showHistory" id="${conversationInstance.id}"><g:getOwner conversation="${conversationInstance}" /></g:link></td>

        <td><g:link action="showHistory" id="${conversationInstance.id}">${conversationInstance.profile.phone}</g:link></td>

        <td><g:link action="showHistory" id="${conversationInstance.id}">${fieldValue(bean: conversationInstance, field: "dateCreated")}</g:link></td>

        <td><g:link action="showHistory" id="${conversationInstance.id}">${fieldValue(bean: conversationInstance, field: "urgencyLevel")}</g:link></td>

    </tr>
</g:each>