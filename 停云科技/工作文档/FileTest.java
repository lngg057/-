package ioTest;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.junit.Test;

public class FileTest {

	@Test
	public void testEmojiCnToEn() throws IOException{
		//读取原文件
//		File sourceFile = new File("E:\\emojiTmp.txt");
		File sourceFile = new File("D:\\webchats_tmp.txt");
		FileReader srcReader = new FileReader(sourceFile);
		String sourceFileStr = FileUtils.readFileToString(sourceFile, srcReader.getEncoding());
//		String sourceFileStr = FileUtils.readFileToString(sourceFile, "UTF-8");
//		System.out.println(sourceFileStr);
		
		//读取对应字典
		File mapFile = new File("D:\\emojiCnToEn.txt");
		FileReader mapReader = new FileReader(mapFile);
		List<String> readLines = FileUtils.readLines(mapFile, mapReader.getEncoding());
		Map<String,String> map = new HashMap<String, String>();
		for(String item:readLines){
			String[] split = item.split("=");
			String key = split[0].trim();
			String value = split[1].trim().toLowerCase().trim().replaceAll(" ", "-");
			
			map.put(key, value);
			
			//替换
			sourceFileStr = sourceFileStr.replace(key, value);
		}
		
		//替换
		
		//写入目标文件
		
		System.out.println(sourceFileStr);
	}
}
