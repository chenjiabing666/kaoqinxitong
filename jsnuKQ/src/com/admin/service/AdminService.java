package com.admin.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.transaction.annotation.Transactional;

import com.admin.dao.AdminDao;
import com.admin.dao.AdminDaoImpl;
import com.admin.entity.Admin;
import com.student.dao.UserDao;
import com.student.entity.User;

@Transactional
// 开启事务
public class AdminService {
	@Resource(name = "adminDaoImpl")
	// 注入属性
	private AdminDao adminDao; // AdminDao这个接口的对象
	

	// 增加用户
	public void add(Admin admin) {
		adminDao.add(admin); // 调用dao的add方法
	}

	public boolean VerificationPssword(Admin admin) {
		return adminDao.VerificationPssword(admin);
	}

	public boolean VerificationID(Admin admin) {

		return adminDao.VerificationID(admin);
	}

	// 根据教工号获取对象
	public Admin getAdminObject(String teacherId) {
		return adminDao.getAdminObject(teacherId);
	}

	// 返回学院信息
	public List<String> getcoolege() {
		return adminDao.getcoolege();
	}

	// 返回班级的列表
	public List<String> getcls() {
		return adminDao.getcls();
	}

	// 根据年级学院班级获取所有学生的信息
	public List<User> getUserList(String grade, String coolege, String cls) {
		return adminDao.getUserList(grade, coolege, cls);
	}

	// 根据id删除学生信息
	public Boolean delete(int id) {
		return adminDao.delete(id);
	}

	// 根据教师的id删除这个教师信息
	public Boolean deleteTeacher(int id) {
		return adminDao.deleteTeacher(id);
	}

	public Boolean changeUser(int id, User user) {
		return adminDao.changeUser(id, user);
	}

	// 获取所有老师信息中的年级信息
	public List<String> getTeacherGrade() {
		return adminDao.getTeacherGrade();
	}

	// 获取所有老师信息中的学院信息
	public List<String> getTeacherCoolege() {
		return adminDao.getTeacherCoolege();
	}

	/*
	 * 根据学院，年级获取所有的老师信息 grade ：年级 coolege:学院
	 */
	public List<Admin> getTeacherList(String grade, String coolege) {
		return adminDao.getTeacherList(grade, coolege);
	}

	// 根据学号修改教师的信息
	public Boolean chageTeacher(int id, Admin admin) {
		return adminDao.chageTeacher(id, admin);
	}
	
	//根据teacherId验证这个用于是否存在
		public Boolean verificationTeacherID(String teacherId){
			return adminDao.verificationTeacherID(teacherId);
		}

}
