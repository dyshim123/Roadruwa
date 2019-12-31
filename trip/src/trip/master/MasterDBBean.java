package trip.master;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MasterDBBean {
	private static MasterDBBean instance = new MasterDBBean();

	public static MasterDBBean getInstance() {
		return instance;
	}

private MasterDBBean() {}

	// Ŀ�ؼ�Ǯ�κ��� Ŀ�ؼǰ�ü�� ���� �޼ҵ�
	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/trip");
		return ds.getConnection();
	}

	// ������ ���� �޼ҵ�
	public int managerCheck(String id, String passwd) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpasswd = "";
		int x = -1;

		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("select managerPasswd from manager where managerId = ? ");
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				dbpasswd = rs.getString("managerPasswd");
				if (dbpasswd.equals(passwd))
					x = 1; // ���� ����
				else
					x = 0; // ��й�ȣ Ʋ��
			} else
				x = -1;// �ش� ���̵� ����

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return x;
	}

}
