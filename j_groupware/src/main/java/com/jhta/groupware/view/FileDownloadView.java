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
// �ٿ�ε�â���� �����ϴ� Ŀ���Һ� �����
// Ŀ���Һ� - ����ڰ� ���� �並 ���� (��:excel���Ϸ� �����ϱ�,pdf�� �����ϱ�)

public class FileDownloadView extends AbstractView{
	//����Ǿ�� �� ����� ����
	@Override
	protected void renderMergedOutputModel(Map<String, Object> map, HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		////////////////// 1. �ٿ�ε� â�� ������ ���� ���� ///////////////////////////
		setContentType("application/octet-stream");
		File f=(File)map.get("file");
		String filename=(String)map.get("filename");
		long filesize=(Long)map.get("filesize");
		resp.setContentType(getContentType());
		resp.setContentLength((int)filesize);
		//�ѱ����ϸ��� ������ �ʵ��� ���ڵ�
		filename=URLEncoder.encode(filename,"UTF-8");
		filename=filename.replaceAll("\\+","%20");
		resp.setHeader("Content-Disposition", "attachment;filename=" + filename);
		
		////////////////// 2. ���ϴٿ�ε��ϱ� ////////////////////////////////////////
		OutputStream os=resp.getOutputStream();
		FileInputStream fis=new FileInputStream(f);
		FileCopyUtils.copy(fis,os);
		os.close();
		fis.close();
	}
}














