package com.tools.function;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.junit.Test;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Transactional;

import com.student.entity.User;

public class HibernateUtils {

	
	@Test
	public void testAdd(){
		
		Date date=new Date();
		String model="yyyy-MM-dd HH:mm:ss";  //指定格式化的模板
		SimpleDateFormat dateFormat2=new SimpleDateFormat(model);
		String time=dateFormat2.format(date);
		
	}

}
