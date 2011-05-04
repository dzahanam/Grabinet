

<%@ page import="gabinet.Surgery" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'surgery.label', default: 'Surgery')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${surgeryInstance}">
            <div class="errors">
                <g:renderErrors bean="${surgeryInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${surgeryInstance?.id}" />
                <g:hiddenField name="version" value="${surgeryInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="date"><g:message code="surgery.date.label" default="Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surgeryInstance, field: 'date', 'errors')}">
                                    <g:datePicker name="date" precision="day" value="${surgeryInstance?.date}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="recommendation"><g:message code="surgery.recommendation.label" default="Recommendation" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surgeryInstance, field: 'recommendation', 'errors')}">
                                    <g:textField name="recommendation" value="${surgeryInstance?.recommendation}" />
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
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
