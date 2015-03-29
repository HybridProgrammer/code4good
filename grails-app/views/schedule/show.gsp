
<%@ page import="org.code4good.Schedule" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'schedule.label', default: 'Schedule')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-schedule" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-schedule" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list schedule">
			
				<g:if test="${scheduleInstance?.appointmentNotes}">
				<li class="fieldcontain">
					<span id="appointmentNotes-label" class="property-label"><g:message code="schedule.appointmentNotes.label" default="Appointment Notes" /></span>
					
						<span class="property-value" aria-labelledby="appointmentNotes-label"><g:fieldValue bean="${scheduleInstance}" field="appointmentNotes"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${scheduleInstance?.appointmentTime}">
				<li class="fieldcontain">
					<span id="appointmentTime-label" class="property-label"><g:message code="schedule.appointmentTime.label" default="Appointment Time" /></span>
					
						<span class="property-value" aria-labelledby="appointmentTime-label"><g:formatDate date="${scheduleInstance?.appointmentTime}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${scheduleInstance?.caseNumber}">
				<li class="fieldcontain">
					<span id="caseNumber-label" class="property-label"><g:message code="schedule.caseNumber.label" default="Case Number" /></span>
					
						<span class="property-value" aria-labelledby="caseNumber-label"><g:link controller="conversation" action="show" id="${scheduleInstance?.caseNumber?.id}">${scheduleInstance?.caseNumber?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${scheduleInstance?.client}">
				<li class="fieldcontain">
					<span id="client-label" class="property-label"><g:message code="schedule.client.label" default="Client" /></span>
					
						<span class="property-value" aria-labelledby="client-label"><g:link controller="profile" action="show" id="${scheduleInstance?.client?.id}">${scheduleInstance?.client?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${scheduleInstance?.createdBy}">
				<li class="fieldcontain">
					<span id="createdBy-label" class="property-label"><g:message code="schedule.createdBy.label" default="Created By" /></span>
					
						<span class="property-value" aria-labelledby="createdBy-label"><g:link controller="user" action="show" id="${scheduleInstance?.createdBy?.id}">${scheduleInstance?.createdBy?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${scheduleInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="schedule.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${scheduleInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${scheduleInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="schedule.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${scheduleInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${scheduleInstance?.perferredContactMethod}">
				<li class="fieldcontain">
					<span id="perferredContactMethod-label" class="property-label"><g:message code="schedule.perferredContactMethod.label" default="Perferred Contact Method" /></span>
					
						<span class="property-value" aria-labelledby="perferredContactMethod-label"><g:fieldValue bean="${scheduleInstance}" field="perferredContactMethod"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:scheduleInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${scheduleInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
