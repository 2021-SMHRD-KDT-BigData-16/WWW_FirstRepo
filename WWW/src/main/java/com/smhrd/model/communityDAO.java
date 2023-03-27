package com.smhrd.model;

import java.sql.Array;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class communityDAO {
	private SqlSessionFactory factory = SqlSessionManager.getFactory();

	public ArrayList<communityDTO> selectAll() {
		ArrayList<communityDTO> list = null;
		// 회원 가입 기능 수행 --> 데이터 베이스에 데이터 추가하기
		// 데이터 베이스 접근하려면 connection(sqlsession) 필요
		// 1. sqlsession 빌려오기
		SqlSession session = factory.openSession(true);
		try {
			list = (ArrayList)session.selectList("CommunityAllSearch");

		} finally {
			// 3. sqlsession 반납
			session.close();
		}
		return list;
	}

}
