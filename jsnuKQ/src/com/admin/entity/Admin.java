package com.admin.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

/*
 * 教师的实体类
 */
@Entity
public class Admin {
	private Integer id; // 主键
	private String name; // 姓名
	private String teacherId; // 教工号
	private Long telephone; // 电话号码
	private String password; // 密码
	private String sex; // 性别
	private String role; // 角色，主要用来控制权限
	private String coolege; // 学院，教师也是分学院的
	private String grade; // 年级，教师也是分年级的

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getCoolege() {
		return coolege;
	}

	public void setCoolege(String coolege) {
		this.coolege = coolege;
	}

	@Id
	// 主键
	@GeneratedValue
	// 主键自增长
	public Integer getId() {
		return id;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getName() {
		return name;
	}

	public String getTeacherId() {
		return teacherId;
	}

	public Long getTelephone() {
		return telephone;
	}

	public String getPassword() {
		return password;
	}

	public String getSex() {
		return sex;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
	}

	public void setTelephone(Long telephone) {
		this.telephone = telephone;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

}
