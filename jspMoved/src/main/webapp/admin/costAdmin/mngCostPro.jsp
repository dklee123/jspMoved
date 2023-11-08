<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="human.vo.CostVo" %>
<%@ page import="human.dao.CostDao" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상품 가격 업데이트</title>
</head>
<body>
    <%
        Enumeration<String> paramNames = request.getParameterNames();
        CostDao costDao = new CostDao();
        int rowsUpdated = 0;

        while (paramNames.hasMoreElements()) {
            String paramName = paramNames.nextElement();

            if (paramName.startsWith("price_")) {
                String name = paramName.substring(6);
                int price = Integer.parseInt(request.getParameter(paramName));

                CostVo costvo = new CostVo();
                costvo.setName(name);
                costvo.setPrice(price);

                int updated = costDao.updatePrice(costvo);
                if (updated > 0) {
                    rowsUpdated++;
                }
            }
        }

        if (rowsUpdated > 0) {
            out.println("업데이트가 성공적으로 이루어졌습니다.");
        } else {
            out.println("업데이트에 실패했습니다. 다시 시도하세요.");
        }
    %>

</body>
</html>
