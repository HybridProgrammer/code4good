<%@ page import="org.code4good.TwilloMessage" %>



<div class="fieldcontain ${hasErrors(bean: twilloMessageInstance, field: 'conversation', 'error')} required">
	<label for="conversation">
		<g:message code="twilloMessage.conversation.label" default="Conversation" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="conversation" name="conversation.id" from="${org.code4good.Conversation.list()}" optionKey="id" required="" value="${twilloMessageInstance?.conversation?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: twilloMessageInstance, field: 'isOugoing', 'error')} ">
	<label for="isOugoing">
		<g:message code="twilloMessage.isOugoing.label" default="Is Ougoing" />
		
	</label>
	<g:checkBox name="isOugoing" value="${twilloMessageInstance?.isOugoing}" />

</div>

<div class="fieldcontain ${hasErrors(bean: twilloMessageInstance, field: 'isSent', 'error')} ">
	<label for="isSent">
		<g:message code="twilloMessage.isSent.label" default="Is Sent" />
		
	</label>
	<g:checkBox name="isSent" value="${twilloMessageInstance?.isSent}" />

</div>

<div class="fieldcontain ${hasErrors(bean: twilloMessageInstance, field: 'messageText', 'error')} required">
	<label for="messageText">
		<g:message code="twilloMessage.messageText.label" default="Message Text" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="messageText" required="" value="${twilloMessageInstance?.messageText}"/>

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

