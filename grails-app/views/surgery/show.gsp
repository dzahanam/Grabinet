
<%@ page import="gabinet.Surgery" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'surgery.label', default: 'Surgery')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <%--<span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        --%></div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop odd header">
                            <td valign="top" class="name"><g:message code="client.label" default="Client" /></td>
                            
                            <td valign="top" class="value"><g:link controller="client" action="show" id="${surgeryInstance.client.id}">${fieldValue(bean: surgeryInstance.client, field: "firstName")}	${fieldValue(bean: surgeryInstance.client, field: "surName")}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="surgery.date.label" default="Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate format="yyyy-MM-dd" date="${surgeryInstance?.date}" /></td>
                            
                        </tr>
                    
                        <tr class="prop odd">
                            <td valign="top" class="name"><g:message code="surgery.recommendation.label" default="Recommendation" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: surgeryInstance, field: "recommendation")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="surgery.skin.label" default="Skin" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: surgeryInstance, field: "skin")}</td>
                            
                        </tr>
                    
                        <tr class="prop odd">
                            <td valign="top" class="name"><g:message code="surgery.surgery.label" default="Surgery" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: surgeryInstance, field: "surgery")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="surgery.therapy.label" default="Therapy" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: surgeryInstance, field: "therapy")}</td>
                            
                        </tr>
                        
                        <g:if test="${surgeryInstance.picture != null}">
                        <tr class="prop odd">
                            <td valign="top" class="name"><g:message code="surgery.picture.label" default="Picture" /></td>
                            
                            <td valign="top" class="value">
    	                        	<img class="pic_small" src="${createLink(controller:'surgery', action:'viewImage', id:surgeryInstance.id)}" />
	                            	<g:actionSubmit class="delete" action="deletePicture" value="Delete Picture" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />

                            </td>
                            
                        </tr>
						</g:if>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${surgeryInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
