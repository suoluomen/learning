﻿#订价因素列表过滤
delete from pb_meta_filters where filterDesc='订价因素列表过滤';
select ifnull(max(id),0)+1 into @filtersolutionid from pb_meta_filters;
insert into pb_meta_filters(id,`filterName`,`filterDesc`,`subId`,`createTime`,`isUpGrade`,`dr`) 
values (@filtersolutionid,'SA_sa_basearchive_orderFactorlist','订价因素列表过滤','SA','2016-12-07 14:01:56',0,0);
update bill_base set cFilterId=@filtersolutionid where cBillNo='sa_basearchive_orderFactorlist';

delete from pb_filter_solution where filtersId=@filtersolutionid;
select ifnull(max(id),0)+1 into @idnum from pb_filter_solution;
insert into pb_filter_solution(`id`,`filtersId`,`solutionName`,`isDefault`,`isPublic`,`userId`,`orderId`) 
values (@idnum,@filtersolutionid,'待审批',1,1,2,null);
set @idnum=@idnum+1;
insert into pb_filter_solution(`id`,`filtersId`,`solutionName`,`isDefault`,`isPublic`,`userId`,`orderId`) 
values (@idnum,@filtersolutionid,'待收货',0,1,2,null);
set @idnum=@idnum+1;
insert into pb_filter_solution(`id`,`filtersId`,`solutionName`,`isDefault`,`isPublic`,`userId`,`orderId`) 
values (@idnum,@filtersolutionid,'待入库',0,1,2,null);
set @idnum=@idnum+1;
insert into pb_filter_solution(`id`,`filtersId`,`solutionName`,`isDefault`,`isPublic`,`userId`,`orderId`) 
values (@idnum,@filtersolutionid,'本月订单',0,1,2,null);

