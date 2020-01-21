package test.cafe.comment.dto;

public class CommentDto {
	private int num;
	private String writer;
	private String content;
	private String regdate;
	private String ip;
	public CommentDto() {}
	public CommentDto(int num, String writer, String content, String regdate, String ip) {
		super();
		this.num = num;
		this.writer = writer;
		this.content = content;
		this.regdate = regdate;
		this.ip = ip;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	
}
