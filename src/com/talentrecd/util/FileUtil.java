package com.talentrecd.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.util.Date;

public class FileUtil {
	
	/* lq */
	
//	private String productinfoImgUrl = SystemUtil.getAppConfig("productinfoImg");
	private String fileDesUrl = SystemUtil.getAppConfig("fileDesUrl");
	private String fileReqUrl = SystemUtil.getAppConfig("fileReqUrl");
	private String fileResumeUrl = SystemUtil.getAppConfig("fileResumeUrl");
	//保存fileDesUrl文件
	public  boolean descriptionFile(String str,String filename){
		System.out.println(str);
		try {
			File file=new File(fileDesUrl+filename);
			if(!file.exists()){
				file.createNewFile();
			}
			FileOutputStream fos=new FileOutputStream(file);
			OutputStreamWriter write = new OutputStreamWriter(fos,"UTF-8");
			write.write(str);
			write.close();
			/*byte bytes[]=new byte[512];
			bytes=str.getBytes();  
			int b=str.length();  
			fos.write(bytes,0,b);*/
			return true;
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	//保存fileReqUrl文件
	public boolean requirementFile(String str,String filename){
		System.out.println(str);
		try {
			File file=new File(fileDesUrl+filename);
			if(!file.exists()){
				file.createNewFile();
			}
			/*byte bytes[]=new byte[512];
			bytes=str.getBytes();   //新加的
			int b=str.length();   //改
			fos.write(bytes,0,b);
			fos.close();*/	
			FileOutputStream fos=new FileOutputStream(file);
			OutputStreamWriter write = new OutputStreamWriter(fos,"UTF-8");
			write.write(str);
			write.close();
			return true;
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	//保存resumeFile文件xjh
		public String resumeFile(File file,String username){
			System.out.println(file.getAbsolutePath());
			
			try {
				String newfilename=String.valueOf(username+"-"+new Date().getTime()+".doc");
				File newfile=new File(fileResumeUrl+newfilename);
				if(!file.exists()){
					file.createNewFile();
				}
				FileInputStream fis = new FileInputStream(file);
				FileOutputStream fos = new FileOutputStream(newfile);
		        byte[] buffer = new byte[1024];
		        int len = 0;
		        while ((len = fis.read(buffer)) > 0){ //循环读取文件到输出流
		        	 fos.write(buffer , 0 , len);   //使用输出流输出文件。

		         }
		         fis.close();
		         fos.close();
				return newfilename;
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return null;
		}
	
	//读取岗位描述文件
	@SuppressWarnings("finally")
	public String readDesFile(String filename) throws IOException{
		String encoding="UTF-8";
		InputStreamReader read=null;
		String s ="";
		try {
			File file=new File(fileDesUrl+filename);
			read = new InputStreamReader(new FileInputStream(file),encoding);
			BufferedReader br = new BufferedReader(read);           
			String str;
			while((str = br.readLine()) != null){ 
			   s+=str;
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally{
			read.close();
			return s;
		}
	}
	
	//读取需求文件
	@SuppressWarnings("finally")
	public String readReqFile(String filename) throws IOException{
		String encoding="UTF-8";
		InputStreamReader read=null;
		String s ="";
		try {
			File file=new File(fileReqUrl+filename);
			read = new InputStreamReader(new FileInputStream(file),encoding);
			BufferedReader br = new BufferedReader(read);           
			String str;
			while((str = br.readLine()) != null){ 
			   s+=str;
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally{
			read.close();
			return s;
		}
	}
	
	/**
	 * 多文件上�?
	 */
	/*public String uploadFiles(Integer productid, File[] upload, String[] uploadFileName){
		String pics = "";
		//判断是否有文�?
		if(upload != null){
			for(int i = 0; i < upload.length; i++){
				String pic = productid + "_" + i + uploadFileName[i].substring(uploadFileName[i].lastIndexOf("."));
				String fileurl = productinfoImgUrl + pic;
				fileUpload(upload[i], fileurl);
				if (i != upload.length - 1){
					pics += pic + "|";
				}else{
					pics += pic;
				}
			}
		}
		System.out.println(pics);
		return pics;
	}*/
	
	
	/**
	 * 文件上传
	 */
	public static  boolean fileUpload(File upload, String fileurl){
		//判断是否有文�?
		if (upload != null){
			try {
				//输出流�?输入�?
				FileOutputStream fos = new FileOutputStream(fileurl);
				FileInputStream fis = new FileInputStream(upload);
				byte[] buffer = new byte[1024];
				int len = 0;
				while ((len = fis.read(buffer))>0){
					fos.write(buffer, 0, len);
				}
				fis.close();
				fos.close();
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			}catch (IOException e) {
				e.printStackTrace();
			}
			return true;
		}
		else{
			return false;
		}
	}
	
	/**
	 * 删除文件
	 */
	public boolean deleteFile(String url){
		boolean flag = false;  
		File file = new File(url);  
	    // 路径为文件且不为空则进行删除  
	    if (file.isFile() && file.exists()) {  
	        file.delete();  
	        flag = true;  
	    }  
	    return flag;  
	}
	
	/* lq */
	
}
