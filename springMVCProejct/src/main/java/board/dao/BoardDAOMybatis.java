package board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import board.bean.BoardDTO;

@Repository
@Transactional
public class BoardDAOMybatis implements BoardDAO {
	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public int write(Map<String, String> map) {
		return sqlSession.insert("boardSQL.write", map);
	}

	@Override
	public List<BoardDTO> getBoardList(Map<String, Integer> map) {
		return sqlSession.selectList("boardSQL.getBoardList", map);
	}
	
	// 게시판 글 검색
	@Override
	public List<BoardDTO> getBoardSearch(Map<String, String> map) {
		System.out.println(map.get("keyword"));
		return sqlSession.selectList("boardSQL.getBoardSearch", map);
	}
	
	// 게시판 검색 목록 총 글 수
	@Override
	public int getTotalSearch(Map<String, String> map) {
		return sqlSession.selectOne("boardSQL.getTotalSearch", map);
	}

	
	@Override
	public BoardDTO boardView(String seq) {
		return sqlSession.selectOne("boardSQL.boardView", Integer.parseInt(seq));
	}
	
	@Override
	public void hitUpdate(String seq) {
		sqlSession.update("boardSQL.hitUpdate", Integer.parseInt(seq));
	}
	
	// 총 글 수 
	@Override
	public int getTotalA() {
		return sqlSession.selectOne("boardSQL.getTotalA");
	}

	@Override
	public void boardModify(Map<String, String> map) {
		sqlSession.update("boardSQL.boardModify", map);
	}

	@Override
	public void boardDelete(String seq) {
		sqlSession.delete("boardSQL.boardDelete", Integer.parseInt(seq));	
	}

	@Override
	public void boardReply(Map<String, String> map) {
		sqlSession.insert("boardSQL.boardReply", map);
	}







}
