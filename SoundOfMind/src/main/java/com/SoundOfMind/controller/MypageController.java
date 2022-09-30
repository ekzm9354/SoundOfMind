package com.SoundOfMind.controller;

import java.io.File;
import java.io.IOError;
import java.io.IOException;
import java.net.http.HttpHeaders;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.python.jline.internal.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.SoundOfMind.domain.Emotion;
import com.SoundOfMind.domain.Member;
import com.SoundOfMind.mapper.MypageMapper;

@Controller
public class MypageController {

	@Autowired
	private MypageMapper mapper;

	@GetMapping("/mypage.do")
	public String storege(HttpSession session, Model model) {
		Member member = (Member) session.getAttribute("user");
		if (member != null) {
			String id = member.getId();
			List<Emotion> emotion = mapper.emotion(id);
			model.addAttribute("emotion", emotion);
		}
		return "mypage";
	}
	
	//upload
		@PostMapping("/uploadAjaxAction")
		public void uploadAjaxPost(MultipartFile[] uploadFile) {
			Log.info("update ajax post....");
			String uploadFolder="C:\\upload";
			for(MultipartFile multipartFile : uploadFile) {
				Log.info("-------------------");
				Log.info("upload File Name : " + multipartFile.getOriginalFilename());
				Log.info("Upload File Size : " + multipartFile.getSize());
				
				String uploadFileName=multipartFile.getOriginalFilename();
				
				//IE has file path
				uploadFileName=uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
				Log.info("only file name:"+uploadFileName);
				
				File saveFile = new File(uploadFolder, uploadFileName);
				
				try {
					multipartFile.transferTo(saveFile);
				}catch (Exception e) {
					Log.error(e.getMessage());
				}//end catch
			}//end for
		}
		
	//프로필 보여주기
//		@GetMapping("/display")
//		@ResponseBody
//		public ResponseEntity<byte[]> getFile(String fileName){
//			Log.info("fileName:" + fileName);
//			File file = new File ("c:\\upload\\"+fileName);
//			Log.info("file: "+file);
//			ResponseEntity<byte[]> result = null;
//			
//			try {
//				HttpHeaders header = new HttpHeaders();
//				
//				header.add
//			}catch(IOException e) {
//				e.printStackTrace();
//			}
//			return result;
//		}
//		
}
