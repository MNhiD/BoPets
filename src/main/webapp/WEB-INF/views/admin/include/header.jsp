<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"  %>
<c:url value="/resources/admin/assets" var="url"></c:url>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>BoPets - Administrator</title>
    <link href="${url}/css/style.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${url }/css/admin.css">
    <link rel="stylesheet" href="${url }/css/common.css">
    <link rel="stylesheet" href="${url }/css/order.css">
    <link rel="stylesheet" href="${url }/css/product.css">
</head>
<body>
    <div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>
    <div id="main-wrapper" data-layout="vertical" data-navbarbg="skin5" data-sidebartype="full" data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">