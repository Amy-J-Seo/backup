package co.animal.prj.csc.service;

import java.util.List;

import co.animal.prj.csc.vo.CscVO;

public interface CscServiceMapper {
	public List<CscVO> cscSelectList();
	public CscVO cscSelect(CscVO vo);
	public int cscUpdate(CscVO vo);
	public int cscDelete(CscVO vo);
	public int cscInsert(CscVO vo);
}
