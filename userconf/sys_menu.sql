  insert into t_resource_group
    (entity_id,
     resource_group_caption,
     parent_resource_group_id,
     is_leaf,
     display_order,
     default_menu_id)
  values
    (seq_resource_group.nextval,
     'TransactionManage', /*may need to be changed*/
     null, /*may need to be changed*/
     1, /*may need to be changed*/
     1, /*may need to be changed*/
     null /*may need to be changed*/);
