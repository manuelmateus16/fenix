<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<html:xhtml />
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://fenix-ashes.ist.utl.pt/fenix-renderers" prefix="fr"%>

<h2><bean:message bundle="ACADEMIC_OFFICE_RESOURCES" key="label.payments.gratuityExemptions" /></h2>
<br />


<logic:messagesPresent message="true" property="context">
	<ul>
		<html:messages id="messages" message="true" bundle="ACADEMIC_OFFICE_RESOURCES" property="context">
			<li><span class="error0"><bean:write name="messages" /></span></li>
		</html:messages>
	</ul>
	<br />
</logic:messagesPresent>

<logic:messagesPresent message="true" property="<%=org.apache.struts.action.ActionMessages.GLOBAL_MESSAGE%>">
	<ul>
		<html:messages id="messages" message="true" bundle="APPLICATION_RESOURCES" property="<%=org.apache.struts.action.ActionMessages.GLOBAL_MESSAGE%>">
			<li><span class="error0"><bean:write name="messages" /></span></li>
		</html:messages>
	</ul>
	<br />
</logic:messagesPresent>


<strong><bean:message bundle="ACADEMIC_OFFICE_RESOURCES" key="label.payments.person" />:</strong>
<fr:view name="createInsuranceExemptionBean" property="insuranceEvent.person"
	schema="person.view-with-name-and-idDocumentType-and-documentIdNumber">
	<fr:layout name="tabular">
		<fr:property name="classes" value="tstyle4" />
	</fr:layout>
</fr:view>

<br />

<bean:define id="eventId" name="createInsuranceExemptionBean" property="insuranceEvent.externalId" />
<bean:define id="personId" name="createInsuranceExemptionBean" property="insuranceEvent.person.externalId" />
<fr:form action="<%="/exemptionsManagement.do?personId=" + personId + "&amp;eventId=" + eventId%>">

	<input alt="input.method" type="hidden" name="method" value="" />

	<fr:edit id="createInsuranceExemptionBean" name="createInsuranceExemptionBean"
		schema="InsuranceExemptionBean.edit">
		<fr:layout name="tabular">
			<fr:property name="classes" value="tstyle4" />
			<fr:property name="columnClasses" value=",,tdclear tderror1" />
		</fr:layout>
	</fr:edit>

	<br />

	<html:submit bundle="HTMLALT_RESOURCES" altKey="submit.submit"
		onclick="this.form.method.value='createInsuranceExemption';">
		<bean:message bundle="APPLICATION_RESOURCES" key="label.create" />
	</html:submit>
	
	<html:cancel bundle="HTMLALT_RESOURCES" altKey="submit.submit"
		onclick="this.form.method.value='showExemptions';">
		<bean:message bundle="APPLICATION_RESOURCES" key="label.cancel" />
	</html:cancel>

</fr:form>
