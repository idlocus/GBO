package com.cicc.gaf.tradesample.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cicc.gaf.dao.GenericDao;
import com.cicc.gaf.pagesort.Pagination;

import com.cicc.gaf.tradesample.model.TradeSample;

@Service
public class TradeSampleService {
	@Autowired
	GenericDao genericDao;
	
	public Long create(TradeSample tradeSample) {
		return (Long) genericDao.save(tradeSample);
	}
	
	public void update(TradeSample tradeSample) {
		genericDao.update(tradeSample);
	}
	
	public void delete(Long id) {
		TradeSample tradeSample = genericDao.get(TradeSample.class, id);
		genericDao.delete(tradeSample);
	}
	
	public TradeSample read(Long id) {
		return genericDao.get(TradeSample.class, id);
	}

	public List<TradeSample> listByExample(TradeSample tradeSample,Pagination initJqgridPagination) {
		List<TradeSample> tradeSampleList = genericDao.queryByExample(TradeSample.class, tradeSample, initJqgridPagination);
		return tradeSampleList;
	}

}
