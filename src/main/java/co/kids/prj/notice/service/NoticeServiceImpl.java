package co.kids.prj.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("noticeDao")
public class NoticeServiceImpl implements NoticeService {
	@Autowired 
	NoticeMapper noticeMapper;

	@Override
	public List<NoticeVO> noticeSelectList() {
		return noticeMapper.noticeSelectList();
	}

	@Override
	public NoticeVO noticeSelect(NoticeVO vo) {
		return noticeMapper.noticeSelect(vo);
	}

	@Override
	public int noticeInsert(NoticeVO vo) {
		return noticeMapper.noticeInsert(vo);
	}

	@Override
	public int noticeUpdate(NoticeVO vo) {
		return noticeMapper.noticeUpdate(vo);
	}

	@Override
	public int noticeDelete(int bno) {
		return noticeMapper.noticeDelete(bno);
	}

	@Override
	public List<NoticeVO> noticeSearch(NoticeVO vo) {
		return noticeMapper.noticeSearch(vo);
	}

}