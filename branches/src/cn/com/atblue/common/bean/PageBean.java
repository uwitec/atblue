package cn.com.atblue.common.bean;

import java.util.Iterator;
import java.util.Map;

public class PageBean {
    private int currentPage = 1; // 当前页
    private int totalPages = 0; // 总页数
    private int pageSize = -1;// 第一次赋值时需要设置
    private int totalRows = 0; // 总数据数

    public PageBean() {
    }

    /**
     * 初始化页面参数
     *
     * @param totalRows
     *            总行数
     * @param pageSize
     *            页面尺寸(每页行数)
     * @param currentPage
     *            当前页
     */
    public PageBean(int totalRows, int pageSize, int currentPage) {
        this.totalRows = totalRows;
        this.pageSize = pageSize;
        this.currentPage = currentPage;
    }

    /**
     * 获取当前第几页
     *
     * @return 当前第几页
     */
    public int getCurrentPage() {
        return Math.min(Math.max(currentPage, 1), getTotalPages());
    }

    /**
     * 获得当前页第一条 使用>
     *
     * @return
     */
    public int getStart() {
        return (this.getCurrentPage() - 1) * this.getPageSize();
    }

    /**
     * 获得当前页最后一条 使用 <=
     *
     * @return
     */
    public int getEnd() {
        return Math.min(this.getCurrentPage() * this.getPageSize(), this
                .getTotalRows());
    }

    /**
     * 获取当前页第一条的索引
     *
     * @return 当前页第一条的索引
     */
    public int getCurrentPageBeginIndex() {
        return (this.getCurrentPage() - 1) * this.getPageSize() + 1;
    }

    /**
     * 获取当前页的最后一条的索引
     *
     * @return 当前页的最后一条的索引
     */
    public int getCurrentPageEndIndex() {
        return Math.min(this.getCurrentPage() * this.getPageSize(), this
                .getTotalRows());
    }

    /**
     * 设置当前第几页
     *
     * @param currentPage
     *            当前页数
     */
    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    /**
     * 获取总页数
     *
     * @return 总页数
     */
    public int getTotalPages() {
        return Math
                .max((getTotalRows() + getPageSize() - 1) / getPageSize(), 1);
    }

    /**
     * 设置总页数
     *
     * @param totalPages
     *            总页数
     * @deprecated 不起作用
     */
    public void setTotalPages(int totalPages) {
        this.totalPages = totalPages;
    }

    /**
     * 获取每一页的尺寸
     *
     * @return 页面尺寸
     */
    public int getPageSize() {
        return pageSize;
    }

    /**
     * 设置页面尺寸
     *
     * @param pageSize
     *            页面尺寸
     */
    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    /**
     * 获取总行数
     *
     * @return 总行数
     */
    public int getTotalRows() {
        return totalRows;
    }

    /**
     * 设置总行数
     *
     * @param totalRows
     *            总行数
     */
    public void setTotalRows(int totalRows) {
        this.totalRows = totalRows;
    }

    /**
     * 是否最后一页
     *
     * @return 是否最后一页
     */
    public boolean isLastPage() {
        return this.getCurrentPage() == getTotalPages();
    }

    /**
     * 是否第一页
     *
     * @return 是否第一页
     */
    public boolean isFirstPage() {
        return this.getCurrentPage() == 1;
    }

