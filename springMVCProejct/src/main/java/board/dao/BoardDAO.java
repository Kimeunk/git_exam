package board.dao;

import java.util.List;
import java.util.Map;

import board.bean.BoardDTO;

public interface BoardDAO {

	public int write(Map<String, String> map);

	public List<BoardDTO> getBoardList(Map<String, Integer> map);

	public int getTotalA();

	public BoardDTO boardView(String seq);

	public void hitUpdate(String seq);

	public void boardModify(Map<String, String> map);

	public void boardDelete(String seq);

	public void boardReply(Map<String, String> map);

	public List<BoardDTO> getBoardSearch(Map<String, String> map);

	public int getTotalSearch(Map<String, String> map);

}
