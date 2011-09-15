
<%@ page import="gabinet.Client" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'client.label', default: 'Client')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create" controller="surgery" params="[id:clientInstance.id]">New Surgery For Client</g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="client.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: clientInstance, field: "id")}</td>
                            
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="client.firstName.label" default="First Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: clientInstance, field: "firstName")}</td>
                            
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="client.surName.label" default="Sur Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: clientInstance, field: "surName")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="client.address.label" default="Address" /></td>
                            
                            <td valign="top" class="value"><g:link controller="address" action="show" id="${clientInstance?.address?.id}">${clientInstance?.address?.city}, ${clientInstance?.address?.street}, ${clientInstance?.address?.postalCode}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="client.allergy.label" default="Allergy" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: clientInstance, field: "allergy")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="client.birthDate.label" default="Birth Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate format="yyyy-MM-dd" date="${clientInstance?.birthDate}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="client.cellPhone.label" default="Cell Phone" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: clientInstance, field: "cellPhone")}</td>
                            
                        </tr>
                                            
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="client.homePhone.label" default="Home Phone" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: clientInstance, field: "homePhone")}</td>
                            
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="client.workPhone.label" default="Work Phone" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: clientInstance, field: "workPhone")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="client.comment.label" default="Comment" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: clientInstance, field: "comment")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="client.family.label" default="Family" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: clientInstance, field: "family")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="client.recommendation.label" default="Recommendation" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: clientInstance, field: "recommendation")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="client.surgeies.label" default="Surgeies" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${clientInstance.surgeies}" var="s">
                                //data bez godziny
                                    <li><g:link controller="surgery" action="show" id="${s.id}"><g:formatDate format="yyyy-MM-dd" date="${s.date}"/>,${s.surgery}, ${s?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${clientInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
