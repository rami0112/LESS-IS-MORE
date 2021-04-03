<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	
	if (confirm("${msg}") == true) {
		document.location.href='${trueUri}';
	} else {
		document.location.href='${falseUri}';
	}

</script>