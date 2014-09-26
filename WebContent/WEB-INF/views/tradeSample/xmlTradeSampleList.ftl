<#import "/gaf/common.ftl" as common/>
<#compress>
<response>
<@common.jqGridContext/>
  <rows>
   <#escape x as x?xml>
    <#list entityList as tradeSample>
      <row>
                       <amount><#if tradeSample.amount?exists>${tradeSample.amount?string("#,###.##")}</#if></amount>        
                                                      <client>${common.getValueByKey("com.cicc.gaf.tradesample.model.TradeSample","getClient",tradeSample.client!'')}</client>     
                                             <createdBy>${tradeSample.createdBy!''}</createdBy>     
                                                      <currency>${common.getValueByKey("com.cicc.gaf.tradesample.model.TradeSample","getCurrency",tradeSample.currency!'')}</currency>     
                                                                             <industrySector>${common.getValueByKey("com.cicc.gaf.tradesample.model.TradeSample","getIndustrySector",tradeSample.industrySector!'')}</industrySector>     
                                             <insertTime><#if tradeSample.insertTime?exists>${tradeSample.insertTime?string("yyyy-MM-dd")}</#if></insertTime>
                                                      <instrumentType>${common.getValueByKey("com.cicc.gaf.tradesample.model.TradeSample","getInstrumentType",tradeSample.instrumentType!'')}</instrumentType>     
                                             <lastUpdateTime><#if tradeSample.lastUpdateTime?exists>${tradeSample.lastUpdateTime?string("yyyy-MM-dd")}</#if></lastUpdateTime>
                                                      <market>${common.getValueByKey("com.cicc.gaf.tradesample.model.TradeSample","getMarket",tradeSample.market!'')}</market>     
                                             <price><#if tradeSample.price?exists>${tradeSample.price?string("#,###.######")}</#if></price>        
                                    <qty><#if tradeSample.qty?exists>${tradeSample.qty?string("#,###")}</#if></qty>        
                                    <remark>${tradeSample.remark!''}</remark>     
                                    <settlementDate><#if tradeSample.settlementDate?exists>${tradeSample.settlementDate?string("yyyy-MM-dd")}</#if></settlementDate>
                                                      <side>${common.getValueByKey("com.cicc.gaf.tradesample.model.TradeSample","getSide",tradeSample.side!'')}</side>     
                                             <symbol>${tradeSample.symbol!''}</symbol>     
                                    <tradeDate><#if tradeSample.tradeDate?exists>${tradeSample.tradeDate?string("yyyy-MM-dd")}</#if></tradeDate>
                                    <updatedBy>${tradeSample.updatedBy!''}</updatedBy>     
                                    <versionNumber>${tradeSample.versionNumber!''}</versionNumber>     
                          <entityId><#if tradeSample.entityId?exists>${tradeSample.entityId?c}</#if></entityId>
  </row>
    </#list>
   </#escape>
  </rows>
</response>
</#compress>  