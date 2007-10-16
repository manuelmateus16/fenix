<%@ page language="java" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<html:xhtml/>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/fenix-renderers.tld" prefix="fr" %>

<logic:present name="forum">
	<bean:define id="forumId" name="forum" property="idInternal" />	
	<bean:define id="contextPrefix" name="contextPrefix" />
	
	<em><bean:message bundle="APPLICATION_RESOURCES" key="label.teacher.executionCourse.forum" />&nbsp;<bean:write name="forum" property="name"/></em>
	<h2><bean:message bundle="MESSAGING_RESOURCES" key="label.viewForum.title"/></h2>

	<p>
		<html:messages id="message" message="true" bundle="MESSAGING_RESOURCES">
			<span class="error0">
				<bean:write name="message"/>
			</span>
		</html:messages>
	</p>
	
	<!-- Forum Details -->
	<fr:view name="forum" schema="forum.view-full">
		<fr:layout name="tabular">
	        <fr:property name="classes" value="tstyle2 thlight thright"/>
	    </fr:layout>
	</fr:view>

	<logic:equal name="receivingMessagesByEmail" value="true">
		<span style="color: #888;">
			<bean:message bundle="MESSAGING_RESOURCES" key="label.viewForum.receivingMessagesByEmail"/>
			<html:link action="<%= contextPrefix + "method=emailUnsubscribe"%>" paramId="forumId" paramName="forumId"><bean:message bundle="MESSAGING_RESOURCES" key="link.viewForum.quitSubscription"/></html:link>
		</span>
	</logic:equal>
	<logic:equal name="receivingMessagesByEmail" value="false">
		<span style="color: #888;">
			<bean:message bundle="MESSAGING_RESOURCES" key="label.viewForum.notReceivingMessagesByEmail"/>
			<html:link action="<%= contextPrefix + "method=emailSubscribe"%>" paramId="forumId" paramName="forumId"><bean:message bundle="MESSAGING_RESOURCES" key="link.viewForum.subscribe"/></html:link>
		</span>
	</logic:equal>


	<h3 class="mtop2"><bean:message bundle="MESSAGING_RESOURCES" key="label.viewForum.threads"/></h3>
	
	<!-- Conversation Threads -->
	<logic:equal name="loggedPersonCanWrite" value="true">
		<p>
			<span class="gen-button">
			<img src="<%= request.getContextPath() %>/images/dotist_post.gif" alt="<bean:message key="dotist_post" bundle="IMAGE_RESOURCES" />" />
			<html:link action="<%= contextPrefix + "method=prepareCreateThreadAndMessage"%>" paramId="forumId" paramName="forum" paramProperty="idInternal" styleClass="gen-button">
				<bean:message bundle="MESSAGING_RESOURCES" key="link.viewForum.createThread"/>
			</html:link>
			</span>
		</p>
	</logic:equal>

	<logic:empty name="conversationThreads">
		<p class="mvert15">
			<em><bean:message bundle="MESSAGING_RESOURCES" key="label.viewForum.noThreads"/>.</em>
		</p>
	</logic:empty>
	<logic:notEmpty name="conversationThreads">
		<bean:message bundle="MESSAGING_RESOURCES" key="label.viewForum.page"/>
		<bean:define id="currentPageNumberString"><bean:write name="currentPageNumber"/></bean:define>
		
		<logic:iterate id="pageNumber" name="pageNumbers" type="java.lang.Integer">
			<logic:equal name="currentPageNumberString" value="<%=pageNumber.toString()%>">
				<bean:write name="pageNumber"/>
			</logic:equal>
			<logic:notEqual name="currentPageNumber" value="<%=pageNumber.toString()%>">
				<html:link action="<%= contextPrefix + "method=viewForum&amp;forumId=" + forumId.toString() + "&amp;pageNumber=" + pageNumber%>">
					<bean:write name="pageNumber"/>
				</html:link>			
			</logic:notEqual>
		</logic:iterate>
	
		<fr:view name="conversationThreads" schema="conversationThread.view-full">
			<fr:layout name="tabular">
		        <fr:property name="classes" value="tstyle2 width100"/>
		        <fr:property name="columnClasses" value=",acenter,acenter,acenter"/>
       			<fr:property name="link(view)" value="<%= contextPrefix + "method=viewThread"%>"/>
				<fr:property name="param(view)" value="forum.idInternal/forumId,idInternal/threadId"/>
				<fr:property name="key(view)" value="label.viewForum.viewThread"/>
				<fr:property name="bundle(view)" value="MESSAGING_RESOURCES"/>
		    </fr:layout>
		    
		    <fr:destination name="viewForum" path="<%= contextPrefix + "method=viewThread&amp;forumId=${forum.idInternal}&amp;threadId=${idInternal}" %>"/>
		</fr:view>
	</logic:notEmpty>
			
</logic:present>