<%@ page import="org.code4good.Conversation" %>



<div class="fieldcontain ${hasErrors(bean: conversationInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="conversation.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="status" required="" value="${conversationInstance?.status}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: conversationInstance, field: 'twilloMessages', 'error')} ">
	<label for="twilloMessages">
		<g:message code="conversation.twilloMessages.label" default="Twillo Messages" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${conversationInstance?.twilloMessages?}" var="t">
    <li><g:link controller="twilloMessage" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="twilloMessage" action="create" params="['conversation.id': conversationInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'twilloMessage.label', default: 'TwilloMessage')])}</g:link>
</li>
</ul>


</div>

