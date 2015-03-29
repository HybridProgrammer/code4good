<%@ page import="org.code4good.Conversation" %>



<div class="fieldcontain ${hasErrors(bean: conversationInstance, field: 'twilloMessages', 'error')} ">
    <label for="twilloMessages">
        <g:message code="conversation.twilloMessages.label" default="Twillo Messages"/>

    </label>

    <ul class="one-to-many">
        <g:each in="${conversationInstance?.twilloMessages ?}" var="t">
            <li><g:link controller="twilloMessage" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
        </g:each>
        <li class="add">
            <g:link controller="twilloMessage" action="create"
                    params="['conversation.id': conversationInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'twilloMessage.label', default: 'TwilloMessage')])}</g:link>
        </li>
    </ul>

</div>

<div class="fieldcontain ${hasErrors(bean: conversationInstance, field: 'owner', 'error')} ">
    <label for="owner">
        <g:message code="conversation.owner.label" default="Owner"/>

    </label>
    <g:select id="owner" name="owner.id" from="${org.code4good.User.list()}" optionKey="id"
              value="${conversationInstance?.owner?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: conversationInstance, field: 'profile', 'error')} required">
    <label for="profile">
        <g:message code="conversation.profile.label" default="Profile"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="profile" name="profile.id" from="${org.code4good.Profile.list()}" optionKey="id" required=""
              value="${conversationInstance?.profile?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: conversationInstance, field: 'status', 'error')} required">
    <label for="status">
        <g:message code="conversation.status.label" default="Status"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="status" required="" value="${conversationInstance?.status}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: conversationInstance, field: 'urgencyLevel', 'error')} required">
    <label for="urgencyLevel">
        <g:message code="conversation.urgencyLevel.label" default="Urgency Level"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="urgencyLevel" required="" value="${conversationInstance?.urgencyLevel}"/>

</div>

