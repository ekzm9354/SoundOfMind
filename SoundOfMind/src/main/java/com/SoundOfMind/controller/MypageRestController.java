package com.SoundOfMind.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.http.HttpHeaders;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

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

@PostMapping("/uploadAjaxAction")
@ResponseBody
public ResponseEntity<List<UploadFile>> uploadAjaxPost(MultipartFile[] uploadFile) {
	List<UploadFile> list = new ArrayList<UploadFile>();
	//파일 저장 경로
	String uploadFolder="C:/upload/profile_test/";
	String uploadFolderPath=getFolder();
	//폴더 만들기
	File uploadPath = new File(uploadFolder, getFolder());
	Log.info("upload path : "+uploadPath);
	
	if(uploadPath.exists()==false) {
		uploadPath.mkdirs();
	}//make yyyy/MM/dd 폴더
	
	//파일 업로드 후 파일 이름, 사이즈 확인용
	for(MultipartFile multipartFile : uploadFile) {
//		Log.info("------------------");
//		Log.info("Upload File Name : "+multipartFile.getOriginalFilename());
//		Log.info("Upload File Size : "+multipartFile.getSize());
		
		UploadFile uploadfile = new UploadFile();
		String uploadFileName=multipartFile.getOriginalFilename();
		//IE has file path
		uploadFileName=uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
		Log.info("only file name : "+uploadFileName);
		uploadfile.setFileName(uploadFileName);
		//고유한 파일명을 갖는 파일 생성 방법
		UUID uuid=UUID.randomUUID();
		uploadFileName=uuid.toString()+"_"+uploadFileName;
		
		//파일 저장
		try {
			//File savefile=new File(uploadFolder, multipartFile.getOriginalFilename());
			File saveFile=new File(uploadPath,uploadFileName);
			multipartFile.transferTo(saveFile);
			uploadfile.setUuid(uuid.toString());
			uploadfile.setUploadPath(uploadFolderPath);
			//이미지 타입 파일인지 확인
			if(checkImageType(saveFile)) {
				uploadfile.setImage(true);
				FileOutputStream thumbnail=new FileOutputStream(new File(uploadPath,"s_"+uploadFileName));
				Thumbnailator.createThumbnail(multipartFile.getInputStream(),thumbnail,100,100);
			}
			// 리스트 추가
			list.add(uploadfile);
		}catch(Exception e) {
			Log.error(e.getMessage());
		}//end catch
	}//end for
	return new ResponseEntity<List<UploadFile>>(list,HttpStatus.OK);
}
//오늘 날짜의 경로를 문자열로 생성, 생성된 경로는 폴더 경로로 수정 된 뒤 반환
private String getFolder() {
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	Date date = new Date();
	String str = sdf.format(date);
	return str.replace("-",File.separator);
}
private boolean checkImageType(File file) {
	try {
		String contentType = Files.probeContentType(file.toPath());
		return contentType.startsWith("image");
	}catch(IOException e) {
		e.printStackTrace();
	}
	return false;
}

//썸네일 이미지 보여주기
@GetMapping("/display")
@ResponseBody
public ResponseEntity<byte[]> getFile(String fileName){
	Log.info("fileName:"+fileName);
	File file=new File("C:\\upload\\profile_test\\"+fileName);
	Log.info("file:"+file);
	ResponseEntity<byte[]> result=null;
	try {
		org.springframework.http.HttpHeaders headers = new org.springframework.http.HttpHeaders();
	headers.add("Content-Type", Files.probeContentType(file.toPath()));
	result=new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file),headers,HttpStatus.OK);
	}catch(IOException e) {
		e.printStackTrace();
	}return result;
}
}
