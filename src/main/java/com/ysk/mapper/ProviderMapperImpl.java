package com.ysk.mapper;

import com.ysk.entity.Provider;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("providerMapper")
public class ProviderMapperImpl implements ProviderMapper {
    private SqlSessionTemplate sqlSessionTemplate;
    @Autowired
    public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

    @Override
    public int updProvider(Provider provider) {
        return sqlSessionTemplate.getMapper(ProviderMapper.class).updProvider(provider);
    }

    @Override
    public int addProvider(Provider provider) {
        return sqlSessionTemplate.getMapper(ProviderMapper.class).addProvider(provider);
    }

    @Override
    public Provider getProviderById(int proId) {
        return sqlSessionTemplate.getMapper(ProviderMapper.class).getProviderById(proId);
    }

    @Override
    public int delProviderById(int proId) {
        return sqlSessionTemplate.getMapper(ProviderMapper.class).delProviderById(proId);
    }

    @Override
    public int getProCount(String proName) {
        return sqlSessionTemplate.getMapper(ProviderMapper.class).getProCount(proName);
    }

    @Override
    public List<Provider> getProList(String proName, int startIndex, int pageSize) {
        return sqlSessionTemplate.getMapper(ProviderMapper.class).getProList(proName, startIndex, pageSize);
    }

    @Override
    public List<Provider> getIdAndName() {
        return sqlSessionTemplate.getMapper(ProviderMapper.class).getIdAndName();
    }

}
