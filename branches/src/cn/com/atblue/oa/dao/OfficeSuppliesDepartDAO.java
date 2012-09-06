package cn.com.atblue.oa.dao;

import java.util.Map;
import java.util.List;
import cn.com.atblue.oa.bean.OfficeSuppliesDepart;

public interface OfficeSuppliesDepartDAO {

    public Object addOfficeSuppliesDepart(OfficeSuppliesDepart paramBean);

    public int modOfficeSuppliesDepart(OfficeSuppliesDepart paramBean);

    public int delOfficeSuppliesDepart(Map paramMap);

    public OfficeSuppliesDepart queryForBean(Map paramMap);

    public List<OfficeSuppliesDepart> queryForList(Map paramMap);

    public int queryForCount(Map paramMap);
}
