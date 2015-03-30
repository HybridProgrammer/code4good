
<%@ page import="org.code4good.Conversation" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'conversation.label', default: 'Conversation')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
    <script type="application/javascript">
        $( document ).ready(function() {
            var i = 1;                     //  set your counter to 1

            function poll () {           //  create a loop function
                setTimeout(function () {    //  call a 3s setTimeout when the loop is called
                    var conversationCount = $('#messages').children().size()
                    var conversations = $('#messages').children()
                    var maxId = 0
                    $.each( conversations, function( key, value ) {
                        if(conversations[key].id > maxId) {
                            maxId = conversations[key].id
                        }
                    });
                    $.ajax({
                        method: "POST",
                        url: "newConversations",
                        data: { maxId: maxId }
                    })
                            .done(function( msg ) {
                                $('#messages').append(msg)
                            });



                    poll()                      //  ..  setTimeout()
                }, 3000)
            }

            poll();                      //  start the loop



        });
    </script>
</head>
<body>
<a href="#list-conversation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
        <li><a class="create" href="http://10.11.48.53:8888/code4good/schedule.phtml"><g:message code="default.schedule.label" default="Schedule"/></a></li>
    </ul>
</div>
<div id="list-conversation" class="content scaffold-list" role="main">
    <h1>Dashboard</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="phone" title="${message(code: 'conversation.owner.label', default: 'Owner')}" />

            <g:sortableColumn property="phone" title="${message(code: 'conversation.phone.label', default: 'Phone #')}" />

            <g:sortableColumn property="dateCreated" title="${message(code: 'conversation.dateCreated.label', default: 'Date Created')}" />

            <g:sortableColumn property="Urgency" title="${message(code: 'conversation.dateCreated.label', default: 'Urgency Status')}" />

        </tr>
        </thead>
        <tbody id="messages">
        <g:each in="${conversationInstanceList}" status="i" var="conversationInstance">
            <tr id="${conversationInstance.id}" class="${conversationInstance.urgencyLevel.equalsIgnoreCase("High") ? 'urgent' : 'even'}">

                <td><g:link action="showHistory" id="${conversationInstance.id}"><g:getOwner conversation="${conversationInstance}" /></g:link></td>

                <td><g:link action="showHistory" id="${conversationInstance.id}">${conversationInstance.profile.phone}</g:link></td>

                <td><g:link action="showHistory" id="${conversationInstance.id}">${fieldValue(bean: conversationInstance, field: "dateCreated")}</g:link></td>

                <td><g:link action="showHistory" id="${conversationInstance.id}">${fieldValue(bean: conversationInstance, field: "urgencyLevel")}</g:link></td>

            </tr>
        </g:each>
        </tbody>
    </table>
    <div class="pagination">
        <g:paginate total="${conversationInstanceCount ?: 0}" />
    </div>
</div>
</body>
</html>
