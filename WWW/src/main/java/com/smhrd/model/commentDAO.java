package com.smhrd.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class commentDAO {
	private SqlSessionFactory factory = SqlSessionManager.getFactory();

	public int addComment(commentDTO dto) {
		SqlSession session = factory.openSession(true);
		int row = 0;
		try {
			row = session.insert("addComment", dto);
		} finally {
			session.close();
		}
		return row;
	}
	public ArrayList<commentDTO> selectAll(){
		SqlSession session = factory.openSession(true);
		
		ArrayList<commentDTO> cmt_list = new ArrayList<commentDTO>();
		try {
			cmt_list = (ArrayList) session.selectList("commentAllSearch");
		} finally {
			session.close();
		}
		return cmt_list;
	}
	public int deleteComment(commentDTO dto) {
		SqlSession session = factory.openSession(true);
		int row = 0;
		try {
			row = session.delete("deleteComment", dto);
		} finally {
			session.close();
		}
		return row;
	}
}
