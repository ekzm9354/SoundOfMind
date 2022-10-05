package com.SoundOfMind.controller;

import java.awt.Graphics2D;
import java.awt.PageAttributes.MediaType;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLDecoder;
import java.net.http.HttpHeaders;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.python.jline.internal.Log;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.SoundOfMind.domain.UploadFile;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
public class MypageRestController {

@GetMapping("/mypage")
public void uploadForm() {
	Log.info("mypage : upload form");
}

//첨부 파일 업로드
@PostMapping(value="/uploadAjaxAction",produces=org.springframework.http.MediaType.APPLICATION_JSON_UTF8_VALUE)
@ResponseBody
public ResponseEntity<List<UploadFile>> uploadAjaxPost(MultipartFile[] uploadFile) {
	/* 이미지 파일 체크 */
	for(MultipartFile multipartFile: uploadFile) {
		
		File checkfile = new File(multipartFile.getOriginalFilename());
		String type = null;
		
		try {
			type = Files.probeContentType(checkfile.toPath());
			Log.info("MIME TYPE : " + type);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		if(!type.startsWith("image")) {
			
			List<UploadFile> list = null;
			return new ResponseEntity<>(list,HttpStatus.BAD_REQUEST);
			
		}
		
	}// for 끝
	
	String uploadFolder="C:\\upload\\";
	//날짜 폴더 경로
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	Date date = new Date();
	String str=sdf.format(date);
	String datePath = str.replace("-", File.separator);
	/* 폴더 생성 */
	File uploadPath = new File(uploadFolder, datePath);
	
	if(uploadPath.exists() == false) {
		uploadPath.mkdirs();
	}
	//이미지 정보를 담는 객체
	List<UploadFile> list = new ArrayList();
	//for문
	for(MultipartFile multipartFile : uploadFile) {
		/* 이미지 정보 객체 */
		UploadFile uploadfile = new UploadFile();
		
		/* 파일 이름 */
		String uploadFileName = multipartFile.getOriginalFilename();			
		uploadfile.setFileName(uploadFileName);
		uploadfile.setUploadPath(datePath);
		
		/* uuid 적용 파일 이름 */
		String uuid = UUID.randomUUID().toString();
		uploadfile.setUuid(uuid);
		
		uploadFileName = uuid + "_" + uploadFileName;
		
		/* 파일 위치, 파일 이름을 합친 File 객체 */
		File saveFile = new File(uploadPath, uploadFileName);
		
		/* 파일 저장 */
		try {
			multipartFile.transferTo(saveFile);
			
			//썸네일 생성(ImageIO)
			File thumbnailFile = new File(uploadPath,"s_"+uploadFileName);
			BufferedImage bo_image = ImageIO.read(saveFile);
			//비율
			double ratio=3;
			//넓이 , 높이
			int width=(int)(bo_image.getWidth()/ratio);
			int height=(int)(bo_image.getHeight()/ratio);
			
			BufferedImage bt_image = new BufferedImage(width,height,BufferedImage.TYPE_3BYTE_BGR);
			Graphics2D graphic = bt_image.createGraphics();
			graphic.drawImage(bo_image, 0, 0,width,height,null);
			ImageIO.write(bt_image, "jpg", thumbnailFile);
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		list.add(uploadfile);
	}//for 끝부분
	
	ResponseEntity<List<UploadFile>> result = new ResponseEntity<List<UploadFile>>(list,HttpStatus.OK);
	return result;
}
	

	
		


//썸네일 이미지 보여주기
@GetMapping("/display")
@ResponseBody
public ResponseEntity<byte[]> getImage(String fileName){
	Log.info("getImage()---------"+fileName);
	File file=new File("C:\\upload\\"+fileName);
	ResponseEntity<byte[]> result = null;
	
	try {
		
		org.springframework.http.HttpHeaders header = new org.springframework.http.HttpHeaders();
		
		header.add("Content-type", Files.probeContentType(file.toPath()));
		
		result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		
	}catch (IOException e) {
		e.printStackTrace();
	}
	
	return result;
}

@PostMapping("deleteFile")
@ResponseBody
public ResponseEntity<String> deleteFile(String fileName){
	Log.info("deleteFile--------"+fileName);
	File file = null;
	try {
		/* 썸네일 파일 삭제 */
		file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));
		
		file.delete();
		
		/* 원본 파일 삭제 */
		String originFileName = file.getAbsolutePath().replaceFirst("s_", "");
		
		Log.info("originFileName : " + originFileName);
		
		file = new File(originFileName);
		
		file.delete();
		
		
	} catch(Exception e) {
		
		e.printStackTrace();
		
		return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED);
		
	}//catch
	return new ResponseEntity<String>("success", HttpStatus.OK);
}


}

