package com.jhta.groupware.etc;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

public class ManipulateFile {
	private MultipartFile file;
	private HttpSession session;
	
	public ManipulateFile() {}
	public ManipulateFile(MultipartFile file,HttpSession session) {
		this.file = file;
		this.session = session;
	}	
	
	//session.getServletContext().getRealPath()에서 더 붙일 경로명을 'String path' 넣음
	public String copyFileToServer(String path) {
		String uploadPath=session.getServletContext().getRealPath(path);
		
		//올라온 파일명
		String orgfilename=file.getOriginalFilename();
		
		//저장할 파일명 만들기(랜덤제목_원래파일명)
		String savefilename=UUID.randomUUID() +"_" + orgfilename;
		FileOutputStream fos= null;
		InputStream is = null;
		try {
			//전송된 파일을 읽어오기 위한 스트림
			is=file.getInputStream();			
			System.out.println(uploadPath);
			
			//서버에 저장하기 위한 파일스트림객체			
			makeDirectory(uploadPath);
			fos=new FileOutputStream(uploadPath +File.separator+ savefilename);
			
			//파일복사하기
			FileCopyUtils.copy(is,fos);										
		}catch(IOException ie) {
			System.out.println(ie.getMessage());
			return null;
		} finally {
			try {
				if(fos != null) fos.close();
				if(is != null) is.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return path+File.separator+savefilename;
	}	
	
	private void makeDirectory(String uploadPath) {
		File file=new File(uploadPath);
		if(!file.isDirectory()) {
			file.mkdirs();
		}
	}
	public int deleteFile(String fileName) {
		boolean result = false;
		File file = new File(fileName);
		if(file.exists()&&file.isFile()) {
			result = file.delete();
		}
		return result ? 1:0;
	}
}
