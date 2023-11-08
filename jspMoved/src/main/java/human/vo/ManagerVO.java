package human.vo;

//관리자 정보 클래스
public class ManagerVO {
	
	private int num;
	private String pwd;
	private String name;
	private int phonenum;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPhonenum() {
		return phonenum;
	}
	public void setPhonenum(int phonenum) {
		this.phonenum = phonenum;
	}

	// 사번		-> private 멤버변수 선언
	// 비밀번호
	// 이름
	// 전화번호
	
	// getter, setter 만든 후
	
	// manager.jsp 에서
	// 사번: 1000
	// 비번 : admin123
	// 이름 : 박대용
	// 전화번호 : 123456
}
