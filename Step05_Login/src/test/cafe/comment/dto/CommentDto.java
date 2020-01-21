package test.cafe.comment.dto;

public class CommentDto {
	private int num;
	private String writer;
	private String content;
	private String regdate;
	private String ip;
	private int writeNum;
	private int rnum;
	public CommentDto() {}
	public CommentDto(int num, String writer, String content, String regdate, String ip, int writeNum, int rnum) {
		super();
		this.num = num;
		this.writer = writer;
		this.content = content;
		this.regdate = regdate;
		this.ip = ip;
		this.writeNum = writeNum;
		this.rnum = rnum;
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
	public int getWriteNum() {
		return writeNum;
	}
	public void setWriteNum(int writeNum) {
		this.writeNum = writeNum;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	
	
}
