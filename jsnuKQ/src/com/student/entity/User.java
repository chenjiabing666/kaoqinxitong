package com.student.entity;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

/*
 * 学生的实体类
 * */
@Entity
public class User {
	private Integer id; // 主键
	private String studentId; // 学号
	private String name; // 姓名
	private String password;
	private String sex; // 性别
	private String coolege; // 学院
	private String cls; // 班级
	private long telephone; // 电话号码
	private String grade;   //年级

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", studentId=" + studentId + ", name=" + name
				+ ", password=" + password + ", sex=" + sex + ", coolege="
				+ coolege + ", cls=" + cls + ", telephone=" + telephone
				+ ", situations=" + situations + "]";
	}

	private Set<Situation> situations;
	
	//一对多的时候默认的是懒加载，但是在ssh中，事务是自动提交的，一旦find执行完之后就会提交，那么此时就没有session了，因此这里必须实现Eager
	@OneToMany(cascade=CascadeType.ALL,fetch=FetchType.EAGER)
	@JoinColumn(name="user_id")
	public Set<Situation> getSituations() {
		return situations;
	}

	public void setSituations(Set<Situation> situations) {
		this.situations = situations;
	}

	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public String getPassword() {
		return password;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getStudentId() {
		return studentId;
	}

	public String getSex() {
		return sex;
	}

	public String getCoolege() {
		return coolege;
	}

	public String getCls() {
		return cls;
	}

	public long getTelephone() {
		return telephone;
	}

	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public void setCoolege(String coolege) {
		this.coolege = coolege;
	}

	public void setCls(String cls) {
		this.cls = cls;
	}

	public void setTelephone(long telephone) {
		this.telephone = telephone;
	}

}
