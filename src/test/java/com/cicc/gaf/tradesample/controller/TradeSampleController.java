package com.cicc.gaf.tradesample.controller;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import com.cicc.gaf.fileupload.ImportResultObj;
import com.cicc.gaf.fileupload.WrongMsgObj;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cicc.gaf.logger.Logger;
import com.cicc.gaf.logger.LoggerFactory;
import com.cicc.gaf.datadictionary.service.DataDictionaryService;
import com.cicc.gaf.controller.BaseController;
import com.cicc.gaf.fileupload.CSVEntityHelper;
import com.cicc.gaf.fileupload.ObjectBuilder;
import com.cicc.gaf.util.ResultStatus;
import com.cicc.gaf.util.ResultStatusDesc;
import com.cicc.gaf.tools.JsonUtil;

import com.cicc.gaf.tradesample.model.TradeSample;
import com.cicc.gaf.tradesample.service.TradeSampleService;


@Controller
@RequestMapping(value = "/tradeSample")
public class TradeSampleController extends BaseController {

    public static Logger log = LoggerFactory.getLogger(TradeSampleController.class);
     
	@Autowired
	TradeSampleService tradeSampleService;
	
	@Autowired
	DataDictionaryService dataDictionaryService;
	
	@Value("${gaf.import.csv.folder}")
	private String importFolder;
			
	@RequestMapping(method = RequestMethod.GET, value = "list")
	public String listTradeSample(HttpServletRequest request, Model model) throws Exception {
		readGridSetting(request, model);
		clearComparatorList();
		addWebAttributes(model);
		return "tradeSample/tradeSampleList";
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "load")
	public String loadTradeSample(HttpServletRequest request, @ModelAttribute("tradeSample") TradeSample tradeSample, Model model) throws Exception {
		List<TradeSample> tradeSampleList = tradeSampleService.listByExample(tradeSample, initJqgridPagination(request, model));
		
		model.addAttribute("entityList", tradeSampleList);				
		model.addAttribute("actionPagination", getActionPagination(request, model));
		return "tradeSample/xmlTradeSampleList";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "create")
	public String createTradeSample(HttpServletRequest request, Model model) {
		model.addAttribute("tradeSample", new TradeSample());
		addWebAttributes(model);
		return "tradeSample/tradeSampleDetail";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "read/{id}")
	public String readTradeSample(HttpServletRequest request, @PathVariable("id") Long id, Model model) {
		model.addAttribute("tradeSample", tradeSampleService.read(id));
		addWebAttributes(model);
		return "tradeSample/tradeSampleDetail";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "update")
	public void updateTradeSample(HttpServletResponse response, @ModelAttribute("tradeSample") TradeSample tradeSample, Model model) throws Exception {
		try{		
			Long id = tradeSample.getEntityId();
			if(id == null) {
				tradeSampleService.create(tradeSample);
			} else {
				tradeSampleService.update(tradeSample);
			}
		}catch(Exception e){
			log.error(e.getMessage(), e);
			response.getOutputStream().write(e.getMessage().getBytes("utf-8"));
		}
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "delete/{id}")
	@ResponseBody
	public void deleteTradeSample(HttpServletResponse response, @PathVariable("id") String ids) throws Exception {
		String[]idArray = ids.split(",");
		for(String idStr : idArray){
			Long id = Long.valueOf(idStr);
			try{
				tradeSampleService.delete(id);
				response.getOutputStream().write(("[id:"  + idStr + "] Deleted Successfully!\n").getBytes("utf-8"));
			}catch(Exception e){
				log.error(e.getMessage(), e);
				response.getOutputStream().write(("Meet error when delete id:" + idStr + "--- " + e.getMessage() + "\n").getBytes("utf-8"));
			}
		}
	}
	
	@ModelAttribute
	public void getTradeSample(@RequestParam(value = "id", defaultValue = "-1") Long id, Model model) {
		if (id != -1) {
			model.addAttribute("tradeSample", tradeSampleService.read(id));
		}
	}
	
