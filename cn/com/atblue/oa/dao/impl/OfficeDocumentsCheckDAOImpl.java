package cn.com.atblue.oa.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import cn.com.atblue.common.bean.PageBean;
import cn.com.atblue.oa.bean.OfficeDocumentsCheck;
import cn.com.atblue.oa.dao.OfficeDocumentsCheckDAO;

public class OfficeDocumentsCheckDAOImpl extends SqlMapClientDaoSupport implements OfficeDocumentsCheckDAO {

    /**
     * This method was generated by Abator for iBATIS.
     * This method corresponds to the database table OFFICE_DOCUMENTS_CHECK
     *
     * @abatorgenerated Sun Feb 21 17:24:15 CST 2010
     */
    public OfficeDocumentsCheckDAOImpl() {
        super();
    }

    /**
     * This method was generated by Abator for iBATIS.
     * This method corresponds to the database table OFFICE_DOCUMENTS_CHECK
     *
     * @abatorgenerated Sun Feb 21 17:24:15 CST 2010
     */
    public void insert(OfficeDocumentsCheck record) {
        getSqlMapClientTemplate().insert("OFFICE_DOCUMENTS_CHECK.abatorgenerated_insert", record);
    }

    /**
     * This method was generated by Abator for iBATIS.
     * This method corresponds to the database table OFFICE_DOCUMENTS_CHECK
     *
     * @abatorgenerated Sun Feb 21 17:24:15 CST 2010
     */
    public int updateByPrimaryKey(OfficeDocumentsCheck record) {
        int rows = getSqlMapClientTemplate().update("OFFICE_DOCUMENTS_CHECK.abatorgenerated_updateByPrimaryKey", record);
        return rows;
    }

    /**
     * This method was generated by Abator for iBATIS.
     * This method corresponds to the database table OFFICE_DOCUMENTS_CHECK
     *
     * @abatorgenerated Sun Feb 21 17:24:15 CST 2010
     */
    public int updateByPrimaryKeySelective(OfficeDocumentsCheck record) {
        int rows = getSqlMapClientTemplate().update("OFFICE_DOCUMENTS_CHECK.abatorgenerated_updateByPrimaryKeySelective", record);
        return rows;
    }

    /**
     * This method was generated by Abator for iBATIS.
     * This method corresponds to the database table OFFICE_DOCUMENTS_CHECK
     *
     * @abatorgenerated Sun Feb 21 17:24:15 CST 2010
     */
    public OfficeDocumentsCheck selectByPrimaryKey(String chekid) {
        OfficeDocumentsCheck key = new OfficeDocumentsCheck();
        key.setChekid(chekid);
        OfficeDocumentsCheck record = (OfficeDocumentsCheck) getSqlMapClientTemplate().queryForObject("OFFICE_DOCUMENTS_CHECK.abatorgenerated_selectByPrimaryKey", key);
        return record;
    }

    /**
     * This method was generated by Abator for iBATIS.
     * This method corresponds to the database table OFFICE_DOCUMENTS_CHECK
     *
     * @abatorgenerated Sun Feb 21 17:24:15 CST 2010
     */
    public int deleteByPrimaryKey(String chekid) {
        OfficeDocumentsCheck key = new OfficeDocumentsCheck();
        key.setChekid(chekid);
        int rows = getSqlMapClientTemplate().delete("OFFICE_DOCUMENTS_CHECK.abatorgenerated_deleteByPrimaryKey", key);
        return rows;
    }

	public List getByFreeSql(String sql, PageBean pb) {
		Map map = new HashMap();
		map.put("currentPage", pb.getCurrentPage());
		map.put("pageSize", pb.getPageSize());
		map.put("sql", sql);
		return getSqlMapClientTemplate().queryForList("OFFICE_DOCUMENTS_CHECK.getByFreeSql",map);
	}

	public int getByFreeSqlCount(String sql) {
		return (Integer)getSqlMapClientTemplate().queryForObject("OFFICE_DOCUMENTS_CHECK.getByFreeSqlCount",sql);
	}

	public List getMapByFreeSql(String sql, PageBean pb) {
		Map map = new HashMap();
		map.put("currentPage", pb.getCurrentPage());
		map.put("pageSize", pb.getPageSize());
		map.put("sql", sql);
		return getSqlMapClientTemplate().queryForList("OFFICE_DOCUMENTS_CHECK.getMapByFreeSql",map);
	}

	public int getMapByFreeSqlCount(String sql) {
		return (Integer)getSqlMapClientTemplate().queryForObject("OFFICE_DOCUMENTS_CHECK.getMapByFreeSqlCount",sql);
	}

	public OfficeDocumentsCheck selectByDocumentidCheckMan(String documentid,
			String checkman) {
		Map map = new HashMap();
		map.put("documentid",documentid);
		map.put("checkman", checkman); 
		
		List list = getSqlMapClientTemplate().queryForList("OFFICE_DOCUMENTS_CHECK.selectByDocumentidCheckMan",map);
		if(list!=null && list.size()>0){
			return (OfficeDocumentsCheck)list.get(0);
		}
		return null;
	}
}