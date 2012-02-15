

<%@ page import="gabinet.Client" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'client.label', default: 'Client')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${clientInstance}">
            <div class="errors"> 	
                <g:renderErrors bean="${clientInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="firstName"><g:message code="client.firstName.label" default="First Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: clientInstance, field: 'firstName', 'errors')}">
                                    <g:textField name="firstName" value="${clientInstance?.firstName}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="surName"><g:message code="client.surName.label" default="Sur Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: clientInstance, field: 'surName', 'errors')}">
                                    <g:textField name="surName" value="${clientInstance?.surName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="birthDate"><g:message code="client.birthDate.label" default="Birth Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: clientInstance, field: 'birthDate', 'errors')}">
                                    <g:datePicker name="birthDate" precision="day" value="${clientInstance?.birthDate}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="homePhone"><g:message code="client.homePhone.label" default="Home Phone" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: clientInstance, field: 'homePhone', 'errors')}">
                                    <g:textField name="homePhone" value="${clientInstance?.homePhone}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="cellPhone"><g:message code="client.cellPhone.label" default="Cell Phone" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: clientInstance, field: 'cellPhone', 'errors')}">
                                    <g:textField name="cellPhone" value="${clientInstance?.cellPhone}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email"><g:message code="client.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: clientInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${clientInstance?.email}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="street"><g:message code="address.street.label" default="Street" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: clientInstance, field: 'address.street', 'errors')}">
                                    <g:textField name="street" value="${clientInstance.address?.street}" />
                                </td>
                            </tr>

                            
                        	<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="city"><g:message code="address.city.label" default="City" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: clientInstance, field: 'address.city', 'errors')}">
                                    <g:textField name="city" value="${clientInstance.address?.city}" />
                                </td>
                            </tr>
                                                    
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="postalCode"><g:message code="address.postalCode.label" default="Postal Code" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: clientInstance, field: 'address.postalCode', 'errors')}">
                                    <g:textField name="postalCode" value="${clientInstance.address?.postalCode}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="allergy"><g:message code="client.allergy.label" default="Allergy" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: clientInstance, field: 'allergy', 'errors')}">
                                    <g:textField name="allergy" value="${clientInstance?.allergy}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="comment"><g:message code="client.comment.label" default="Comment" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: clientInstance, field: 'comment', 'errors')}">
                                    <g:textField name="comment" value="${clientInstance?.comment}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="family"><g:message code="client.family.label" default="Family" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: clientInstance, field: 'family', 'errors')}">
                                    <g:textField name="family" value="${clientInstance?.family}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="recommendation"><g:message code="client.recommendation.label" default="Recommendation" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: clientInstance, field: 'recommendation', 'errors')}">
                                    <g:textField name="recommendation" value="${clientInstance?.recommendation}" />
                                </td>
                            </tr>
                                               
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="workPhone"><g:message code="client.workPhone.label" default="Work Phone" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: clientInstance, field: 'workPhone', 'errors')}">
                                    <g:textField name="workPhone" value="${clientInstance?.workPhone}" />
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
