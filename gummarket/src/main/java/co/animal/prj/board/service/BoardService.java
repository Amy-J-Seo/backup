package co.animal.prj.board.service;

import java.util.List;

import co.animal.prj.board.vo.BoardVO;

public interface BoardService {
	public List<BoardVO> boardSelectList();
	public BoardVO boardSelect(BoardVO vo);
	public int boardUpdate(BoardVO vo);
	public int boardDelete(BoardVO vo);
	public int boardInsert(BoardVO vo);
}
