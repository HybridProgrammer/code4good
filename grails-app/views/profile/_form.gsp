<%@ page import="org.code4good.Profile" %>



<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'user', 'error')} ">
	<label for="user">
		<g:message code="profile.user.label" default="User" />
		
	</label>
	<g:select id="user" name="user.id" from="${org.code4good.User.list()}" optionKey="id" value="${profileInstance?.user?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'firstName', 'error')} ">
	<label for="firstName">
		<g:message code="profile.firstName.label" default="First Name" />
		
	</label>
	<g:textField name="firstName" value="${profileInstance?.firstName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'lastName', 'error')} ">
	<label for="lastName">
		<g:message code="profile.lastName.label" default="Last Name" />
		
	</label>
	<g:textField name="lastName" value="${profileInstance?.lastName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="profile.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${profileInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'conversations', 'error')} ">
	<label for="conversations">
		<g:message code="profile.conversations.label" default="Conversations" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${profileInstance?.conversations?}" var="c">
    <li><g:link controller="conversation" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="conversation" action="create" params="['profile.id': profileInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'conversation.label', default: 'Conversation')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'phone', 'error')} required">
	<label for="phone">
		<g:message code="profile.phone.label" default="Phone" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="phone" required="" value="${profileInstance?.phone}"/>

</div>

