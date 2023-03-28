package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class memberDAO {

	private SqlSessionFactory factory = SqlSessionManager.getFactory();

	public int signup(memberDTO dto) {
		
		

		
		
		int cnt = 0;

		SqlSession session = factory.openSession(true);

		try {
			cnt = session.insert("signup", dto);

		} catch (Exception e) {

		} finally {
			session.close();

		}

		return cnt;
	}

}
