package util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import net.coobird.thumbnailator.Thumbnailator;
import vo.Attach;

public class FileUpload {

	public static List<Attach> upload(HttpServletRequest req) throws IOException {
		String saveDirectory = "d:\\upload";
		String path = getPath();
		
		File uploadPath = new File(saveDirectory + File.separator + path);
		if(!uploadPath.exists()) {
			uploadPath.mkdirs();
		}
		
		int maxPostSize = 10 * 1024 * 1024;
		String encoding = "utf-8";
		FileRenamePolicy policy = new MyFileRenamePolicy();
		MultipartRequest multi = new MultipartRequest(req, uploadPath.getAbsolutePath(), maxPostSize, encoding, policy);
		
		Enumeration<String> files = multi.getFileNames();
		List<Attach> attaches = new ArrayList<>();
		while(files.hasMoreElements()) {
			String file = files.nextElement();
			String uuid = multi.getFilesystemName(file);
			if(uuid == null) continue;
			String origin = multi.getOriginalFileName(file);
			
			Attach attach = new Attach(uuid, origin, null, path);
			attaches.add(attach);
			
			FileInputStream fis = new FileInputStream(saveDirectory + "\\" + uuid);
			FileOutputStream fos = new FileOutputStream(saveDirectory + "\\s_" + uuid);
			Thumbnailator.createThumbnail(fis, fos, 250, 250);
		}
		return attaches;
	}
	
	private static String getPath() {
		return new SimpleDateFormat("yyMMdd").format(new Date());
	}
}
