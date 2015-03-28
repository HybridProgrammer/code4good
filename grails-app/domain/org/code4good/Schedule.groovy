package org.code4good

class Schedule {

    static constraints = {
    }

//    tbl_schedule
//    Appointment -> appointment_time / DateTime
//    Created By -> created_by (should pull from our social workers/employees table - string)
//    Created -> created_date / DateTime
//    Case Number -> case_number / string
//    Client Number -> (client/user, however we're calling it)
//    Notes -> appointment_notes (string)
//    Client Phone -> client_phone
//    Client Email -> client_email
//    Preferred Contact Method -> choose from phone/text/email

    Date dateCreated
    Date lastUpdated

    Date appointmentTime
    User createdBy
    String caseNumber
    Profile client
    String appointmentNotes
    String perferredContactMethod



}
