

<%@ page import="gabinet.Surgery" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'surgery.label', default: 'Surgery')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <link rel="stylesheet" href="${resource(dir:'css/south-street',file:'jquery-ui-1.8.10.custom.css')}" />
        
        <g:javascript library="jquery" plugin="jquery" src="jquery/jquery-1.4.4.min.js"/>
        <script src="${resource(dir:'js/jquery',file:'jquery-ui-1.8.9.custom.min.js')}" type="text/javascript"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				$("#surgeryDate").datepicker({dateFormat: 'yy/mm/dd', firstDay: 1});
			})
		</script>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /> for Client: ${clientInstance?.firstName}</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${surgeryInstance}">
            <div class="errors">
                <g:renderErrors bean="${surgeryInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" enctype="multipart/form-data">
                <div class="dialog">
                    <table>
                        <tbody>
                        
                        	<g:hiddenField name="id" value="${clientInstance?.id}" />
                        	
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="date"><g:message code="surgery.date.label" default="Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surgeryInstance, field: 'date', 'errors')}">
                                    <g:datePicker name="date" precision="day" value="${surgeryInstance?.date}"  />
									<g:textField id="surgeryDate" name="startDate" value="${surgeryInstance?.date}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="recommendation"><g:message code="surgery.recommendation.label" default="Recommendation" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surgeryInstance, field: 'recommendation', 'errors')}">
                                    <g:textArea name="recommendation" value="${surgeryInstance?.recommendation}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="skin"><g:message code="surgery.skin.label" default="Skin" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surgeryInstance, field: 'skin', 'errors')}">
                                    <g:textField name="skin" value="${surgeryInstance?.skin}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="surgery"><g:message code="surgery.surgery.label" default="Surgery" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surgeryInstance, field: 'surgery', 'errors')}">
                                    <g:textField name="surgery" value="${surgeryInstance?.surgery}" />
                            		
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="therapy"><g:message code="surgery.therapy.label" default="Therapy" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surgeryInstance, field: 'therapy', 'errors')}">
                                    <g:textField name="therapy" value="${surgeryInstance?.therapy}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="therapy"><g:message code="surgery.upload.label" default="Upload picture" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surgeryInstance, field: 'picture', 'errors')}">
                                    <input type="file" name="picture" />
                                </td>
                            </tr>
                                        
                                                   
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
