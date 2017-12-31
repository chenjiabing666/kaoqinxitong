package com.admin.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate5.HibernateTemplate;

import com.admin.entity.Admin;
import com.student.dao.UserDao;
import com.student.entity.User;
import com.tools.function.Tools;

public class AdminDaoImpl implements AdminDao {
	@Resource(name = "hibernateTemplate")
	// 注入属性
	private HibernateTemplate hibernateTemplate;

	@Resource(name = "userDaoImpl")
	private UserDao userDao;

	@Override
	public void add(Admin admin) {
		hibernateTemplate.save(admin); // 增加用户

	}

	@Override
	/*
	 * 根据传送过来的数据验证用户是否存在，如果存在验证该用户的密码是否正确
	 */
	public Boolean VerificationPssword(Admin admin) {
		Admin a = this.getAdminObject(admin.getTeacherId()); // 获取返回的对象
		// 如果长度为0表示没有查到
		if (a == null) {
			return false; // 返回false，用户不存在
		} else { // 如果长度不为0，表示存在这个用户
			// 如果用户输入的密码和数据库中的密码相同，那么返回true，否则返回false
			if (admin.getPassword().equals(a.getPassword())) {
				return true;
			}
			return false;
		}

	}

	@Override
	public Boolean VerificationID(Admin admin) {
		// 根据id获取对象
		Admin a = this.getAdminObject(admin.getTeacherId());
		if (a == null) {
			return false;
		} else {
			return true;
		}
	}

	/*
	 * 根据教工号查询对象，teacherID是教工号
	 */
	public Admin getAdminObject(String teacherId) {
		String hql = "from Admin admin where admin.teacherId=?"; // 根据教工号查询对象
		List<Admin> list = (List<Admin>) hibernateTemplate.find(hql, teacherId);
		if (list.size() != 0) {
			return list.get(0); // 返回第一个对象即可
		} else {
			return null;
		}
	}

	// 返回学院的列表
	public List<String> getcoolege() {
		String hql = "select distinct coolege from User"; // 编写hql语句
		List<String> list = (List<String>) hibernateTemplate.find(hql); // 返回字段，注意是一个List类型的
		if (list.size() == 0) {
			return null;
		}
		return list;
	}

	// 返回班级的列表
	public List<String> getcls() {
		String hql = "select distinct cls from User";
		List<String> list = (List<String>) hibernateTemplate.find(hql);
		if (list.size() == 0) {
			return null;
		}
		return list;
	}

	// 根据年级学院班级获取所有学生的信息
	public List<User> getUserList(String grade, String coolege, String cls) {
		String hql = "from User user  where user.grade=? and user.coolege=? and user.cls=? order by user.studentId asc ";
		List<User> list = (List<User>) hibernateTemplate.find(hql, grade,
				coolege, cls);
		if (list.size() == 0) {
			return null;
		}
		return list;
	}

	public Boolean delete(int id) {
		User user = hibernateTemplate.get(User.class, id); // 获取对象
		if (user != null) {
			hibernateTemplate.delete(user);
			return true;
		}
		return false;

	}

	@Override
	public Boolean changeUser(int id, User user) {
		User u = hibernateTemplate.get(User.class, id); // 获取对象
		if (u != null) {
			// 重新设置新的值
			u.setCls(user.getCls());
			u.setGrade(user.getGrade());
			u.setSex(user.getSex());
			u.setName(user.getName());
			hibernateTemplate.update(u); // 更新
			return true;
		}
		return false;

	}

	@Override
	public List<String> getTeacherGrade() {
		String hql = "select distinct grade from Admin "; // hql语句
		List<String> list = (List<String>) hibernateTemplate.find(hql); // 指定find语句，返回的使用一个list类型的
		// 如果其中有值，那么返回list集合
		if (list.size() != 0) {
			return list;
		}
		return null;
	}

	@Override
	public List<String> getTeacherCoolege() {
		String hql = "select distinct coolege from Admin "; // hql语句
		List<String> list = (List<String>) hibernateTemplate.find(hql); // 执行find
		if (list.size() != 0) {
			return list;
		}

		return null;
	}

	@Override
	public List<Admin> getTeacherList(String grade, String coolege) {
		String hql = "from Admin admin where admin.grade=? and admin.coolege=? and admin.role=? order by admin.teacherId asc";// hql语句
		List<Admin> list = (List<Admin>) hibernateTemplate.find(hql, grade,
				coolege, Tools.TEACHER); // 执行find语句
		// 如果size不为0，表示有值，那么返回即可
		if (list.size() != 0) {
			return list;
		}

		return null;
	}

	@Override
	public Boolean deleteTeacher(int id) {
		Admin admin = hibernateTemplate.get(Admin.class, id); // 获取对象
		if (admin != null) {
			hibernateTemplate.delete(admin); // 删除这一行
			return true;
		}
		return false;
	}

	@Override
	public Boolean chageTeacher(int id, Admin admin) {
		Admin a = hibernateTemplate.get(Admin.class, id); // 根据id获取对象
		if (a != null) {
			a.setName(admin.getName()); // 设置姓名
			a.setSex(admin.getSex()); // 设置性别
			a.setCoolege(admin.getCoolege()); // 设置学院
			a.setGrade(admin.getGrade()); // 设置年级
			hibernateTemplate.update(a); // 执行更新操作、
			return true;
		}
		return false;
	}

	@Override
	public Boolean verificationTeacherID(String teacherId) {
		String hql = "from Admin admin where admin.teacherId=?";
		List<Admin> list = (List<Admin>) hibernateTemplate.find(hql, teacherId);
		if (list.size() != 0) {
			return true;
		}
		return false;

	}

}
