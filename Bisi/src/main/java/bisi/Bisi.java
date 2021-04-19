package bisi;

public class Bisi {
	
	private int  bisiID ;
	public int getBisiID() {
		return bisiID;
	}
	public void setBisiID(int bisiID) {
		this.bisiID = bisiID;
	}
	public String getBisiTitle() {
		return bisiTitle;
	}
	public void setBisiTitle(String bisiTitle) {
		this.bisiTitle = bisiTitle;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getBisiDate() {
		return bisiDate;
	}
	public void setBisiDate(String bisiDate) {
		this.bisiDate = bisiDate;
	}
	public String getBisiContent() {
		return bisiContent;
	}
	public void setBisiContent(String bisiContent) {
		this.bisiContent = bisiContent;
	}
	public int getBisiAvailable() {
		return bisiAvailable;
	}
	public void setBisiAvailable(int bisiAvailable) {
		this.bisiAvailable = bisiAvailable;
	}
	public String getUserPhoto() {
		return userPhoto;
	}
	public void setUserPhoto(String userPhoto) {
		this.userPhoto = userPhoto;
	}
	private String  bisiTitle;
	private String  userID;
	private String  bisiDate;
	private String  bisiContent;
	private int   bisiAvailable;
	private String userPhoto;
}
