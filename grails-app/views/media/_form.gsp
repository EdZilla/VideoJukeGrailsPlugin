<%@ page import="com.summitbid.videojuke.Media" %>



<div class="fieldcontain ${hasErrors(bean: mediaInstance, field: 'filename', 'error')} ">
	<label for="filename">
		<g:message code="media.filename.label" default="Filename" />
		
	</label>
	<g:textField name="filename" value="${mediaInstance?.filename}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: mediaInstance, field: 'url', 'error')} ">
	<label for="url">
		<g:message code="media.url.label" default="Url" />
		
	</label>
	<g:textField name="url" value="${mediaInstance?.url}"/>
</div>

