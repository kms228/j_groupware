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
	
	//session.getServletContext().getRealPath()���� �� ���� ��θ��� 'String path' ����
	public String copyFileToServer(String path) {
		String uploadPath=session.getServletContext().getRealPath(path);
		
		//�ö�� ���ϸ�
		String orgfilename=file.getOriginalFilename();
		
		//������ ���ϸ� �����(��������_�������ϸ�)
		String savefilename=UUID.randomUUID() +"_" + orgfilename;
		FileOutputStream fos= null;
		InputStream is = null;
		try {
			//���۵� ������ �о���� ���� ��Ʈ��
			is=file.getInputStream();			
			System.out.println(uploadPath);
			
			//������ �����ϱ� ���� ���Ͻ�Ʈ����ü			
			makeDirectory(uploadPath);
			fos=new FileOutputStream(uploadPath +File.separator+ savefilename);
			
			//���Ϻ����ϱ�
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
