package board.service;

import java.util.List;
import java.util.Map;

import board.bean.BoardDTO;
import board.bean.BoardPaging;

public interface BoardService {

	public int write(Map<String, String> map);

	public List<BoardDTO> getBoardList(String pg);

	public int getTotalA();

	public BoardDTO boardView(String seq);

	public void hitUpdate(String seq);

	public BoardPaging boarPaging(String pg);

	public void boardModify(Map<String, String> map);

	public void boardDelete(String seq);

	public void boardReply(Map<String, String> map);

	public List<BoardDTO> getBoardSearch(Map<String, String> map);

	public BoardPaging boarPaging(Map<String, String> map);
}
