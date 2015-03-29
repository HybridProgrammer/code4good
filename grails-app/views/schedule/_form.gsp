<%@ page import="org.code4good.Schedule" %>



<div class="fieldcontain ${hasErrors(bean: scheduleInstance, field: 'appointmentNotes', 'error')} required">
	<label for="appointmentNotes">
		<g:message code="schedule.appointmentNotes.label" default="Appointment Notes" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="appointmentNotes" required="" value="${scheduleInstance?.appointmentNotes}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: scheduleInstance, field: 'appointmentTime', 'error')} required">
	<label for="appointmentTime">
		<g:message code="schedule.appointmentTime.label" default="Appointment Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="appointmentTime" precision="day"  value="${scheduleInstance?.appointmentTime}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: scheduleInstance, field: 'caseNumber', 'error')} required">
	<label for="caseNumber">
		<g:message code="schedule.caseNumber.label" default="Case Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="caseNumber" name="caseNumber.id" from="${org.code4good.Conversation.list()}" optionKey="id" required="" value="${scheduleInstance?.caseNumber?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: scheduleInstance, field: 'client', 'error')} required">
	<label for="client">
		<g:message code="schedule.client.label" default="Client" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="client" name="client.id" from="${org.code4good.Profile.list()}" optionKey="id" required="" value="${scheduleInstance?.client?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: scheduleInstance, field: 'createdBy', 'error')} required">
	<label for="createdBy">
		<g:message code="schedule.createdBy.label" default="Created By" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="createdBy" name="createdBy.id" from="${org.code4good.User.list()}" optionKey="id" required="" value="${scheduleInstance?.createdBy?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: scheduleInstance, field: 'perferredContactMethod', 'error')} required">
	<label for="perferredContactMethod">
		<g:message code="schedule.perferredContactMethod.label" default="Perferred Contact Method" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="perferredContactMethod" required="" value="${scheduleInstance?.perferredContactMethod}"/>

</div>

