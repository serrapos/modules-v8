<%@page buffer="none" session="false" taglibs="c,cms" %>

<div> 
<c:set var="operant1" value="${param.operant1}" />
<c:set var="operant2" value="${param.operant2}" />

<c:if test="${(!empty operant1)&&(!empty operant2)}">
	
	<c:catch var="error">
		<c:choose>
			<c:when test="${param.operator == '+'}">
				<c:set var="result" value="${operant1+ operant2}" />
			</c:when>
			<c:when test="${param.operator == '-'}">
				<c:set var="result" value="${operant1 - operant2}" />	
			</c:when>
			<c:when test="${param.operator == '*'}">
				<c:set var="result" value="${operant1 * operant2}" />
			</c:when>
			<c:when test="${param.operator == '/'}">
				<c:set var="result" value="${operant1 / operant2}" />
			</c:when>
		</c:choose>
	</c:catch>
				
	<c:if test="${error == null}"	>
		<div class="view-article">
		
			<%-- Title of the article --%>
			<h2>Calculation result</h2>
			
			<%-- The text field of the article with image --%>
			<div class="paragraph">
				<c:out value="${operant1}" escapeXml="true"/><c:out value="${param.operator}" escapeXml="true"/><c:out value="${operant2}" escapeXml="true"/>=<c:out escapeXml="true" value="${result}"/>			
			</div>
		</div>
	</c:if>		
	<c:if test="${error != null}"	>
		<div class="view-article">
		
			<%-- Title of the article --%>
			<h2>Error</h2>
			
			<%-- The text field of the article with image --%>
			<div class="paragraph">				
				<p>Error occurs during the calculation. Please check the input fields.</p>								
			</div>
		</div>				
	</c:if>
	
</c:if>
</div>

