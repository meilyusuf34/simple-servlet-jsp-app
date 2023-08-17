<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.yusuf.servlet.WelcomeServlet"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="assets/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function() {
                    $(".student-id").click(function() {
                        var studentName = $(this).data("student-name");
                        $("#popupStudentName").text(studentName);
                        $("#popup").modal("show");
                    });
                });
    </script>
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center mb-4">Student Dashboard</h1>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Department</th>
                    <th>Student ID</th>
                    <th>Mark</th>
                    <th>Pass Percentage</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="student" items="${students}" varStatus="loop">
                    <tr class="student-row">
                        <c:if test="${loop.first || !student.department.equals(prevDepartment)}">
                            <c:set var="rowsSpan" value="${WelcomeServlet.calculateRowspan(students, student.department)}" />
                            <td rowspan="${rowsSpan}">${student.department}</td>
                        </c:if>
                        <td><a class="student-id" data-student-name="${student.studentName}" href="#">${student.studentId}</a></td>
                        <td class="student-name" hidden>${student.studentName}</td>
                        <td class="mark">${student.mark}</td>
                        <c:if test="${loop.first || !student.department.equals(prevDepartment)}">
                            <c:set var="rowsSpan" value="${WelcomeServlet.calculateRowspan(students, student.department)}" />
                                <td rowspan="${rowsSpan}">${WelcomeServlet.calculatePassPercentage(students, student.department)}%</td>
                        </c:if>
                    </tr>
                    <c:set var="prevDepartment" value="${student.department}" />
                </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="modal fade" id="popup" tabindex="-1" role="dialog" aria-labelledby="popupTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="popupTitle">Student Details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p><strong>Student Name:</strong> <span id="popupStudentName"></span></p>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
