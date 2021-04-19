package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.omg.CORBA.PRIVATE_MEMBER;

public class UserDAO {

	private Connection con;
	private	PreparedStatement pstmt;
	private ResultSet res;
	String dbURL="jdbc:oracle:thin:@localhost:1521:xe";
	String dbID="bisi";
	String dbPassword="tiger";
	String driver="oracle.jdbc.driver.OracleDriver";
	
	public UserDAO(){
		try {
			
			Class.forName(driver);
			con =DriverManager.getConnection(dbURL,dbID,dbPassword);
			
		} catch (Exception e) {
			e.printStackTrace();//오류가어떤건지
		}
	}
	public int login(String userId,String userPassword) {
		String sql="SELECT userPassword FROM USERS WHERE userID=?";//유저아이디를 입력하면 유저아이디가 있는지 패스워드가 무엇인지
		
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,userId);
			res=pstmt.executeQuery();
			if(res.next()) {
				if(res.getString(1).equals(userPassword))
				return 1;
			else 
				return 0; //비밀번호 틀림 
			
		}
			return -1;//아이디없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return-2;//데이터베이스 오류
	}
	public int join(User user) {
		String SQL="INSERT INTO USERS VALUES(?,?,?,?,?)";
		try {
			pstmt =con.prepareStatement(SQL);
			pstmt.setString(1,user.getUserID());
			pstmt.setString(2,user.getUserPassword());
			pstmt.setString(3,user.getUserName());
			pstmt.setString(4,user.getUserGender());
			pstmt.setString(5,user.getUserEmail());
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
}
