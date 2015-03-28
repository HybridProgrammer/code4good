<%@ page import="org.code4good.Queue" %>



<div class="fieldcontain ${hasErrors(bean: queueInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="queue.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${org.code4good.Profile.list()}" optionKey="id" required="" value="${queueInstance?.user?.id}" class="many-to-one"/>

</div>

