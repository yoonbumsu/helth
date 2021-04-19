package bisi;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.sun.crypto.provider.RSACipher;

public class BisiDAO {

	
	private Connection con;
	private	PreparedStatement pstmt;
	private ResultSet res;
	String dbURL="jdbc:oracle:thin:@localhost:1521:xe";
	String dbID="bisi";
	String dbPassword="tiger";
	String driver="oracle.jdbc.driver.OracleDriver";
	
	public BisiDAO(){
		try {
			
			Class.forName(driver);
			con =DriverManager.getConnection(dbURL,dbID,dbPassword);
			
		} catch (Exception e) {
			e.printStackTrace();//�����������
		}
	}
	
	public String getDate() {
			String SQL="SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD') FROM bisi ";
			
			try {
				PreparedStatement pstmt=con.prepareStatement(SQL);
				res=pstmt.executeQuery();
				if(res.next()) {
					return res.getString(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "";//�����ͺ��̽� ����
	}

	public int getNext() {
			String SQL="SELECT bisiID FROM  BISI ORDER BY bisiID DESC";
			
			try {
				PreparedStatement pstmt=con.prepareStatement(SQL);
				res=pstmt.executeQuery();
				if(res.next()) {
					return res.getInt(1)+1;
				}
				return 1;//ù��° �Խù��ϰ��
			} catch (Exception e) {
				e.printStackTrace();
			}
			return -1;//�����ͺ��̽� ����
	}
	public int wirte(String bisiTitle, String userID,String bisiContent) {
		String SQL="INSERT INTO BISI VALUES(?,?,?,?,?,?)";
		
		try {
			PreparedStatement pstmt=con.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bisiTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bisiContent);
		
			pstmt.setInt(6,1);
			
			return pstmt.executeUpdate();
		
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;//�����ͺ��̽� ����
	}
}