delete from pb_meta_filter_item where filtersId=@filtersolutionid;
select ifnull(max(id),0)+1 into @idnum from pb_meta_filter_item;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`) 
values  (@idnum, @filtersolutionid, 'code', '订单编号', 'Refer', null, null, null, null, 'eq', null, 'code', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:01:56', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'purchasingType.name', '采购类型', 'Refer', null, null, null, null, 'between', null, 'purchasingType.name', null, '1', '0', '0', '1', '0', '0', null, null, null, '1', '2016-12-07 14:01:56', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'bustype', '业务类型', 'Input', null, null, null, null, 'eq', null, 'bustype', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:01:56', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'status', '订单状态', 'Select', null, null, null, null, 'eq', null, 'status', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:01:56', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'exestatus', '订单执行状态', 'Select', null, null, null, null, 'between', null, 'exestatus', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:01:56', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'vouchdate', '订单日期', 'DatePicker', null, null, null, null, 'between', null, 'vouchdate', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:01:56', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'department.name', '采购部门', 'Refer', null, null, null, null, 'between', null, 'department.name', null, '1', '0', '0', '1', '0', '0', null, null, null, '1', '2016-12-07 14:01:57', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'person.name', '业务员', 'Refer', null, null, null, null, 'between', null, 'person.name', null, '1', '0', '0', '1', '0', '0', null, null, null, '1', '2016-12-07 14:01:57', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'vendor.name', '供应商', 'Refer', null, null, null, null, 'between', null, 'vendor.name', null, '1', '0', '0', '1', '0', '0', null, null, null, '1', '2016-12-07 14:01:57', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'creator', '制单人', 'Refer', null, null, null, null, 'between', null, 'creator', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:01:57', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'auditor', '审核人', 'Refer', null, null, null, null, 'between', null, 'auditor', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:01:57', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'auditDate', '审批日期', 'DatePicker', null, null, null, null, 'between', null, 'auditDate', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:01:57', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'closeDate', '关闭日期', 'DatePicker', null, null, null, null, 'between', null, 'closeDate', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:01:57', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'changer', '变更人', 'Refer', null, null, null, null, 'between', null, 'changer', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:01:57', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'changeAuditor', '变更审核人', 'Refer', null, null, null, null, 'between', null, 'changeAuditor', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:01:57', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'changeAuditDate', '变更审核日期', 'DatePicker', null, null, null, null, 'between', null, 'changeAuditDate', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:01:57', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.needOrg.name', '需求组织', 'Input', null, null, null, null, 'between', null, 'orderDetails.needOrg.name', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:01:58', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.receiptOrg.name', '收货组织', 'Input', null, null, null, null, 'between', null, 'orderDetails.receiptOrg.name', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:01:58', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.inventory.code', '料品编码', 'Input', null, null, null, null, 'between', null, 'orderDetails.inventory.code', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:01:58', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.inventory.name', '料品名称', 'Input', null, null, null, null, 'between', null, 'orderDetails.inventory.name', null, '1', '0', '0', '1', '0', '0', null, null, null, '1', '2016-12-07 14:01:58', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.inventory.model', '型号', 'Input', null, null, null, null, 'between', null, 'orderDetails.inventory.model', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:01:58', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.free1', '自由项1', 'Input', null, null, null, null, 'between', null, 'orderDetails.inventory.free1', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:01:58', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.free2', '自由项2', 'Input', null, null, null, null, 'between', null, 'orderDetails.inventory.free2', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:01:58', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.free3', '自由项3', 'Input', null, null, null, null, 'between', null, 'orderDetails.inventory.free3', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:01:58', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.free4', '自由项4', 'Input', null, null, null, null, 'between', null, 'orderDetails.inventory.free4', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:01:58', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.free5', '自由项5', 'Input', null, null, null, null, 'between', null, 'orderDetails.inventory.free5', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:01:58', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.free6', '自由项6', 'Input', null, null, null, null, 'between', null, 'orderDetails.inventory.free6', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:01:58', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.free7', '自由项7', 'Input', null, null, null, null, 'between', null, 'orderDetails.inventory.free7', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:01:58', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.free8', '自由项8', 'Input', null, null, null, null, 'between', null, 'orderDetails.inventory.free8', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:01:58', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.free9', '自由项9', 'Input', null, null, null, null, 'between', null, 'orderDetails.inventory.free9', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:01:58', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.free10', '自由项10', 'Input', null, null, null, null, 'between', null, 'orderDetails.inventory.free10', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:01:58', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.inventory.inventoryCustomItems.define1', '料品自定义项1', 'Input', null, null, null, null, 'between', null, 'orderDetails.inventory.inventoryCustomItems.define1', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:01:59', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.inventory.inventoryCustomItems.define2', '料品自定义项2', 'Input', null, null, null, null, 'between', null, 'orderDetails.inventory.inventoryCustomItems.define2', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:01:59', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.inventory.inventoryCustomItems.define3', '料品自定义项3', 'Input', null, null, null, null, 'between', null, 'orderDetails.inventory.inventoryCustomItems.define3', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:01:59', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.inventory.inventoryCustomItems.define4', '料品自定义项4', 'Input', null, null, null, null, 'between', null, 'orderDetails.inventory.inventoryCustomItems.define4', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:01:59', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.inventory.inventoryCustomItems.define5', '料品自定义项5', 'Input', null, null, null, null, 'between', null, 'orderDetails.inventory.inventoryCustomItems.define5', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:01:59', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.inventory.inventoryCustomItems.define6', '料品自定义项6', 'Input', null, null, null, null, 'between', null, 'orderDetails.inventory.inventoryCustomItems.define6', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:01:59', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.inventory.inventoryCustomItems.define7', '料品自定义项7', 'Input', null, null, null, null, 'between', null, 'orderDetails.inventory.inventoryCustomItems.define7', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:01:59', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.inventory.inventoryCustomItems.define8', '料品自定义项8', 'Input', null, null, null, null, 'between', null, 'orderDetails.inventory.inventoryCustomItems.define8', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:01:59', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.inventory.inventoryCustomItems.define9', '料品自定义项9', 'Input', null, null, null, null, 'between', null, 'orderDetails.inventory.inventoryCustomItems.define9', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:01:59', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.inventory.inventoryCustomItems.define10', '料品自定义项10', 'Input', null, null, null, null, 'between', null, 'orderDetails.inventory.inventoryCustomItems.define10', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:01:59', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.inventory.inventoryCustomItems.define11', '料品自定义项11', 'Input', null, null, null, null, 'between', null, 'orderDetails.inventory.inventoryCustomItems.define11', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:01:59', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.inventory.inventoryCustomItems.define12', '料品自定义项12', 'Input', null, null, null, null, 'between', null, 'orderDetails.inventory.inventoryCustomItems.define12', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:01:59', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.inventory.inventoryCustomItems.define13', '料品自定义项13', 'Input', null, null, null, null, 'between', null, 'orderDetails.inventory.inventoryCustomItems.define13', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:01:59', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.inventory.inventoryCustomItems.define14', '料品自定义项14', 'Input', null, null, null, null, 'between', null, 'orderDetails.inventory.inventoryCustomItems.define14', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:01:59', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.inventory.inventoryCustomItems.define15', '料品自定义项15', 'Input', null, null, null, null, 'between', null, 'orderDetails.inventory.inventoryCustomItems.define15', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:00', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.inventory.inventoryCustomItems.define16', '料品自定义项16', 'Input', null, null, null, null, 'between', null, 'orderDetails.inventory.inventoryCustomItems.define16', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:00', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.inventory.inventoryCustomItems.define17', '料品自定义项17', 'Input', null, null, null, null, 'between', null, 'orderDetails.inventory.inventoryCustomItems.define17', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:00', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.inventory.inventoryCustomItems.define18', '料品自定义项18', 'Input', null, null, null, null, 'between', null, 'orderDetails.inventory.inventoryCustomItems.define18', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:00', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.inventory.inventoryCustomItems.define19', '料品自定义项19', 'Input', null, null, null, null, 'between', null, 'orderDetails.inventory.inventoryCustomItems.define19', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:00', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.inventory.inventoryCustomItems.define20', '料品自定义项20', 'Input', null, null, null, null, 'between', null, 'orderDetails.inventory.inventoryCustomItems.define20', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:00', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.inventory.inventoryCustomItems.define21', '料品自定义项21', 'Input', null, null, null, null, 'between', null, 'orderDetails.inventory.inventoryCustomItems.define21', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:00', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.inventory.inventoryCustomItems.define22', '料品自定义项22', 'Input', null, null, null, null, 'between', null, 'orderDetails.inventory.inventoryCustomItems.define22', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:00', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.inventory.inventoryCustomItems.define23', '料品自定义项23', 'Input', null, null, null, null, 'between', null, 'orderDetails.inventory.inventoryCustomItems.define23', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:00', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.inventory.inventoryCustomItems.define24', '料品自定义项24', 'Input', null, null, null, null, 'between', null, 'orderDetails.inventory.inventoryCustomItems.define24', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:00', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.inventory.inventoryCustomItems.define25', '料品自定义项25', 'Input', null, null, null, null, 'between', null, 'orderDetails.inventory.inventoryCustomItems.define25', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:00', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.inventory.inventoryCustomItems.define26', '料品自定义项26', 'Input', null, null, null, null, 'between', null, 'orderDetails.inventory.inventoryCustomItems.define26', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:00', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.inventory.inventoryCustomItems.define27', '料品自定义项27', 'Input', null, null, null, null, 'between', null, 'orderDetails.inventory.inventoryCustomItems.define27', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:00', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.inventory.inventoryCustomItems.define28', '料品自定义项28', 'Input', null, null, null, null, 'between', null, 'orderDetails.inventory.inventoryCustomItems.define28', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:00', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.inventory.inventoryCustomItems.define29', '料品自定义项29', 'Input', null, null, null, null, 'between', null, 'orderDetails.inventory.inventoryCustomItems.define29', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:00', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.inventory.inventoryCustomItems.define30', '料品自定义项30', 'Input', null, null, null, null, 'between', null, 'orderDetails.inventory.inventoryCustomItems.define30', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:00', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.invvendor.code', '供应商料品编码', 'Input', null, null, null, null, 'between', null, 'orderDetails.invvendor.code', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:00', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.invvendor.name', '供应商料品名称', 'Input', null, null, null, null, 'between', null, 'orderDetails.invvendor.name', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:01', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.natMoney', '本币无税金额', 'InputNumber', null, null, null, null, 'eq', null, 'orderDetails.natMoney', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:01', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.natSum', '本币价税合计', 'InputNumber', null, null, null, null, 'eq', null, 'orderDetails.natSum', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:01', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.linecloser', '行关闭人', 'Input', null, null, null, null, 'eq', null, 'orderDetails.linecloser', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:01', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.natSum', '本币价税合计', 'InputNumber', null, null, null, null, 'eq', null, 'orderDetails.natSum', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:01', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, null, '是否审核', 'Input', null, null, null, null, 'between', null, null, null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:01', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, null, '是否关闭', 'Input', null, null, null, null, 'between', null, 'orderDetails.invvendor.code', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:01', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, null, '是否提交', 'Input', null, null, null, null, 'between', null, 'orderDetails.invvendor.name', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:01', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, null, '本人待审', 'Input', null, null, null, null, 'between', null, 'orderDetails.invvendor.name', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:01', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'headItem.define1', '表头自定义项1', 'Input', null, null, null, null, 'between', null, 'headItem.define1', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:01', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'headItem.define2', '表头自定义项2', 'Input', null, null, null, null, 'between', null, 'headItem.define2', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:01', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'headItem.define3', '表头自定义项3', 'Input', null, null, null, null, 'between', null, 'headItem.define3', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:01', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'headItem.define4', '表头自定义项4', 'Input', null, null, null, null, 'between', null, 'headItem.define4', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:01', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'headItem.define5', '表头自定义项5', 'Input', null, null, null, null, 'between', null, 'headItem.define5', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:01', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'headItem.define6', '表头自定义项6', 'Input', null, null, null, null, 'between', null, 'headItem.define6', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:01', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'headItem.define7', '表头自定义项7', 'Input', null, null, null, null, 'between', null, 'headItem.define7', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:01', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'headItem.define8', '表头自定义项8', 'Input', null, null, null, null, 'between', null, 'headItem.define8', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:01', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'headItem.define9', '表头自定义项9', 'Input', null, null, null, null, 'between', null, 'headItem.define9', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:01', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'headItem.define10', '表头自定义项10', 'Input', null, null, null, null, 'between', null, 'headItem.define10', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:01', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'headItem.define11', '表头自定义项11', 'Input', null, null, null, null, 'between', null, 'headItem.define11', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:01', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'headItem.define12', '表头自定义项12', 'Input', null, null, null, null, 'between', null, 'headItem.define12', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:02', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'headItem.define13', '表头自定义项13', 'Input', null, null, null, null, 'between', null, 'headItem.define13', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:02', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'headItem.define14', '表头自定义项14', 'Input', null, null, null, null, 'between', null, 'headItem.define14', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:02', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'headItem.define15', '表头自定义项15', 'Input', null, null, null, null, 'between', null, 'headItem.define15', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:02', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'headItem.define16', '表头自定义项16', 'Input', null, null, null, null, 'between', null, 'headItem.define16', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:02', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'headItem.define17', '表头自定义项17', 'Input', null, null, null, null, 'between', null, 'headItem.define17', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:02', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'headItem.define18', '表头自定义项18', 'Input', null, null, null, null, 'between', null, 'headItem.define18', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:02', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'headItem.define19', '表头自定义项19', 'Input', null, null, null, null, 'between', null, 'headItem.define19', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:02', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'headItem.define20', '表头自定义项20', 'Input', null, null, null, null, 'between', null, 'headItem.define20', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:02', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'headItem.define21', '表头自定义项21', 'Input', null, null, null, null, 'between', null, 'headItem.define21', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:02', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'headItem.define22', '表头自定义项22', 'Input', null, null, null, null, 'between', null, 'headItem.define22', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:02', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'headItem.define23', '表头自定义项23', 'Input', null, null, null, null, 'between', null, 'headItem.define23', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:02', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'headItem.define24', '表头自定义项24', 'Input', null, null, null, null, 'between', null, 'headItem.define24', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:02', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'headItem.define25', '表头自定义项25', 'Input', null, null, null, null, 'between', null, 'headItem.define25', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:02', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'headItem.define26', '表头自定义项26', 'Input', null, null, null, null, 'between', null, 'headItem.define26', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:02', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'headItem.define27', '表头自定义项27', 'Input', null, null, null, null, 'between', null, 'headItem.define27', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:02', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'headItem.define28', '表头自定义项28', 'Input', null, null, null, null, 'between', null, 'headItem.define28', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:02', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'headItem.define29', '表头自定义项29', 'Input', null, null, null, null, 'between', null, 'headItem.define29', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:03', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'headItem.define30', '表头自定义项30', 'Input', null, null, null, null, 'between', null, 'headItem.define30', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:03', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.bodyItem.define1', '表体自定义项1', 'Input', null, null, null, null, 'between', null, 'orderDetails.bodyItem.define1', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:03', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.bodyItem.define2', '表体自定义项2', 'Input', null, null, null, null, 'between', null, 'orderDetails.bodyItem.define2', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:03', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.bodyItem.define3', '表体自定义项3', 'Input', null, null, null, null, 'between', null, 'orderDetails.bodyItem.define3', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:03', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.bodyItem.define4', '表体自定义项4', 'Input', null, null, null, null, 'between', null, 'orderDetails.bodyItem.define4', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:03', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.bodyItem.define5', '表体自定义项5', 'Input', null, null, null, null, 'between', null, 'orderDetails.bodyItem.define5', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:03', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.bodyItem.define6', '表体自定义项6', 'Input', null, null, null, null, 'between', null, 'orderDetails.bodyItem.define6', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:03', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.bodyItem.define7', '表体自定义项7', 'Input', null, null, null, null, 'between', null, 'orderDetails.bodyItem.define7', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:03', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.bodyItem.define8', '表体自定义项8', 'Input', null, null, null, null, 'between', null, 'orderDetails.bodyItem.define8', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:03', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.bodyItem.define9', '表体自定义项9', 'Input', null, null, null, null, 'between', null, 'orderDetails.bodyItem.define9', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:03', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.bodyItem.define10', '表体自定义项10', 'Input', null, null, null, null, 'between', null, 'orderDetails.bodyItem.define10', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:03', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.bodyItem.define11', '表体自定义项11', 'Input', null, null, null, null, 'between', null, 'orderDetails.bodyItem.define11', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:03', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.bodyItem.define12', '表体自定义项12', 'Input', null, null, null, null, 'between', null, 'orderDetails.bodyItem.define12', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:03', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.bodyItem.define13', '表体自定义项13', 'Input', null, null, null, null, 'between', null, 'orderDetails.bodyItem.define13', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:03', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.bodyItem.define14', '表体自定义项14', 'Input', null, null, null, null, 'between', null, 'orderDetails.bodyItem.define14', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:03', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.bodyItem.define15', '表体自定义项15', 'Input', null, null, null, null, 'between', null, 'orderDetails.bodyItem.define15', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:03', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.bodyItem.define16', '表体自定义项16', 'Input', null, null, null, null, 'between', null, 'orderDetails.bodyItem.define16', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:03', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.bodyItem.define17', '表体自定义项17', 'Input', null, null, null, null, 'between', null, 'orderDetails.bodyItem.define17', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:03', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.bodyItem.define18', '表体自定义项18', 'Input', null, null, null, null, 'between', null, 'orderDetails.bodyItem.define18', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:04', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.bodyItem.define19', '表体自定义项19', 'Input', null, null, null, null, 'between', null, 'orderDetails.bodyItem.define19', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:04', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.bodyItem.define20', '表体自定义项20', 'Input', null, null, null, null, 'between', null, 'orderDetails.bodyItem.define20', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:04', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.bodyItem.define21', '表体自定义项21', 'Input', null, null, null, null, 'between', null, 'orderDetails.bodyItem.define21', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:04', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.bodyItem.define22', '表体自定义项22', 'Input', null, null, null, null, 'between', null, 'orderDetails.bodyItem.define22', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:04', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.bodyItem.define23', '表体自定义项23', 'Input', null, null, null, null, 'between', null, 'orderDetails.bodyItem.define23', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:04', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.bodyItem.define24', '表体自定义项24', 'Input', null, null, null, null, 'between', null, 'orderDetails.bodyItem.define24', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:04', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.bodyItem.define25', '表体自定义项25', 'Input', null, null, null, null, 'between', null, 'orderDetails.bodyItem.define25', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:04', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.bodyItem.define26', '表体自定义项26', 'Input', null, null, null, null, 'between', null, 'orderDetails.bodyItem.define26', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:04', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.bodyItem.define27', '表体自定义项27', 'Input', null, null, null, null, 'between', null, 'orderDetails.bodyItem.define27', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:04', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.bodyItem.define28', '表体自定义项28', 'Input', null, null, null, null, 'between', null, 'orderDetails.bodyItem.define28', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:04', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.bodyItem.define29', '表体自定义项29', 'Input', null, null, null, null, 'between', null, 'orderDetails.bodyItem.define29', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:04', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'orderDetails.bodyItem.define30', '表体自定义项30', 'Input', null, null, null, null, 'between', null, 'orderDetails.bodyItem.define30', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:04', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'vendor.customItems.define1', '供应商自定义项1', 'Input', null, null, null, null, 'between', null, 'vendor.customItems.define1', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:04', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'vendor.customItems.define2', '供应商自定义项2', 'Input', null, null, null, null, 'between', null, 'vendor.customItems.define2', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:04', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'vendor.customItems.define3', '供应商自定义项3', 'Input', null, null, null, null, 'between', null, 'vendor.customItems.define3', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:05', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'vendor.customItems.define4', '供应商自定义项4', 'Input', null, null, null, null, 'between', null, 'vendor.customItems.define4', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:05', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'vendor.customItems.define5', '供应商自定义项5', 'Input', null, null, null, null, 'between', null, 'vendor.customItems.define5', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:05', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'vendor.customItems.define6', '供应商自定义项6', 'Input', null, null, null, null, 'between', null, 'vendor.customItems.define6', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:05', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'vendor.customItems.define7', '供应商自定义项7', 'Input', null, null, null, null, 'between', null, 'vendor.customItems.define7', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:05', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'vendor.customItems.define8', '供应商自定义项8', 'Input', null, null, null, null, 'between', null, 'vendor.customItems.define8', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:05', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'vendor.customItems.define9', '供应商自定义项9', 'Input', null, null, null, null, 'between', null, 'vendor.customItems.define9', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:05', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'vendor.customItems.define10', '供应商自定义项10', 'Input', null, null, null, null, 'between', null, 'vendor.customItems.define10', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:05', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'vendor.customItems.define11', '供应商自定义项11', 'Input', null, null, null, null, 'between', null, 'vendor.customItems.define11', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:05', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'vendor.customItems.define12', '供应商自定义项12', 'Input', null, null, null, null, 'between', null, 'vendor.customItems.define12', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:05', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'vendor.customItems.define13', '供应商自定义项13', 'Input', null, null, null, null, 'between', null, 'vendor.customItems.define13', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:05', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'vendor.customItems.define14', '供应商自定义项14', 'Input', null, null, null, null, 'between', null, 'vendor.customItems.define14', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:05', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'vendor.customItems.define15', '供应商自定义项15', 'Input', null, null, null, null, 'between', null, 'vendor.customItems.define15', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:05', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'vendor.customItems.define16', '供应商自定义项16', 'Input', null, null, null, null, 'between', null, 'vendor.customItems.define16', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:05', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'vendor.customItems.define17', '供应商自定义项17', 'Input', null, null, null, null, 'between', null, 'vendor.customItems.define17', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:05', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'vendor.customItems.define18', '供应商自定义项18', 'Input', null, null, null, null, 'between', null, 'vendor.customItems.define18', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:05', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'vendor.customItems.define19', '供应商自定义项19', 'Input', null, null, null, null, 'between', null, 'vendor.customItems.define19', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:05', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'vendor.customItems.define20', '供应商自定义项20', 'Input', null, null, null, null, 'between', null, 'vendor.customItems.define20', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:06', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'vendor.customItems.define21', '供应商自定义项21', 'Input', null, null, null, null, 'between', null, 'vendor.customItems.define21', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:06', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'vendor.customItems.define22', '供应商自定义项22', 'Input', null, null, null, null, 'between', null, 'vendor.customItems.define22', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:06', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'vendor.customItems.define23', '供应商自定义项23', 'Input', null, null, null, null, 'between', null, 'vendor.customItems.define23', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:06', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'vendor.customItems.define24', '供应商自定义项24', 'Input', null, null, null, null, 'between', null, 'vendor.customItems.define24', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:06', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'vendor.customItems.define25', '供应商自定义项25', 'Input', null, null, null, null, 'between', null, 'vendor.customItems.define25', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:06', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'vendor.customItems.define26', '供应商自定义项26', 'Input', null, null, null, null, 'between', null, 'vendor.customItems.define26', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:06', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'vendor.customItems.define27', '供应商自定义项27', 'Input', null, null, null, null, 'between', null, 'vendor.customItems.define27', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:06', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'vendor.customItems.define28', '供应商自定义项28', 'Input', null, null, null, null, 'between', null, 'vendor.customItems.define28', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:06', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'vendor.customItems.define29', '供应商自定义项29', 'Input', null, null, null, null, 'between', null, 'vendor.customItems.define29', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:06', null, '0');
set @idnum=@idnum+1;
insert into pb_meta_filter_item(id,`filtersId`,`itemName`,`itemTitle`,`itemType`,`referId`,`referCode`,`refType`,`refReturn`,`compareLogic`,`iprecision`,`dataSource`,`descValue`,`isCommon`,`mustInput`,`rangeInput`,`multSelect`,`allowUpdateCompare`,`orLogic`,`defaultVal1`,`defaultVal2`,`groupName`,`isSys`,`createTime`,`updateTime`,`dr`)
values  (@idnum, @filtersolutionid, 'vendor.customItems.define30', '供应商自定义项30', 'Input', null, null, null, null, 'between', null, 'vendor.customItems.define30', null, '1', '0', '0', '0', '0', '0', null, null, null, '1', '2016-12-07 14:02:06', null, '0');
