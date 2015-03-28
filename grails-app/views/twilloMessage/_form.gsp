<%@ page import="org.code4good.TwilloMessage" %>



<div class="fieldcontain ${hasErrors(bean: twilloMessageInstance, field: 'conversation', 'error')} required">
	<label for="conversation">
		<g:message code="twilloMessage.conversation.label" default="Conversation" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="conversation" name="conversation.id" from="${org.code4good.Conversation.list()}" optionKey="id" required="" value="${twilloMessageInstance?.conversation?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: twilloMessageInstance, field: 'sent', 'error')} required">
	<label for="sent">
		<g:message code="twilloMessage.sent.label" default="Sent" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="sent" precision="day"  value="${twilloMessageInstance?.sent}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: twilloMessageInstance, field: 'twilloMessageId', 'error')} required">
	<label for="twilloMessageId">
		<g:message code="twilloMessage.twilloMessageId.label" default="Twillo Message Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="twilloMessageId" required="" value="${twilloMessageInstance?.twilloMessageId}"/>

</div>