	private void addWebAttributes(Model model) {

       String tableNameForCurrency = "t_currency";
       String keyColumnNameForCurrency = "entity_id";
	   Map<String,Object> currencyMapTemp = dataDictionaryService.getMap(tableNameForCurrency, keyColumnNameForCurrency, "currency_code");
       Map<Object, String> currencyMap = new TreeMap<Object, String>();
	   Iterator<?> itCurrency = currencyMapTemp.entrySet().iterator();
       while (itCurrency.hasNext()) {
    	    Map.Entry entry = (Map.Entry) itCurrency.next();
    	    String key = (String) entry.getKey();
    	    Object val = entry.getValue();
    	    currencyMap.put(val,key);
    	}
	   currencyMap.put("", "");
       model.addAttribute("currencyMap", currencyMap); 

       String categoryindustrySectorName = "INDUSTRY_SECTOR";
       Map<String,Object> industrySectorMapTemp = dataDictionaryService.getMap(categoryindustrySectorName);
       Map<Object,String> industrySectorMap = new TreeMap<Object, String>();
       Iterator<?> itIndustrySector = industrySectorMapTemp.entrySet().iterator();
       while (itIndustrySector.hasNext()) {
    	    Map.Entry entry = (Map.Entry) itIndustrySector.next();
    	    String key = (String) entry.getKey();
    	    Object val = entry.getValue();
    	    industrySectorMap.put(val,key);
    	}
	   industrySectorMap.put("", "");
       model.addAttribute("industrySectorMap", industrySectorMap); 

       String categoryinstrumentTypeName = "INSTRUMENT_TYPE";
       Map<String,Object> instrumentTypeMapTemp = dataDictionaryService.getMap(categoryinstrumentTypeName);
       Map<Object,String> instrumentTypeMap = new TreeMap<Object, String>();
       Iterator<?> itInstrumentType = instrumentTypeMapTemp.entrySet().iterator();
       while (itInstrumentType.hasNext()) {
    	    Map.Entry entry = (Map.Entry) itInstrumentType.next();
    	    String key = (String) entry.getKey();
    	    Object val = entry.getValue();
    	    instrumentTypeMap.put(val,key);
    	}
	   instrumentTypeMap.put("", "");
       model.addAttribute("instrumentTypeMap", instrumentTypeMap); 

       String tableNameForMarket = "t_market";
       String keyColumnNameForMarket = "entity_id";
	   Map<String,Object> marketMapTemp = dataDictionaryService.getMap(tableNameForMarket, keyColumnNameForMarket, "market_code");
       Map<Object, String> marketMap = new TreeMap<Object, String>();
	   Iterator<?> itMarket = marketMapTemp.entrySet().iterator();
       while (itMarket.hasNext()) {
    	    Map.Entry entry = (Map.Entry) itMarket.next();
    	    String key = (String) entry.getKey();
    	    Object val = entry.getValue();
    	    marketMap.put(val,key);
    	}
	   marketMap.put("", "");
       model.addAttribute("marketMap", marketMap); 

       String categorysideName = "SIDE";
       Map<String,Object> sideMapTemp = dataDictionaryService.getMap(categorysideName);
       Map<Object,String> sideMap = new TreeMap<Object, String>();
       Iterator<?> itSide = sideMapTemp.entrySet().iterator();
       while (itSide.hasNext()) {
    	    Map.Entry entry = (Map.Entry) itSide.next();
    	    String key = (String) entry.getKey();
    	    Object val = entry.getValue();
    	    sideMap.put(val,key);
    	}
	   sideMap.put("", "");
       model.addAttribute("sideMap", sideMap); 
	}
	
	public String list(Model model){
		addWebAttributes(model);
		return "tradeSample/tradeSampleList";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "upload")
	public String upload(HttpServletRequest request, Model model) throws Exception {
		model.addAttribute("contextPath", request.getContextPath());
		return "tradeSample/tradeSampleUpload";
	}
	
	@RequestMapping( method = RequestMethod.POST,value = "/uploadfile")
	public void uploadFile(MultipartHttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {

		Iterator<String> itr = request.getFileNames();

		MultipartFile mpf = request.getFile(itr.next());
		log.info(mpf.getOriginalFilename() + " uploaded!");
		ResultStatus resultStatus = new ResultStatus();

		try {
			InputStream inputStream = mpf.getInputStream();
			String targetPath = this.importFolder + "/" + mpf.getOriginalFilename();
			File newFile = new File(targetPath);
			if (!newFile.exists()) {
				newFile.createNewFile();
			}else{
				newFile.delete();
				newFile.createNewFile();
			}

			OutputStream outputStream = new FileOutputStream(newFile);
			int read = 0;
			byte[] bytes = new byte[1024];

			while ((read = inputStream.read(bytes)) != -1) {
				outputStream.write(bytes, 0, read);
			}

			ObjectBuilder ob = new ObjectBuilder();
			CSVEntityHelper helper = new CSVEntityHelper();
			helper.setFilePath(targetPath);
			helper.packData();

			ob.setEntityHelper(helper);
			ImportResultObj importResultObj = ob.covertToObject(TradeSample.class);
			Boolean successFlag = true;
			int successRecordNum = 0;
			int failureRecordNum = 0;
			String failureRecord = "";
			if(importResultObj.getWrongObjList().size() != 0){
				successFlag = false;
				for(WrongMsgObj wrongMsgObj : importResultObj.getWrongObjList()){
					TradeSample wrongTradeSample = (TradeSample) wrongMsgObj.getObject();
					String errorMsg = wrongMsgObj.getMessage();
					failureRecord = failureRecord + JsonUtil.toJson(wrongTradeSample)+ " Error Msg: " + errorMsg + "\n";
				}
			}
			List<TradeSample> tradeSampleList = (List<TradeSample>) importResultObj.getRightObjList();
			for(TradeSample each : tradeSampleList){
				try{
					tradeSampleService.create(each);
					successRecordNum++;
				}catch(Exception e){
					successFlag  = false;
					failureRecordNum++;
					e.printStackTrace();
					log.error(e.getMessage(), e);
					failureRecord = failureRecord + JsonUtil.toJson(each)+ "\n";
				}
			}
			if(successFlag){
				resultStatus.setStatus(ResultStatusDesc.SUCCESS);
				resultStatus.setMessage("Import csv success! Success import record number: " + successRecordNum);
			}else{
				resultStatus.setStatus(ResultStatusDesc.FAILURE);
				resultStatus.setMessage("Meet error when import Csv! Success import record number: " + successRecordNum + " Failure import record number: " + (failureRecordNum + importResultObj.getWrongObjList().size())
						+ "\n Failure record: " + failureRecord);
			}
			response.getWriter().write(JsonUtil.toJson(resultStatus));
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage(), e);
			resultStatus.setStatus(ResultStatusDesc.FAILURE);
			resultStatus.setMessage("Meet error when import Csv : " + e.getMessage());
			response.getWriter().write(JsonUtil.toJson(resultStatus));
		}
		
	}
}