    /**
     * 获取翻页的HTML代码
     *
     * @param paramMap
     *            查询条件参数
     * @return 翻页的HTML代码
     */
    public String getHtml(Map paramMap) {

        StringBuffer rtnStr = new StringBuffer(
                "<table align=\"center\" border=\"0\" >\n"
                        + "    <form name=\"pages\" method=\"post\" action=\"\">\n"
                        + "    <tr>\n"
                        + "        <td valign=\"bottom\" align=\"right\">\n<span style=\"font-size:12px;\">");

        if (paramMap != null) {
            Iterator fieldsIterator = paramMap.keySet().iterator();
            while (fieldsIterator.hasNext()) {
                String fieldName = (String) fieldsIterator.next();
                if (paramMap.get(fieldName) == null
                        || fieldName.equals("currentPage")
                        || fieldName.equals("pageSize"))
                    continue;
                //System.out.println(fieldName);
                rtnStr.append("<input type=\"hidden\" id=\"").append(fieldName)
                        .append("\" name=\"").append(fieldName).append(
                        "\" value=\"").append(paramMap.get(fieldName))
                        .append("\"/>");
                //System.out.println(rtnStr);
            }
        }
        //System.out.println(getCurrentPage());
        rtnStr
                .append("每页")
                .append(getPageSize())
                .append("条/共")
                .append(getTotalRows())
                .append("条&nbsp;第")
                .append(getCurrentPage())
                .append("页/共")
                .append(getTotalPages())
                .append("页&nbsp;\n")
                .append(
                        !this.isFirstPage() ? "<a href=\"#\" onclick=\"submitPage('1');return false\">第一页</a>&nbsp;\n"
                                : "第一页&nbsp;")
                .append(
                        !this.isFirstPage() ? "<a href=\"#\" onclick=\"submitPage('"
                                + (getCurrentPage() - 1)
                                + "');return false;\">上一页</a>&nbsp;\n"
                                : "上一页&nbsp;")
                .append(
                        !this.isLastPage() ? "<a href=\"#\" onclick=\"submitPage('"
                                + (getCurrentPage() + 1)
                                + "');return false;\">下一页</a>&nbsp;\n"
                                : "下一页&nbsp;")
                .append(
                        !this.isLastPage() ? "<a href=\"#\" onclick=\"submitPage('"
                                + (getTotalPages())
                                + "');return false;\">最后一页</a>&nbsp;\n"
                                : "最后一页&nbsp;")
//				.append(
//						"每页<input type=\"text\" class=\"inputStyle\" name=\"pageSize\" size=\"3\" style=\"width: 20px;\" value=\"")
//				.append(getPageSize())
//				.append("\">条&nbsp;\n")
                .append(
                        "转到<input type=\"text\" class=\"inputStyle\" name=\"goPage\" size=\"3\" style=\"width: 20px;\" value=\"")
                .append(getCurrentPage())
                .append("\">页&nbsp;\n")
                .append("<input type=\"hidden\" name=\"currentPage\" value=\"")
                .append(getCurrentPage())
                .append("\">\n")
                .append("<input type=\"hidden\" name=\"pageSize\" value=\"")
                .append(getPageSize())
                .append("\">\n")
                .append(
                        "<input type=\"button\" class=\"button\" name=\"go\" value=\"GO\" onclick=\"submitPage(document.all.goPage.value)\">\n")
                .append("</span></td>\n").append("</tr>\n").append("</form>")
                .append("</table>\n").append("<script>\n").append(
                "    function submitPage(page) {\n").append(
                "        document.all.currentPage.value = page;\n")
                .append("        document.forms[0].submit();\n").append("    }\n")
                .append("</script>");
        return rtnStr.toString();
    }
    public String getHtml2(Map paramMap) {

        StringBuffer rtnStr = new StringBuffer(
                "<table align=\"center\" border=\"0\" >\n"
//                        + "    <form name=\"pages\" method=\"post\" action=\"\">\n"
                        + "    <tr>\n"
                        + "        <td valign=\"bottom\" align=\"right\">\n<span style=\"font-size:12px;\">");

        if (paramMap != null) {
            Iterator fieldsIterator = paramMap.keySet().iterator();
            while (fieldsIterator.hasNext()) {
                String fieldName = (String) fieldsIterator.next();
                if (paramMap.get(fieldName) == null
                        || fieldName.equals("currentPage")
                        || fieldName.equals("pageSize"))
                    continue;
                //System.out.println(fieldName);
                rtnStr.append("<input type=\"hidden\" id=\"").append(fieldName)
                        .append("\" name=\"").append(fieldName).append(
                        "\" value=\"").append(paramMap.get(fieldName))
                        .append("\"/>");
                //System.out.println(rtnStr);
            }
        }
        //System.out.println(getCurrentPage());
        rtnStr
                .append("每页")
                .append(getPageSize())
                .append("条/共")
                .append(getTotalRows())
                .append("条&nbsp;第")
                .append(getCurrentPage())
                .append("页/共")
                .append(getTotalPages())
                .append("页&nbsp;\n")
                .append(
                        !this.isFirstPage() ? "<a href=\"#\" onclick=\"submitPage('1');return false\">第一页</a>&nbsp;\n"
                                : "第一页&nbsp;")
                .append(
                        !this.isFirstPage() ? "<a href=\"#\" onclick=\"submitPage('"
                                + (getCurrentPage() - 1)
                                + "');return false;\">上一页</a>&nbsp;\n"
                                : "上一页&nbsp;")
                .append(
                        !this.isLastPage() ? "<a href=\"#\" onclick=\"submitPage('"
                                + (getCurrentPage() + 1)
                                + "');return false;\">下一页</a>&nbsp;\n"
                                : "下一页&nbsp;")
                .append(
                        !this.isLastPage() ? "<a href=\"#\" onclick=\"submitPage('"
                                + (getTotalPages())
                                + "');return false;\">最后一页</a>&nbsp;\n"
                                : "最后一页&nbsp;")
//				.append(
//						"每页<input type=\"text\" class=\"inputStyle\" name=\"pageSize\" size=\"3\" style=\"width: 20px;\" value=\"")
//				.append(getPageSize())
//				.append("\">条&nbsp;\n")
                .append(
                        "转到<input type=\"text\" class=\"inputStyle\" name=\"goPage\" size=\"3\" style=\"width: 20px;\" value=\"")
                .append(getCurrentPage())
                .append("\">页&nbsp;\n")
                .append("<input type=\"hidden\" name=\"currentPage\" value=\"")
                .append(getCurrentPage())
                .append("\">\n")
                .append("<input type=\"hidden\" name=\"pageSize\" value=\"")
                .append(getPageSize())
                .append("\">\n")
                .append(
                        "<input type=\"button\" class=\"button\" name=\"go\" value=\"GO\" onclick=\"submitPage(document.all.goPage.value)\">\n")
                .append("</span></td>\n").append("</tr>\n")
                .append("</table>\n").append("<script>\n").append(
                "    function submitPage(page) {\n").append(
                "        document.all.currentPage.value = page;\n")
                .append("        document.forms[0].submit();\n").append("    }\n")
                .append("</script>");
        return rtnStr.toString();
    }
}
