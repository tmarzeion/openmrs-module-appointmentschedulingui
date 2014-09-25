<%
    ui.decorateWith("appui", "standardEmrPage")
%>


<script type="text/javascript">
    var breadcrumbs = [
        { icon: "icon-home", link: '/' + OPENMRS_CONTEXT_PATH + '/index.htm' },
        { label: "${ ui.message("appointmentschedulingui.scheduleAppointment.buttonTitle")}",
            link: '${ui.pageLink("coreapps", "findpatient/findPatient", [ app: 'appointmentschedulingui.schedulingAppointmentApp'])}' },
        { label: "${ ui.format(patient.patient.familyName) }, ${ ui.format(patient.patient.givenName) }" }
    ];

    jq(function() {
        angular.bootstrap(jq('#appointmentscheduling-manageAppointments'), ['appointmentscheduling']);
    })

</script>

<div id="appointmentscheduling-manageAppointments">

    ${ ui.includeFragment("coreapps", "patientHeader", [ patient: patient.patient ]) }

    ${ ui.includeFragment("appointmentschedulingui", "patientAppointments", [ patient: patient.patient ]) }

    ${ ui.includeFragment("appointmentschedulingui", "patientAppointmentRequests", [ patient: patient.patient ]) }

    <% if (canBook) { %>
        ${ ui.includeFragment("appointmentschedulingui", "scheduleAppointment", [ patient: patient.patient ]) }
    <% } %>

</div>