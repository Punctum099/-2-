package com.gaesipan.pack.DTO;

public class uDTO {
	private int seq;
	private String id;
	private String password;
	private String local_email;
	private String domain_email;
	private String nickname;
	private String name;
	private String gender;
	private String birthday;
	private String tel;
	private String grade;
	private String goust;
	private String join_date;
	
	public uDTO(int seq, String id, String password, String local_email, String domain_email, String nickname,
			String name, String gender, String birthday, String tel, String grade, String goust, String join_date) {
		this.seq = seq;
		this.id = id;
		this.password = password;
		this.local_email = local_email;
		this.domain_email = domain_email;
		this.nickname = nickname;
		this.name = name;
		this.gender = gender;
		this.birthday = birthday;
		this.tel = tel;
		this.grade = grade;
		this.goust = goust;
	}
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getLocal_email() {
		return local_email;
	}
	public void setLocal_email(String local_email) {
		this.local_email = local_email;
	}
	public String getDomain_email() {
		return domain_email;
	}
	public void setDomain_email(String domain_email) {
		this.domain_email = domain_email;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getGoust() {
		return goust;
	}
	public void setGoust(String goust) {
		this.goust = goust;
	}
	public String getJoin_date() {
		return join_date;
	}
	public void setJoin_date(String join_date) {
		this.join_date = join_date;
	}
}
