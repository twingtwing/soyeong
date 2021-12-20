package co.kids.prj.lodgingPhoto.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("lodPhotoDao")
public class LodgingPhotoServiceImpl implements LodgingPhotoService {

	@Autowired
	private LodgingPhotoMapper map;
	
	@Override
	public List<LodgingPhotoVO> selectListPhoto() {
		// TODO Auto-generated method stub
		return map.selectListPhoto();
	}



	@Override
	public int insertPhoto(LodgingPhotoVO vo) {
		// TODO Auto-generated method stub
		return map.insertPhoto(vo);
	}

	@Override
	public int updatePhoto(LodgingPhotoVO vo) {
		// TODO Auto-generated method stub
		return map.updatePhoto(vo);
	}

	@Override
	public int deletePhoto(LodgingPhotoVO vo) {
		// TODO Auto-generated method stub
		return map.deletePhoto(vo);
	}



	@Override
	public List<LodgingPhotoVO> selectPhoto(LodgingPhotoVO vo) {
		
		return map.selectPhoto(vo);
	}

}
