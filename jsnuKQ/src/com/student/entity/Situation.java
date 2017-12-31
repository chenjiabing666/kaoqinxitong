package com.student.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/*
 * 记录学生上课的情况的一张表
 */
@Entity
public class Situation {
	private Integer id; // 主键
	private String state; // 每天的状态，有上课，迟到，请假
	private Date date; // 记录点名的日期
	private String teacherName; // 老师的姓名

	public String getTeacherName() {
		return teacherName;
	}

	public String getState() {
		return state;
	}

	@Override
	public String toString() {
		return "Situation [id=" + id + ", state=" + state + ", date=" + date
				+ ", teacherName=" + teacherName + "]";
	}

	public void setState(String state) {
		this.state = state;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}

	// 精确到秒
	@Temporal(TemporalType.TIMESTAMP)
	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

}
