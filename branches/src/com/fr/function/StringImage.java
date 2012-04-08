package com.fr.function;

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.sql.Blob;
import javax.imageio.ImageIO;
import com.fr.base.BaseUtils;
import com.fr.base.core.BaseCoreUtils;
import com.fr.base.core.GraphHelper;
import com.fr.report.script.AbstractFunction;
import com.fr.util.Utils;

public class StringImage extends AbstractFunction {
	public Object run(Object[] args) {
		Image result = null;
		int p = 0;
		Object[] ob = new Object[2];
		for (int i = 0; (i < args.length && p <= 1); i++) {
			if (args[i] == null) {
				continue;
			}
			ob[p] = args[i];
			p++;

		}
		try {
			result = initStringImage(ob[0], ob[1]);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	public Image initStringImage(Object nameOb, Object imageOb)
			throws IOException {
		String name = (String) nameOb;
		Image image = null;
		Blob imageBlob = (Blob) imageOb;
		Object imageObject = Utils.blob2Object(imageBlob, true);
		if (imageObject instanceof Image)
			image = (Image) imageObject;
		else
			;
		Image stringImage = null;
		BufferedImage splashBuffedImage = BaseCoreUtils.toBufferedImage(image);
		stringImage = splashBuffedImage;
		Graphics2D splashG2d = splashBuffedImage.createGraphics();
		double centerX = 25;
		double centerY = 25;
		GraphHelper.drawString(splashG2d, name, centerX, centerY);
		//
		String FilePath = "Test.png";
		File f = new File(FilePath);
		ImageIO.write(splashBuffedImage, "png", f);
		//
		return splashBuffedImage;
	}

	public static void main(String arg[]) throws IOException {
		StringImage tt = new StringImage();
		Image image = BaseUtils.readImage("/com/fr/design/images/splash.png");
		String name = "12314124";
		Image aa = tt.initStringImage(name, image);
	}
}