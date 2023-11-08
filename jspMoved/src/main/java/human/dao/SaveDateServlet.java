package human.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/savetest")
public class SaveDateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String date = request.getParameter("date");

        if (date != null && !date.isEmpty()) {
            String url = "jdbc:oracle:thin:@localhost:1521:orcl";
            String user = "jsp";
            String passwd = "123456";

            try {
                Class.forName("oracle.jdbc.driver.OracleDriver");

                Connection conn = DriverManager.getConnection(url, user, passwd);

                String sql = "INSERT INTO CALENDAR (end_date) VALUES (?)";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, date);

                int rowsInserted = pstmt.executeUpdate();
                if (rowsInserted > 0) {
                    System.out.println("날짜가 성공적으로 저장되었습니다.");
                } else {
                    System.out.println("날짜 저장 실패");
                }

                pstmt.close();
                conn.close();
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
            }
        }
    }
}
