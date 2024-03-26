<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Calculator</title>
</head>
<body>
    <h2>Simple Calculator</h2>
    <form method="post">
        <input type="number" name="num1" placeholder="Enter first number" required><br>
        <input type="number" name="num2" placeholder="Enter second number" required><br>
        <select name="operator">
            <option value="add">+</option>
            <option value="subtract">-</option>
            <option value="multiply">*</option>
            <option value="divide">/</option>
        </select><br>
        <input type="submit" value="Calculate">
    </form>

    <%-- Java code for performing calculations --%>
    <%
        if (request.getMethod().equals("POST")) {
            double num1 = Double.parseDouble(request.getParameter("num1"));
            double num2 = Double.parseDouble(request.getParameter("num2"));
            String operator = request.getParameter("operator");
            double result = 0;

            if (operator.equals("add")) {
                result = num1 + num2;
            } else if (operator.equals("subtract")) {
                result = num1 - num2;
            } else if (operator.equals("multiply")) {
                result = num1 * num2;
            } else if (operator.equals("divide")) {
                if (num2 != 0) {
                    result = num1 / num2;
                } else {
                    out.println("Error: Division by zero");
                    return;
                }
            }

            out.println("<h3>Result: " + result + "</h3>");
        }
    %>
</body>
</html>
