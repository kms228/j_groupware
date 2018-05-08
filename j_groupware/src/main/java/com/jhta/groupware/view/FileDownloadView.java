package com.jhta.groupware.view;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;
// 다운로드창으로 응답하는 커스텀뷰 만들기
// 커스텀뷰 - 사용자가 직접 뷰를 만듦 (예:excel파일로 응답하기,pdf로 응답하기)

public class FileDownloadView extends AbstractView{
	//응답되어야 할 기능을 구현
	@Override
	protected void renderMergedOutputModel(Map<String, Object> map, HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		////////////////// 1. 다운로드 창에 보여질 정보 설정 ///////////////////////////
		setContentType("application/octet-stream");
		File f=(File)map.get("file");
		String filename=(String)map.get("filename");
		long filesize=(Long)map.get("filesize");
		resp.setContentType(getContentType());
		resp.setContentLength((int)filesize);
		//한글파일명이 깨지지 않도록 인코딩
		filename=URLEncoder.encode(filename,"UTF-8");
		filename=filename.replaceAll("\\+","%20");
		resp.setHeader("Content-Disposition", "attachment;filename=" + filename);
		
		////////////////// 2. 파일다운로드하기 ////////////////////////////////////////
		OutputStream os=resp.getOutputStream();
		FileInputStream fis=new FileInputStream(f);
		FileCopyUtils.copy(fis,os);
		os.close();
		fis.close();
	}
}














