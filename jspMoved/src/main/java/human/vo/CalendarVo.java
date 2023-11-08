package human.vo;

import java.util.Date;

public class CalendarVo {
    private int id;
    private String content;
    private Date endDate;
    
    public CalendarVo(int id, String content, Date endDate) {
    	super();
    	this.id = id;
    	this.content = content;
    	this.endDate = endDate;
    }
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
}
