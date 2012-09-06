package cn.com.atblue.oa.dao.impl;

import java.util.Map;
import java.util.List;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import cn.com.atblue.oa.bean.OfficeSuppliesDepart;
import cn.com.atblue.oa.dao.OfficeSuppliesDepartDAO;

public class OfficeSuppliesDepartImpl extends SqlMapClientDaoSupport implements OfficeSuppliesDepartDAO {

    public Object addOfficeSuppliesDepart(OfficeSuppliesDepart paramBean){
        return this.getSqlMapClientTemplate().insert("oa.officesuppliesdepart.addOfficeSuppliesDepart", paramBean);
    }

    public int modOfficeSuppliesDepart(OfficeSuppliesDepart paramBean){
        return this.getSqlMapClientTemplate().update("oa.officesuppliesdepart.modOfficeSuppliesDepart", paramBean);
    }

    public int delOfficeSuppliesDepart(Map paramMap){
        return this.getSqlMapClientTemplate().delete("oa.officesuppliesdepart.delOfficeSuppliesDepart", paramMap);
    }

    public OfficeSuppliesDepart queryForBean(Map paramMap){
        return (OfficeSuppliesDepart)this.getSqlMapClientTemplate().queryForObject("oa.officesuppliesdepart.queryForBean",paramMap);
    }

    public List<OfficeSuppliesDepart> queryForList(Map paramMap){
        return this.getSqlMapClientTemplate().queryForList("oa.officesuppliesdepart.queryForList", paramMap);
    }

    public int queryForCount(Map paramMap){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("oa.officesuppliesdepart.queryForCount", paramMap);
    }
}
