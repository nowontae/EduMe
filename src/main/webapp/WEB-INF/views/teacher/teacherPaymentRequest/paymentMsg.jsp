<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
window.alert('${msg}');
location.href='teacherPaymentRequest.do?midx=${sessionScope.midx}';
</script>