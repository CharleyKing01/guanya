/** 
 *  缩略图实现，将图片(jpg、bmp、png、gif等等)真实的变成想要的大小 
 */
package org.charley.util;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.imageio.ImageIO;

import com.sun.image.codec.jpeg.ImageFormatException;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;
import org.charley.util.exception.RollbackableBizException;


/*******************************************************************************
 * 缩略图类（通用） 本java类能将jpg、bmp、png、gif图片文件，进行等比或非等比的大小转换。 具体使用方法
 * compressPic(大图片路径,生成小图片路径,大图片文件名,生成小图片文名,生成小图片宽度,生成小图片高度,是否等比缩放(默认为true))
 */
public class CompressPic {
	private File file = null; // 文件对象
	private String inputDir; // 输入图路径
	private String outputDir; // 输出图路径
	private String inputFileName; // 输入图文件名
	private String outputFileName; // 输出图文件名
	private int outputWidth = 100; // 默认输出图片宽
	private int outputHeight = 100; // 默认输出图片高
	private boolean proportion = true; // 是否等比缩放标记(默认为等比缩放)

	public CompressPic() { // 初始化变量
		inputDir = "";
		outputDir = "";
		inputFileName = "";
		outputFileName = "";
		outputWidth = 100;
		outputHeight = 100;
	}

	public void setInputDir(String inputDir) {
		this.inputDir = inputDir;
	}

	public void setOutputDir(String outputDir) {
		this.outputDir = outputDir;
	}

	public void setInputFileName(String inputFileName) {
		this.inputFileName = inputFileName;
	}

	public void setOutputFileName(String outputFileName) {
		this.outputFileName = outputFileName;
	}

	public void setOutputWidth(int outputWidth) {
		this.outputWidth = outputWidth;
	}

	public void setOutputHeight(int outputHeight) {
		this.outputHeight = outputHeight;
	}

	public void setWidthAndHeight(int width, int height) {
		this.outputWidth = width;
		this.outputHeight = height;
	}

	/*
	 * 获得图片大小 传入参数 String path ：图片路径
	 */
	public long getPicSize(String path) {
		file = new File(path);
		return file.length();
	}

