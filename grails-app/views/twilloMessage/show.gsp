
<%@ page import="org.code4good.TwilloMessage" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'twilloMessage.label', default: 'TwilloMessage')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-twilloMessage" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-twilloMessage" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list twilloMessage">
			
				<g:if test="${twilloMessageInstance?.conversation}">
				<li class="fieldcontain">
					<span id="conversation-label" class="property-label"><g:message code="twilloMessage.conversation.label" default="Conversation" /></span>
					
						<span class="property-value" aria-labelledby="conversation-label"><g:link controller="conversation" action="show" id="${twilloMessageInstance?.conversation?.id}">${twilloMessageInstance?.conversation?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${twilloMessageInstance?.isOugoing}">
				<li class="fieldcontain">
					<span id="isOugoing-label" class="property-label"><g:message code="twilloMessage.isOugoing.label" default="Is Ougoing" /></span>
					
						<span class="property-value" aria-labelledby="isOugoing-label"><g:formatBoolean boolean="${twilloMessageInstance?.isOugoing}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${twilloMessageInstance?.isSent}">
				<li class="fieldcontain">
					<span id="isSent-label" class="property-label"><g:message code="twilloMessage.isSent.label" default="Is Sent" /></span>
					
						<span class="property-value" aria-labelledby="isSent-label"><g:formatBoolean boolean="${twilloMessageInstance?.isSent}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${twilloMessageInstance?.messageText}">
				<li class="fieldcontain">
					<span id="messageText-label" class="property-label"><g:message code="twilloMessage.messageText.label" default="Message Text" /></span>
					
						<span class="property-value" aria-labelledby="messageText-label"><g:fieldValue bean="${twilloMessageInstance}" field="messageText"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${twilloMessageInstance?.sent}">
				<li class="fieldcontain">
					<span id="sent-label" class="property-label"><g:message code="twilloMessage.sent.label" default="Sent" /></span>
					
						<span class="property-value" aria-labelledby="sent-label"><g:formatDate date="${twilloMessageInstance?.sent}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${twilloMessageInstance?.twilloMessageId}">
				<li class="fieldcontain">
					<span id="twilloMessageId-label" class="property-label"><g:message code="twilloMessage.twilloMessageId.label" default="Twillo Message Id" /></span>
					
						<span class="property-value" aria-labelledby="twilloMessageId-label"><g:fieldValue bean="${twilloMessageInstance}" field="twilloMessageId"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:twilloMessageInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${twilloMessageInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
