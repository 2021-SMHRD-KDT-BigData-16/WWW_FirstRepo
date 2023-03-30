package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class boardDAO {
	private SqlSessionFactory factory = SqlSessionManager.getFactory();
	
	
	public int checkLike(boardDTO dto) {
		int row = 0;
		// 회원 가입 기능 수행 --> 데이터 베이스에 데이터 추가하기
		// 데이터 베이스 접근하려면 connection(sqlsession) 필요
		// 1. sqlsession 빌려오기
		SqlSession session = factory.openSession(true);
		try {
			row = session.selectOne("checkLike",dto);
		} finally {
			// 3. sqlsession 반납
			session.close();
		}
		return row;
	}
	public int likeUp(boardDTO dto) {
		
		int row = 0;
		// 회원 가입 기능 수행 --> 데이터 베이스에 데이터 추가하기
		// 데이터 베이스 접근하려면 connection(sqlsession) 필요
		// 1. sqlsession 빌려오기
		SqlSession session = factory.openSession(true);
		try {
			row = session.insert("likeUp",dto);
		} finally {
			// 3. sqlsession 반납
			session.close();
		}
		return row;
	}
	public int likeDown(boardDTO dto) {
		
		int row = 0;
		// 회원 가입 기능 수행 --> 데이터 베이스에 데이터 추가하기
		// 데이터 베이스 접근하려면 connection(sqlsession) 필요
		// 1. sqlsession 빌려오기
		SqlSession session = factory.openSession(true);
		try {
			row = session.delete("likeDown",dto);
		} finally {
			// 3. sqlsession 반납
			session.close();
		}
		return row;
	}

}
