
<%@ page import="org.code4good.TwilloMessage" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'twilloMessage.label', default: 'TwilloMessage')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-twilloMessage" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-twilloMessage" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="twilloMessage.conversation.label" default="Conversation" /></th>
					
						<g:sortableColumn property="sent" title="${message(code: 'twilloMessage.sent.label', default: 'Sent')}" />
					
						<g:sortableColumn property="twilloMessageId" title="${message(code: 'twilloMessage.twilloMessageId.label', default: 'Twillo Message Id')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${twilloMessageInstanceList}" status="i" var="twilloMessageInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${twilloMessageInstance.id}">${fieldValue(bean: twilloMessageInstance, field: "conversation")}</g:link></td>
					
						<td><g:formatDate date="${twilloMessageInstance.sent}" /></td>
					
						<td>${fieldValue(bean: twilloMessageInstance, field: "twilloMessageId")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${twilloMessageInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
