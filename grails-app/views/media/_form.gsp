<%@ page import="com.summitbid.videojuke.Media" %>



<div class="fieldcontain ${hasErrors(bean: mediaInstance, field: 'url', 'error')} ">
	<label for="url">
		<g:message code="media.url.label" default="Url" />
		
	</label>
	<g:textField name="url" value="${mediaInstance?.url}"/>
</div>

