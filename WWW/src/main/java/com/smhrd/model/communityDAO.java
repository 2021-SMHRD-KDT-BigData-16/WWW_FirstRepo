package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class communityDAO {
	private SqlSessionFactory factory = SqlSessionManager.getFactory();

	public List<communityDTO> selectAll() {
		List<communityDTO> list = null;
		// 회원 가입 기능 수행 --> 데이터 베이스에 데이터 추가하기
		// 데이터 베이스 접근하려면 connection(sqlsession) 필요
		// 1. sqlsession 빌려오기
		SqlSession session = factory.openSession(true);
		try {
			list = session.selectList("SearchAll");
			
		} finally {
			// 3. sqlsession 반납
			session.close();
		}
		return list;
	}
}