	// 图片处理
	public String compressPic() throws RollbackableBizException {
		try {
			if (!file.exists()) {
				return "";
			}
			Image img = ImageIO.read(file);
			// 判断图片格式是否正确
			if (img.getWidth(null) == -1) {
				System.out.println(" can't read,retry!" + "<BR>");
				return "no";
			} else {
				int newWidth;
				int newHeight;
				// 判断是否是等比缩放
				if (this.proportion == true) {
					// 为等比缩放计算输出的图片宽度及高度
					double rate1 = ((double) img.getWidth(null))
							/ (double) outputWidth + 0.1;
					double rate2 = ((double) img.getHeight(null))
							/ (double) outputHeight + 0.1;
					// 根据缩放比率大的进行缩放控制
					double rate = rate1 > rate2 ? rate1 : rate2;
					if(outputWidth==0||outputHeight==0){
						rate = 1;
					}
					newWidth = (int) (((double) img.getWidth(null)) / rate);
					newHeight = (int) (((double) img.getHeight(null)) / rate);
				} else {
					newWidth = outputWidth; // 输出的图片宽度
					newHeight = outputHeight; // 输出的图片高度
				}
				BufferedImage tag = new BufferedImage((int) newWidth, (int) newHeight, BufferedImage.TYPE_INT_RGB);

				/*
				 * Image.SCALE_SMOOTH 的缩略算法 生成缩略图片的平滑度的 优先级比速度高 生成的图片质量比较好 但速度慢
				 */
				tag.getGraphics().drawImage(img.getScaledInstance(newWidth, newHeight, Image.SCALE_SMOOTH), 0, 0, null);

				File outFile = new File(outputDir);
				if (!outFile.exists()) {  
					outFile.mkdirs();  
		        }
				FileOutputStream out = new FileOutputStream(outputDir + outputFileName);
				// JPEGImageEncoder可适用于其他图片类型的转换
				JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
				encoder.encode(tag);
				out.close();
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			throw new RollbackableBizException("未找到指定路径！", e);
		} catch (ImageFormatException e) {
			e.printStackTrace();
			throw new RollbackableBizException("图片格式错误！", e);
		} catch (IOException e) {
			e.printStackTrace();
			throw new RollbackableBizException("图片处理异常！", e);
		}
		return "ok";
	}

	public String compressPic(String inputDir, String outputDir, String inputFileName, String outputFileName) throws RollbackableBizException {
		// 输入图路径
		this.inputDir = inputDir;
		// 输出图路径
		this.outputDir = outputDir;
		// 输入图文件名
		this.inputFileName = inputFileName;
		// 输出图文件名
		this.outputFileName = outputFileName;
		// 获得源文件
		file = new File(this.inputDir + this.inputFileName);
		return compressPic();
	}

	public String compressPic(String inputDir, String outputDir, String inputFileName, String outputFileName, int width, int height, boolean gp) throws RollbackableBizException {
		// 输入图路径
		this.inputDir = inputDir;
		// 输出图路径
		this.outputDir = outputDir;
		// 输入图文件名
		this.inputFileName = inputFileName;
		// 输出图文件名
		this.outputFileName = outputFileName;
		// 设置图片长宽
		setWidthAndHeight(width, height);
		// 是否是等比缩放 标记
		this.proportion = gp;
		// 获得源文件
		file = new File(this.inputDir + this.inputFileName);
		return compressPic();
	}

	public String compressPic(File sourceFile, String outputDir, String outputFileName, int width, int height, boolean gp) throws RollbackableBizException {
		// 输出图路径
		this.outputDir = outputDir;
		// 输出图文件名
		this.outputFileName = outputFileName;
		// 设置图片长宽
		setWidthAndHeight(width, height);
		// 是否是等比缩放 标记
		this.proportion = gp;
		// 获得源文件
		this.file = sourceFile;
		return compressPic();
	}

	/**
	 * 
	 * 方法说明:压缩图片并上传
	 * 创建　者:wei.tang
	 * 创建时间:2014-12-30 下午1:39:02
	 * @return String
	 * @param file
	 * @param filePath
	 * @param fileName
	 * @param width
	 * @param height
	 * @return
	 * @throws RollbackableBizException
	 */
	public static String compressPic(File file, String filePath, String fileName, int width, int height) throws RollbackableBizException{
		if(null == file) {
    		return "";
    	}
		
		// 时间格式化的格式
    	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss"); 
    	// 生成随机文件名：当前年月日时分秒+五位随机数（为了在实际项目中防止文件同名而进行的处理）
		int rannum =(int) (89999 * Math.random() + 10000); // 获取随机数
		// 获取所上传的文件的后缀名
		String ext = fileName.substring(fileName.indexOf("."));
    	String filename = simpleDateFormat.format(new Date())  +rannum + ext;
    	
		CompressPic mypic = new CompressPic();
		mypic.compressPic(file, filePath, filename, width, height, true);
		return filename;
	}
	// main测试
	// compressPic(大图片路径,生成小图片路径,大图片文件名,生成小图片文名,生成小图片宽度,生成小图片高度,是否等比缩放(默认为true))
	/*public static void main(String[] args) {

		String path = "E:\\test\\";
		String path1 = "E:\\test\\";

		File root = new File(path);
		File[] files = root.listFiles();
		for (File file : files) {

			CompressPicDemo mypic = new CompressPicDemo();
			System.out.println("输入的图片大小："
					+ mypic.getPicSize(path + "" + file.getName()) / 1024
					+ "KB");
			int count = 0; // 记录全部图片压缩所用时间

			int start = (int) System.currentTimeMillis(); // 开始时间
			mypic.compressPic(path, path1, file.getName(), file.getName(), 120,
					120, true);
			int end = (int) System.currentTimeMillis(); // 结束时间
			int re = end - start; // 但图片生成处理时间
			count += re;
			System.out.println(file.getName() + "图片压缩处理使用了: " + re + "毫秒");
			System.out.println("输出的图片大小："
					+ mypic.getPicSize(path1 + "" + file.getName()) / 1024
					+ "KB");

			System.out.println("总共用了：" + count + "毫秒");

		}
	}*/
}