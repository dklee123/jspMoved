package human.vo;

public class ClientVo {
	
	private int rn;
	private String oderno;
	private String name;
//	private String mdate;
	private String origin;
	private String destin;
	private int cost;
	private String process;
	private String m_date;
	
	
	
	
	public String getM_date() {
		return m_date;
	}
	public void setM_date(String m_date) {
		this.m_date = m_date;
	}
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
	}
	public String getOderno() {
		return oderno;
	}
	public void setOderno(String oderno) {
		this.oderno = oderno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
//	public String getMdate() {
//		return mdate;
//	}
//	public void setMdate(String mdate) {
//		this.mdate = mdate;
//	}
	public String getOrigin() {
		return origin;
	}
	public void setOrigin(String origin) {
		this.origin = origin;
	}
	public String getDestin() {
		return destin;
	}
	public void setDestin(String destin) {
		this.destin = destin;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	public String getProcess() {
		return process;
	}
	public void setProcess(String process) {
		this.process = process;
	}

}
