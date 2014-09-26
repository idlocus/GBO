package com.cicc.gbo.tps.figurator;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.cicc.gbo.core.component.ProcessObjectService;
import com.cicc.gbo.core.figurator.AbstractFigurator;
import com.cicc.gbo.core.model.ProcessObject;
import com.cicc.gbo.tps.model.Figuration;
import com.cicc.gbo.tps.model.Trade;
import com.cicc.gbo.tps.service.FigurationService;

/**
 * @author Guo Hua
 * @version 上午10:03:30 2014年9月23日 
 */
public class TransactionFigurator extends AbstractFigurator {
	
	@Autowired
	FigurationService figurationService;
	@Autowired
	ProcessObjectService processObjectService;

	@Override
	public boolean figure(Trade processTransaction,
			ProcessObject processObject) {
		try {
			List<Figuration> figurationList = new ArrayList<Figuration>();
			if (StringUtils.isNotEmpty(processTransaction.getTemplateId())) {
				List<Figuration> tradeFigurationList = figurationService.getFiguration(processTransaction);
				figurationList.addAll(tradeFigurationList);
			}
			processObjectService.addResultTransaction(processObject, figurationList);
			//figurationService.createAndUpdate(figurationList);
		} catch (Exception e) {
			this.processException(processTransaction, e);
			return false;
		}
		return true;
	}

}
