package egovframework.example.limitchange.service;

public class LimitchangeVO extends LimitchangeDefaultVO{

	
	private static final long serialVersionUID = 1L;

	private String rownum;
	private String no;
	private String corp_regist_num;
	private String store_id;
	private String limit_amt;
	private String name;
	private String email;
	private String phone_num;
	private String reason;
	private String state;
	private String reply;
	private String created_id;
	private String created_datetime;
	
	public String getRownum() {
		return rownum;
	}
	public void setRownum(String rownum) {
		this.rownum = rownum;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getCreated_id() {
		return created_id;
	}
	public void setCreated_id(String created_id) {
		this.created_id = created_id;
	}
	public String getCreated_datetime() {
		return created_datetime;
	}
	public void setCreated_datetime(String created_datetime) {
		this.created_datetime = created_datetime;
	}
	public String getUpdated_id() {
		return updated_id;
	}
	public void setUpdated_id(String updated_id) {
		this.updated_id = updated_id;
	}
	public String getUpdated_datetime() {
		return updated_datetime;
	}
	public void setUpdated_datetime(String updated_datetime) {
		this.updated_datetime = updated_datetime;
	}
	private String updated_id;
	private String updated_datetime;
	
	public String getCorp_regist_num() {
		return corp_regist_num;
	}
	public void setCorp_regist_num(String corp_regist_num) {
		this.corp_regist_num = corp_regist_num;
	}

	public String getStore_id() {
		return store_id;
	}
	public void setStore_id(String store_id) {
		this.store_id = store_id;
	}
	public String getLimit_amt() {
		return limit_amt;
	}
	public void setLimit_amt(String limit_amt) {
		this.limit_amt = limit_amt;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone_num() {
		return phone_num;
	}
	public void setPhone_num(String phone_num) {
		this.phone_num = phone_num;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	
	
	
}
