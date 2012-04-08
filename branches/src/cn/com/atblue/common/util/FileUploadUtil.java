package cn.com.atblue.common.util;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import cn.com.atblue.common.SpringFactory;
import cn.com.atblue.common.SysConfig;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.RequestContext;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.servlet.ServletRequestContext;
public class FileUploadUtil {

    // 文件上传后保存的路径
    private String filePath;

    // 文件最大尺寸
    private int maxSize = 1024000000;

    // 编码
    private String encoding = "UTF-8";

    private ServletFileUpload upload = null;

    private List items = new ArrayList();

    DiskFileItemFactory factory = new DiskFileItemFactory();

    String date = DateUtil.format(DateUtil.getDate(), "yyyy-MM-dd");

    String split = "/";

    public FileUploadUtil(HttpServletRequest request) {
        String systemTemp = System.getProperty("java.io.tmpdir");
        SysConfig sysConfig =(SysConfig)SpringFactory.instance.getBean("propertyConfig");
        String filePath = sysConfig.getProperty("system.filePath");
        File file = new File(systemTemp);
        if (!file.exists()) {
            file.mkdirs();
        }
        file = new File(filePath);
        if (!file.exists()) {
            file.mkdirs();
        }

        factory.setRepository(new File(systemTemp));
        factory.setSizeThreshold(4096);
        upload = new ServletFileUpload(factory);
        RequestContext requestContext = new ServletRequestContext(request);
        // 文件最大尺寸
        upload.setSizeMax(maxSize);
        upload.setHeaderEncoding(encoding);
        try {

            items = upload.parseRequest(requestContext);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 上传文件
     */
    public List uploadFile() {
        SysConfig sysConfig =(SysConfig)SpringFactory.instance.getBean("propertyConfig");
        String filePath = sysConfig.getProperty("system.filePath");
        List list = new ArrayList();
        String rtnStr = "";
        try {
            Iterator iter = items.iterator();
            while (iter.hasNext()) {
                FileItem item = (FileItem) iter.next();
                if (!item.isFormField()) {

                    String fileName = item.getName();

                    if (fileName.indexOf("\\") >= 0) {
                        fileName = fileName.substring(fileName
                                .lastIndexOf("\\") + 1);
                    }

                    if (fileName != null && !fileName.equals("")) {
                        fileName = fileName.substring(fileName
                                .lastIndexOf(split) + 1);
                        Map map = new HashMap();
                        String uuid = StringUtil.getUUID();
                        String fullPath = filePath + split + uuid;
                        map.put("realName", fileName);
                        map.put("rename", uuid);
                        map.put("fullPath", filePath + split + uuid);
                        map.put("fileSize", item.getSize());
                        map.put("fileType", fileName.substring(fileName
                                .lastIndexOf(".") + 1));
                        map.put("fieldName", item.getFieldName());

                        InputStream is = item.getInputStream();
                        this.CopyFile(new File(filePath),new File(filePath));

                        list.add(map);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    /**
     * 上传第一个文件并返回byte[]
     * @return
     */
    public byte[] uploadFileReturnByte() {
        List list = new ArrayList();
        String rtnStr = "";
        try {
            Iterator iter = items.iterator();
            while (iter.hasNext()) {
                FileItem item = (FileItem) iter.next();
                if (!item.isFormField()) {

                    String fileName = item.getName();

                    if (fileName.indexOf("\\") >= 0) {
                        fileName = fileName.substring(fileName
                                .lastIndexOf("\\") + 1);
                    }

                    if (fileName != null && !fileName.equals("")) {
                        fileName = fileName.substring(fileName
                                .lastIndexOf(split) + 1);


                        InputStream is = item.getInputStream();
                        return item.get();

                        // item.write(file);

                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 上传文件到测井数据
     * @return
     */
    public List uploadFileToCjsj() {
        List list = new ArrayList();
        String rtnStr = "";
        try {
            Iterator iter = items.iterator();
            while (iter.hasNext()) {
                FileItem item = (FileItem) iter.next();
                if (!item.isFormField()) {

                    String fileName = item.getName();

                    if (fileName.indexOf("\\") >= 0) {
                        fileName = fileName.substring(fileName
                                .lastIndexOf("\\") + 1);
                    }

                    if (fileName != null && !fileName.equals("")) {
                        fileName = fileName.substring(fileName
                                .lastIndexOf(split) + 1);
                        Map map = new HashMap();
                        String uuid = StringUtil.getUUID();
                        String fullPath =  split + uuid;
                        map.put("realName", fileName);
                        map.put("rename", uuid);
                        map.put("fullPath", split + uuid);
                        map.put("fileSize", item.getSize());
                        map.put("fileType", fileName.substring(fileName
                                .lastIndexOf(".") + 1));
                        map.put("fieldName", item.getFieldName());

                        InputStream is = item.getInputStream();

                        // item.write(file);

                        list.add(map);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List uploadFile(String dirPath) {
        File _path = new File(dirPath + split + date + split);
        if (!_path.exists()) {
            _path.mkdirs();
        }
        List list = new ArrayList();
        String rtnStr = "";
        try {
            Iterator iter = items.iterator();
            while (iter.hasNext()) {
                FileItem item = (FileItem) iter.next();
                if (!item.isFormField()) {

                    String fileName = item.getName();
                    if (fileName.indexOf("\\") >= 0) {
                        fileName = fileName.substring(fileName
                                .lastIndexOf("\\") + 1);
                    }

                    // System.out.println(fileName);

                    if (fileName != null && !fileName.equals("")) {
                        fileName = fileName.substring(fileName
                                .lastIndexOf(split) + 1);
                        Map map = new HashMap();
                        // String uuid = StringUtil.getUUID();
                        String fullPath = dirPath + split + date + split
                                + fileName;
                        map.put("realName", fileName);
                        map.put("rename", fileName);
                        map.put("fullPath", date + split + fileName);
                        map.put("fileSize", item.getSize());
                        map.put("fileType", fileName.substring(fileName
                                .lastIndexOf(".") + 1));
                        map.put("fieldName", item.getFieldName());
                        File file = new File(fullPath);

                        item.write(file);
                        list.add(map);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    /**
     * 获取参数
     *
     */
    public String getParameter(String itemName) {
        String rtnStr = "";
        Iterator iter = items.iterator();

        while (iter.hasNext()) {
            FileItem item = (FileItem) iter.next();

            if (item.isFormField()) {
                String fileName = item.getFieldName();
                if (fileName.equals(itemName)) {
                    rtnStr = item.getString();
                    rtnStr = StringUtil.parseISOtoUTF(rtnStr);
                    break;
                }
            }
        }

        return StringUtil.parseISOtoGB(rtnStr);
    }

    public String[] getParameters(String itemName){
        String rtnStr = "";
        List list = new ArrayList();
        Iterator iter = items.iterator();

        while (iter.hasNext()) {
            FileItem item = (FileItem) iter.next();

            if (item.isFormField()) {
                String fileName = item.getFieldName();
                if (fileName.equals(itemName)) {
                    rtnStr = item.getString();
                    rtnStr = StringUtil.parseISOtoUTF(rtnStr);
                    list.add(rtnStr);
                }
            }
        }
        String[] _temp = new String[list.size()];
        for (int i = 0; i < list.size(); i++) {
            String str = (String)list.get(i);
            _temp[i] = str;
        }

        return _temp;
    }

    public Map changeFile(String fullpath) {
        File deleteFile = new File(fullpath);
        deleteFile.delete();

        Map map = new HashMap();
        String rtnStr = "";
        try {
            Iterator iter = items.iterator();
            while (iter.hasNext()) {
                FileItem item = (FileItem) iter.next();
                if (!item.isFormField()) {

                    // System.out.println(item.getFieldName());
                    // String fileName = item.getName();
                    // if (fileName != null && !fileName.equals("")) {

                    map.put("fileSize", item.getSize());
                    File file = new File(fullpath);

                    item.write(file);
                    break;
                    // }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }
    public void CopyFile(File in, File out) throws Exception {
        FileInputStream fis = new FileInputStream(in);
        FileOutputStream fos = new FileOutputStream(out);
        try {
            byte[] buf = new byte[1024];
            int i = 0;
            while ((i = fis.read(buf)) != -1) {
                fos.write(buf, 0, i);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            fis.close();
            fos.close();
        }
    }
    public static void main(String[] args) {
        String source = "文件登记表明细目录（适应用于备忘录等汇总）.xls";

        System.out.println(source.substring(source.lastIndexOf(".") + 1));
    }
}
