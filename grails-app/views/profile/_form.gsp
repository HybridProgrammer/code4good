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

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'phone', 'error')} required">
	<label for="phone">
		<g:message code="profile.phone.label" default="Phone" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="phone" required="" value="${profileInstance?.phone}"/>

</div>

