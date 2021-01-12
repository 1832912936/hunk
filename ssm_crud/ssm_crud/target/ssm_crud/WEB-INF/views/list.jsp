
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>员工列表</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <%--web路径
        不以/开始的相对路径，找资源，以当前资源的路径为基准，比较容易出问题
        以/开始的相对路径，找资源，以服务器的路径为准(http://localhost:8080/ssm_crud_war_exploded);需要加上项目名
        http://localhost:8080/ssm_crud_war_exploded
    --%>
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery1.12.4.min.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>

<%-- 搭建显示页面 --%>
<div class="container">
    <%-- 标题 --%>
    <div class="row">
        <div class="col-md-12">
            <h1>SSM_CRUD</h1>
        </div>
    </div>
    <%-- 按钮 --%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary">新增</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>
    <%-- 显示表格数据 --%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover">
                <tr>
                    <th>#</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${pageInfo.list}" var="emr">
                    <tr>
                        <th>${emr.REGNO}</th>
                        <th>${emr.NAME}</th>
                        <th>${emr.SEX=="1"?"男":"女"}</th>
                        <th>${emr.age}</th>

                        <th>
                            <button class="btn btn-primary btn-sm">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                编辑
                            </button>
                            <button class="btn btn-danger btn-sm">
                                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                删除
                            </button>
                        </th>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>

    <%-- 显示分页信息 --%>
    <div class="row">
        <%-- 分页文字信息 --%>
        <div class="col-md-6">
            当前${pageInfo.pageNum}页,&nbsp;&nbsp;总${pageInfo.pages}页,&nbsp;&nbsp;总${pageInfo.total}记录数
        </div>
        <%-- 分页条信息 --%>
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li><a href="${APP_PATH}/findEmr?pn=1">首页</a></li>
                    <c:if test="${pageInfo.hasPreviousPage}"><%--是否有上一页--%>
                        <li>
                            <a href="${APP_PATH}/findEmr?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">
                        <c:if test="${page_Num == pageInfo.pageNum}">
                            <li class="active"><a href="${APP_PATH}/findEmr?pn=${page_Num}">${page_Num}</a></li>
                        </c:if>
                        <c:if test="${page_Num != pageInfo.pageNum}">
                            <li><a href="${APP_PATH}/findEmr?pn=${page_Num}">${page_Num}</a></li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${pageInfo.hasNextPage}"><%--是否有下一页--%>
                        <li>
                            <a href="${APP_PATH}/findEmr?pn=${pageInfo.pageNum+1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <li><a href="${APP_PATH}/findEmr?pn=${pageInfo.pages}">尾页</a></li><%--pages 总页码--%>
                </ul>
            </nav>
        </div>
    </div>
</div>

</body>

</html>
