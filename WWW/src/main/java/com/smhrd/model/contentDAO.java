package com.smhrd.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class contentDAO {
	private SqlSessionFactory factory = SqlSessionManager.getFactory();

	public int join(contentDTO dto) {
		int cnt = 0;

		// 회원 가입 기능 수행 --> 데이터 베이스에 데이터 추가하기
		// 데이터 베이스 접근하려면 connection(sqlsession) 필요

		// 1. sqlsession 빌려오기
		SqlSession session = factory.openSession(true);
		try {
			// 2. mapper.xml 파일안에 있는 sql구문 중에 사용하고 싶은 sql 구문 정해주기
			// session.insert("mapper파일식별자.sql구문식별자", mapper파일로 넘기고 싶은 매개변수)
			// session.update
			// session.delete
			// selectAll
			// selecton
			cnt = session.insert("join", dto);
		} finally {
			// 3. sqlsession 반납
			session.close();
		}
		return cnt;
	}
	
	public ArrayList<contentDTO> search() {
		ArrayList<contentDTO> content_list= null;
		// 1. SqlSession 빌려오기
		SqlSession session = factory.openSession(true);
		try {
			// 2. session을 활용해서 구문 실행(로그인 기능)
			content_list = (ArrayList)session.selectList("Search");
		} finally {
			// 3. session 결과값 반납
			session.close();
		}
		// 4. 결과값 반환
		return content_list;
	}

}
