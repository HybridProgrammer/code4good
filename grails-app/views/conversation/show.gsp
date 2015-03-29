<%@ page import="org.code4good.Conversation" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'conversation.label', default: 'Conversation')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-conversation" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                   default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-conversation" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list conversation">

        <g:if test="${conversationInstance?.twilloMessages}">
            <li class="fieldcontain">

                <table>
                    <thead>
                    <tr>

                        <g:sortableColumn property="messageText" title="${message(code: 'conversation.dateCreated.label', default: 'Message')}" />

                        <g:sortableColumn property="lastUpdated" title="${message(code: 'conversation.lastUpdated.label', default: 'Time')}" />

                    </tr>
                    </thead>
                    <tbody>

                        <tr>



                        <td>Hello how are you?</td>

                        <td>3/30/3015 12:00 PM</td>

                        </tr>

                    </tbody>
                </table>


            </li>
        </g:if>

        <g:if test="${conversationInstance?.owner}">
            <li class="fieldcontain">
                <span id="owner-label" class="property-label"><g:message code="conversation.owner.label"
                                                                         default="Owner"/></span>

                <span class="property-value" aria-labelledby="owner-label"><g:link controller="user" action="show"
                                                                                   id="${conversationInstance?.owner?.id}">${conversationInstance?.owner?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${conversationInstance?.dateCreated}">
            <li class="fieldcontain">
                <span id="dateCreated-label" class="property-label"><g:message code="conversation.dateCreated.label"
                                                                               default="Date Created"/></span>

                <span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate
                        date="${conversationInstance?.dateCreated}"/></span>

            </li>
        </g:if>

        <g:if test="${conversationInstance?.lastUpdated}">
            <li class="fieldcontain">
                <span id="lastUpdated-label" class="property-label"><g:message code="conversation.lastUpdated.label"
                                                                               default="Last Updated"/></span>

                <span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate
                        date="${conversationInstance?.lastUpdated}"/></span>

            </li>
        </g:if>

        <g:if test="${conversationInstance?.profile}">
            <li class="fieldcontain">
                <span id="profile-label" class="property-label"><g:message code="conversation.profile.label"
                                                                           default="Phone Number"/></span>

                <span class="property-value" aria-labelledby="profile-label"><g:link controller="profile" action="show"
                                                                                     id="${conversationInstance?.profile?.id}">${conversationInstance?.profile?.phone?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${conversationInstance?.status}">
            <li class="fieldcontain">
                <span id="status-label" class="property-label"><g:message code="conversation.status.label"
                                                                          default="Status"/></span>

                <span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${conversationInstance}"
                                                                                          field="status"/></span>

            </li>
        </g:if>

        <g:if test="${conversationInstance?.urgencyLevel}">
            <li class="fieldcontain">
                <span id="urgencyLevel-label" class="property-label"><g:message code="conversation.urgencyLevel.label"
                                                                                default="Urgency Level"/></span>

                <span class="property-value" aria-labelledby="urgencyLevel-label"><g:fieldValue
                        bean="${conversationInstance}" field="urgencyLevel"/></span>

            </li>
        </g:if>

    </ol>
    <g:form url="[resource: conversationInstance, action: 'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${conversationInstance}"><g:message
                    code="default.button.edit.label" default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
