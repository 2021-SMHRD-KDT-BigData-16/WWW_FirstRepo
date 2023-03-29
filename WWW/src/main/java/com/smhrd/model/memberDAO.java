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

	public memberDTO login(memberDTO dto) {
		
		// 1.sql session 불러오기
		SqlSession session = factory.openSession(true);
		memberDTO loginLogic = null;
		
		try {
			// 2. session 활용해서 sql구문 실행 (로그인기능)
			loginLogic = session.selectOne("login", dto);
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		
		return loginLogic;
	}

}
