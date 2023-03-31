package com.smhrd.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class reviewDAO {
	
	private SqlSessionFactory factory = SqlSessionManager.getFactory();
	public int write(reviewDTO dto) {
		int cnt = 0;

		// 글 작성

		// 1. sqlsession 빌려오기
		SqlSession session = factory.openSession(true);
		try {
			// 2. mapper.xml 파일안에 있는 sql구문 중에 사용하고 싶은 sql 구문 정해주기
			// session.insert("mapper파일식별자.sql구문식별자", mapper파일로 넘기고 싶은 매개변수)
			// session.update
			// session.delete
			// selectAll
			// selecton
			cnt = session.insert("InsertReview", dto);
		} finally {
			// 3. sqlsession 반납
			session.close();
		}
		return cnt;
	}
	
	public ArrayList<reviewDTO> search() {
		ArrayList<reviewDTO> review_list= null;
		// 1. SqlSession 빌려오기
		SqlSession session = factory.openSession(true);
		try {
			// 2. session을 활용해서 검색 기능 실시
			review_list = (ArrayList)session.selectList("reviewAll");
		} finally {
			// 3. session 결과값 반납
			session.close();
		}
		// 4. 결과값 반환
		return review_list;
	}
	public int delete(reviewDTO dto) {
		int cnt = 0;

		// 글 작성

		// 1. sqlsession 빌려오기
		SqlSession session = factory.openSession(true);
		try {
			// 2. mapper.xml 파일안에 있는 sql구문 중에 사용하고 싶은 sql 구문 정해주기
			// session.insert("mapper파일식별자.sql구문식별자", mapper파일로 넘기고 싶은 매개변수)
			// session.update
			// session.delete
			// selectAll
			// selecton
			cnt = session.delete("reviewDelete", dto);
		} finally {
			// 3. sqlsession 반납
			session.close();
		}
		return cnt;
	}

	



}
