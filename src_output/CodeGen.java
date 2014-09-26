///////////////////////////////////////////////////////////////////////////////////////////////// 


create table T_TEMPLATE_FEE_LINK
(
      ENTITY_ID   NUMBER not null, -- Primary key 
      CHILD_RECORD_ID  VARCHAR2(1000),
                      EXTERNAL_RECORD_ID  VARCHAR2(1000),
          FEE_ID  VARCHAR2(1000),
          GROUP_RECORD_ID  VARCHAR2(1000),
                INTERNAL_RECORD_ID  VARCHAR2(1000),
          IS_ENABLE  NUMBER,
                PARENT_RECORD_ID  VARCHAR2(1000),
          RECORD_REMARK  VARCHAR2(1000),
          RECORD_STATUS  VARCHAR2(1000),
          ROOT_RECORD_ID  VARCHAR2(1000),
          TEMPLATE_ID  VARCHAR2(1000),
                        VERSION_NUMBER NUMBER,   
      INSERT_TIME  TIMESTAMP,
      CREATED_BY  VARCHAR2(100),
      UPDATED_BY  VARCHAR2(100),
      LAST_UPDATE_TIME  TIMESTAMP
);

alter table T_TEMPLATE_FEE_LINK
  add constraint PK_T_TEMPLATE_FEE_LINK primary key (ENTITY_ID)
  using index;
  
CREATE sequence SEQ_TEMPLATE_FEE_LINK 
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 10; 
 
 
/////////////////////////////////////////////////////////////////////////////////////////////////
declare
  v_group_id number;

begin

  select seq_resource_group.nextval into v_group_id from dual;
  insert into t_resource_group
    (entity_id,
     resource_group_caption,
     parent_resource_group_id,
     is_leaf,
     display_order,
     default_menu_id)
  values
    (v_group_id,
     'TemplateFeeLink', /*may need to be changed*/
     null, /*may need to be changed*/
     1, /*may need to be changed*/
     1, /*may need to be changed*/
     null /*may need to be changed*/);

-- for CRUD, 9 resources needed
-- menu resource
insert into t_resource
  (entity_id,
   resource_group_id,
   resource_name,
   resource_operation,
   default_resource,
   resource_description_ui,
   is_menu_resource)
values
  (seq_resource_id.nextval, v_group_id, /*need to be changed to resource_group_id*/ '/templateFeeLink/list', 'GET', 0, /*may need to be changed*/'List TemplateFeeLinks', 1);

-- other resources
insert into t_resource
  (entity_id,
   resource_group_id,
   resource_name,
   resource_operation,
   default_resource,
   resource_description_ui,
   is_menu_resource)
values
  (seq_resource_id.nextval, v_group_id, /*need to be changed to resource_group_id*/ '/templateFeeLink/create', 'POST', 0, /*may need to be changed*/'Add TemplateFeeLinks', 0);  

insert into t_resource
  (entity_id,
   resource_group_id,
   resource_name,
   resource_operation,
   default_resource,
   resource_description_ui,
   is_menu_resource)
values
  (seq_resource_id.nextval, v_group_id, /*need to be changed to resource_group_id*/ '/templateFeeLink/delete/{?}', 'POST', 0, /*may need to be changed*/'Delete TemplateFeeLinks', 0);  

insert into t_resource
  (entity_id,
   resource_group_id,
   resource_name,
   resource_operation,
   default_resource,
   resource_description_ui,
   is_menu_resource)
values
  (seq_resource_id.nextval, v_group_id, /*need to be changed to resource_group_id*/ '/templateFeeLink/read/{?}', 'POST', 0, /*may need to be changed*/'Read TemplateFeeLinks', 0);  

insert into t_resource
  (entity_id,
   resource_group_id,
   resource_name,
   resource_operation,
   default_resource,
   resource_description_ui,
   is_menu_resource)
values
  (seq_resource_id.nextval, v_group_id, /*need to be changed to resource_group_id*/ '/templateFeeLink/update', 'POST', 0, /*may need to be changed*/'Update TemplateFeeLinks', 0);  

insert into t_resource
  (entity_id,
   resource_group_id,
   resource_name,
   resource_operation,
   default_resource,
   resource_description_ui,
   is_menu_resource)
values
  (seq_resource_id.nextval, v_group_id, /*need to be changed to resource_group_id*/ '/templateFeeLink/load', 'GET', 0, /*may need to be changed*/'Load TemplateFeeLinks', 0);  

insert into t_resource
  (entity_id,
   resource_group_id,
   resource_name,
   resource_operation,
   default_resource,
   resource_description_ui,
   is_menu_resource)
values
  (seq_resource_id.nextval, v_group_id, /*need to be changed to resource_group_id*/ '/templateFeeLink/deleteGridSetting', 'GET', 0, /*may need to be changed*/'DeleteGridSetting TemplateFeeLinks', 0);  

insert into t_resource
  (entity_id,
   resource_group_id,
   resource_name,
   resource_operation,
   default_resource,
   resource_description_ui,
   is_menu_resource)
values
  (seq_resource_id.nextval, v_group_id, /*need to be changed to resource_group_id*/ '/templateFeeLink/saveGridSetting', 'POST', 0, /*may need to be changed*/'SaveGridSetting TemplateFeeLinks', 0);  

insert into t_resource
  (entity_id,
   resource_group_id,
   resource_name,
   resource_operation,
   default_resource,
   resource_description_ui,
   is_menu_resource)
values
  (seq_resource_id.nextval, v_group_id, /*need to be changed to resource_group_id*/ '/templateFeeLink/export2Csv', 'POST', 0, /*may need to be changed*/'Export2Csv TemplateFeeLinks', 0);  

end;

