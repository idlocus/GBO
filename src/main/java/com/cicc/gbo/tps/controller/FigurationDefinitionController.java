package com.cicc.gbo.tps.controller;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Iterator;
import java.util.List;
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

import com.cicc.gbo.tps.model.FigurationDefinition;
import com.cicc.gbo.tps.service.FigurationDefinitionService;


@Controller
@RequestMapping(value = "/figurationDefinition")
public class FigurationDefinitionController extends BaseController {

    public static Logger logger = LoggerFactory.getLogger(FigurationDefinitionController.class);
     
	@Autowired
	FigurationDefinitionService figurationDefinitionService;
	
	@Autowired
	DataDictionaryService dataDictionaryService;
	
	@Value("${gaf.import.csv.folder}")
	private String importFolder;
			
	@RequestMapping(method = RequestMethod.GET, value = "list")
	public String listFigurationDefinition(HttpServletRequest request, Model model) throws Exception {
		readGridSetting(request, model);
		clearComparatorList();
		addWebAttributes(model);
		return "figurationDefinition/figurationDefinitionList";
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "load")
	public String loadFigurationDefinition(HttpServletRequest request, @ModelAttribute("figurationDefinition") FigurationDefinition figurationDefinition, Model model) throws Exception {
		List<FigurationDefinition> figurationDefinitionList = figurationDefinitionService.listByExample(figurationDefinition, initJqgridPagination(request, model));
		
		model.addAttribute("entityList", figurationDefinitionList);				
		model.addAttribute("actionPagination", getActionPagination(request, model));
		return "figurationDefinition/xmlFigurationDefinitionList";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "create")
	public String createFigurationDefinition(HttpServletRequest request, Model model) {
		model.addAttribute("figurationDefinition", new FigurationDefinition());
		addWebAttributes(model);
		return "figurationDefinition/figurationDefinitionDetail";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "read/{id}")
	public String readFigurationDefinition(HttpServletRequest request, @PathVariable("id") Long id, Model model) {
		model.addAttribute("figurationDefinition", figurationDefinitionService.read(id));
		addWebAttributes(model);
		return "figurationDefinition/figurationDefinitionDetail";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "update")
	public void updateFigurationDefinition(HttpServletResponse response, @ModelAttribute("figurationDefinition") FigurationDefinition figurationDefinition, Model model) throws Exception {
		try{		
			Long id = figurationDefinition.getEntityId();
			if(id == null) {
				figurationDefinitionService.create(figurationDefinition);
			} else {
				figurationDefinitionService.update(figurationDefinition);
			}
		}catch(Exception e){
			logger.error(e.getMessage(), e);
			response.getOutputStream().write(e.getMessage().getBytes("utf-8"));
		}
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "delete/{id}")
	@ResponseBody
	public void deleteFigurationDefinition(HttpServletResponse response, @PathVariable("id") String ids) throws Exception {
		String[]idArray = ids.split(",");
		for(String idStr : idArray){
			Long id = Long.valueOf(idStr);
			try{
				figurationDefinitionService.delete(id);
				response.getOutputStream().write(("[id:"  + idStr + "] Deleted Successfully!\n").getBytes("utf-8"));
			}catch(Exception e){
				logger.error(e.getMessage(), e);
				response.getOutputStream().write(("Meet error when delete id:" + idStr + "--- " + e.getMessage() + "\n").getBytes("utf-8"));
			}
		}
	}
	
	@ModelAttribute
	public void getFigurationDefinition(@RequestParam(value = "id", defaultValue = "-1") Long id, Model model) {
		if (id != -1) {
			model.addAttribute("figurationDefinition", figurationDefinitionService.read(id));
		}
	}
	
	private void addWebAttributes(Model model) {
	}
	
	public String list(Model model){
		addWebAttributes(model);
		return "figurationDefinition/figurationDefinitionList";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "upload")
	public String upload(HttpServletRequest request, Model model) throws Exception {
		model.addAttribute("contextPath", request.getContextPath());
		return "figurationDefinition/figurationDefinitionUpload";
	}
	
	@RequestMapping( method = RequestMethod.POST,value = "/uploadfile")
	public void uploadFile(MultipartHttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {

		Iterator<String> itr = request.getFileNames();

		MultipartFile mpf = request.getFile(itr.next());
		logger.info(mpf.getOriginalFilename() + " uploaded!");
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

			@SuppressWarnings("resource")
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
			ImportResultObj importResultObj = ob.covertToObject(FigurationDefinition.class);
			Boolean successFlag = true;
			int successRecordNum = 0;
			int failureRecordNum = 0;
			String failureRecord = "";
			if(importResultObj.getWrongObjList().size() != 0){
				successFlag = false;
				for(WrongMsgObj wrongMsgObj : importResultObj.getWrongObjList()){
					FigurationDefinition wrongFigurationDefinition = (FigurationDefinition) wrongMsgObj.getObject();
					String errorMsg = wrongMsgObj.getMessage();
					failureRecord = failureRecord + JsonUtil.toJson(wrongFigurationDefinition)+ " Error Msg: " + errorMsg + "\n";
				}
			}
			@SuppressWarnings("unchecked")
			List<FigurationDefinition> figurationDefinitionList = (List<FigurationDefinition>) importResultObj.getRightObjList();
			for(FigurationDefinition each : figurationDefinitionList){
				try{
					figurationDefinitionService.create(each);
					successRecordNum++;
				}catch(Exception e){
					successFlag  = false;
					failureRecordNum++;
					e.printStackTrace();
					logger.error(e.getMessage(), e);
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
			logger.error(e.getMessage(), e);
			resultStatus.setStatus(ResultStatusDesc.FAILURE);
			resultStatus.setMessage("Meet error when import Csv : " + e.getMessage());
			response.getWriter().write(JsonUtil.toJson(resultStatus));
		}
		
	}
}
