package com.ysk.mapper;

import com.ysk.entity.Provider;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProviderMapper {

    int updProvider(Provider provider);

    int addProvider(Provider provider);

    Provider getProviderById(@Param("proId") int proId);
    /**
     * 删除供应商
     */
    int delProviderById(@Param("proId") int proId);
    /**
     * 通过条件查询-供应商表记录数
     */
    int getProCount(@Param("proName") String proName);

    /**
     * 通过条件查询-proList
     */
    List<Provider> getProList(@Param("proName") String proName, @Param("startIndex") int startIndex, @Param("pageSize") int pageSize);

    /**
     * 获取id和proName
     */
    List<Provider> getIdAndName();

}
